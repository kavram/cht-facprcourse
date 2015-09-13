package com.cht.firstaidcpr4me.web.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.authorize.Environment;
import net.authorize.Merchant;
import net.authorize.TransactionType;
import net.authorize.aim.Result;
import net.authorize.aim.Transaction;
import net.authorize.data.Customer;
import net.authorize.data.creditcard.CreditCard;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.exceptions.EmailExistException;
import com.cht.firstaidcpr4me.core.domain.exceptions.PaymentException;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.AuthorizeConf;
import com.cht.firstaidcpr4me.core.domain.services.CourseService;
import com.cht.firstaidcpr4me.core.domain.services.EmailService;
import com.cht.firstaidcpr4me.core.domain.services.LoginPaymentService;
import com.cht.firstaidcpr4me.web.domain.RegAndPay;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

@Controller
@RequestMapping("/internal")
public class RegisterAndPayController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(RegisterAndPayController.class);
	
	@Autowired
	private LoginPaymentService loginPaymentService;
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private EmailService emailService;
	
	@Autowired
	private AuthorizeConf authorizeConf;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getRegisterAndPaymentForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = getModelAndView("regandpayment.jsp");
		return mv;
	}	
	
	@RequestMapping(method = RequestMethod.POST, params = "reg")
	public ModelAndView submitReg(@ModelAttribute RegAndPay regpay, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		Collection<UserCourse> collCrs = new ArrayList<UserCourse>();
		ModelAndView mv = getModelAndView("regandpayment.jsp");
		if(result.hasErrors()){
			mv.addObject("regandpay", regpay);
			return mv;
		}
		User user = null;
		try {
			user = userService.getUserByEmail(regpay.getEmail());
		} catch (UserNotFoundException e1) {
			log.info("EmailExistException, email address: " + regpay.getEmail());
		}
		try{
			if(user == null)
				user = registerValidatedUser(regpay);
			if(regpay.getSelectedCourses() != null) {
				for(Long cId : regpay.getSelectedCourses()){
					UserCourse uc = courseService.getCourseById(user, cId);
					if(!uc.isPaid())
						collCrs.add(uc);
				}
				loginPaymentService.saveLoginCoursePayment(user, "CRM_PAID", collCrs);
			}
			sendEmail(user);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
			mv.addObject("error", "Sorry, please try again.");
			return mv;
		}
		mv.addObject("status", "success");
		mv.addObject("regandpay", new RegAndPay());
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, params = "regandpay")
	public ModelAndView submitRegAndPay(@ModelAttribute RegAndPay regpay, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		Collection<UserCourse> collCrs = new ArrayList<UserCourse>();
		BigDecimal totalAmnt = new BigDecimal(0);
		ModelAndView mv = getModelAndView("regandpayment.jsp");
		if(result.hasErrors()){
			mv.addObject("regandpay", regpay);
			return mv;
		}
		User user = null;
		try {
			user = userService.getUserByEmail(regpay.getEmail());
		} catch (UserNotFoundException e1) {
			log.info("EmailExistException, email address: " + regpay.getEmail());
		}
		try{
			if(user == null)
				user = registerValidatedUser(regpay);
			for(Long cId : regpay.getSelectedCourses()){
				UserCourse uc = courseService.getCourseById(user, cId);
				if(!uc.isPaid()){
					collCrs.add(uc);
					BigDecimal pr = new BigDecimal(uc.getPrice());
					totalAmnt = totalAmnt.add(pr);
				}
			}
			String transactionId = processPayment(user, regpay, totalAmnt);
			loginPaymentService.saveLoginCoursePayment(user, transactionId, collCrs);
			sendEmail(user);
		}catch (PaymentException e) {
			log.error(e.getMessage());
			mv.addObject("error", e.getMessage());
			mv.addObject("regandpay", regpay);
			return mv;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			mv.addObject("error", "Sorry, please try again.");
			mv.addObject("regandpay", regpay);
			return mv;
		}
		mv.addObject("status", "success");
		mv.addObject("regandpay", new RegAndPay());
		return mv;
	}
	
	private String processPayment(final User user, final RegAndPay regpay, final BigDecimal amnt) throws PaymentException {
		String transactionId = null;
		//String amount = payment.getAmount().substring(1);
		log.info("Amount submitted on the reg form: " + amnt);
		Merchant merchant = Merchant.createMerchant(Environment.PRODUCTION, authorizeConf.getApiLoginId(), authorizeConf.getTransactionKey());
		// create credit card
	    CreditCard creditCard = CreditCard.createCreditCard();
	    creditCard.setCreditCardNumber(regpay.getCreditcardnum());
	    creditCard.setExpirationMonth(regpay.getExprmonth());
	    creditCard.setExpirationYear(regpay.getExpryear());
	    // create transaction
	    Transaction authCaptureTransaction = merchant.createAIMTransaction(TransactionType.AUTH_CAPTURE, amnt);
	    authCaptureTransaction.setCreditCard(creditCard);
	    Customer customer = Customer.createCustomer(); 
	    customer.setAddress(regpay.getAddress());
	    customer.setCity(regpay.getCity());
	    customer.setState(regpay.getState());
	    customer.setZipPostalCode(regpay.getZipcode());
	    customer.setFirstName(regpay.getFirstName());
	    customer.setFirstName(regpay.getLastName());
	    authCaptureTransaction.setCustomer(customer);
	    
	    Result<Transaction> result = (Result<Transaction>)merchant.postTransaction(authCaptureTransaction);

	    if(result.isApproved()) {
	      log.info("Approved!");
	      log.info("Transaction Id: " + result.getTarget().getTransactionId());
	      transactionId = result.getTarget().getTransactionId();
	    } else if (result.isDeclined()) {
	    	log.info("Declined.</br>");
	    	log.info(result.getReasonResponseCode() + " : " + result.getResponseText());
	    	throw new PaymentException(result.getResponseText());
	    } else {
	    	log.error("Error.</br>");
	    	log.error(result.getReasonResponseCode() + " : " + result.getResponseText());
	    	throw new PaymentException(result.getResponseText());
	    }

	    return transactionId;
	}

	private User registerValidatedUser(RegAndPay regpay) throws Exception{
		User user = new User();
		user.setEmail(regpay.getEmail());
		user.setFirstName(regpay.getFirstName());
		user.setLastName(regpay.getLastName());
		user.setPhoneNum(regpay.getPhoneNum());
		String pass = regpay.getLastName().length() > 4 ? regpay.getLastName().substring(0, 3) : regpay.getLastName();
		pass += regpay.getPhoneNum().substring(10, 14);
		user.setPassword(pass);
		user = userService.registerValidatedUser(user);
		return user;
	}
	
	private void sendEmail(User user) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("firstName", user.getFirstName());
		model.put("lastName", user.getLastName());
		emailService.sendEmail("regAndActivated.vm", user.getEmail(), model);
		//emailService.sendEmail("receiptPayment.vm", user.getEmail(), model);
	}
	
}

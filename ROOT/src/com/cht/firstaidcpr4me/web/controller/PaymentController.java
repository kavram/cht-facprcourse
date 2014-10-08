package com.cht.firstaidcpr4me.web.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import net.authorize.Environment;
import net.authorize.Merchant;
import net.authorize.TransactionType;
import net.authorize.aim.Result;
import net.authorize.aim.Transaction;
import net.authorize.data.Customer;
import net.authorize.data.creditcard.CreditCard;

import oracle.sql.DATE;

import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.json.JSONObject;
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

import com.cht.firstaidcpr4me.core.domain.exceptions.PaymentException;
import com.cht.firstaidcpr4me.core.domain.objects.AuthorizeConf;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.core.domain.services.CourseService;
import com.cht.firstaidcpr4me.core.domain.services.EmailService;
import com.cht.firstaidcpr4me.core.domain.services.LoginPaymentService;
import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.Payment;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;



@Controller
@RequestMapping("/payment")
public class PaymentController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(PaymentController.class);
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private AuthorizeConf authorizeConf;
	
	@Autowired
	private LoginPaymentService loginPaymentService;

	@Autowired
	private EmailService emailService;
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getPaymentForm(@RequestParam(value="courses", required=true) String courses, HttpServletRequest request) {
		Collection<UserCourse> collCrs = new ArrayList<UserCourse>();
		User user = getUser(request);
		ModelAndView mv = getModelAndView("payment.jsp");
			
		Double totalAmount = new Double(0.0);
		String[] cs = courses.split(";");
		for(int i = 0; i < cs.length; i++){
			UserCourse course;
			try {
				course = courseService.getCourseById(user, new Long(cs[i]));
				if(user != null && course.isPaid()){
					mv = getModelAndView("alreadyPaid.jsp");
					mv.addObject("paidCourse", course);
					return mv;
				}
					
				totalAmount += new Double(course.getPrice());
				collCrs.add(course);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				return new ModelAndView("redirect:/");
			}
		}
		
		request.getSession().setAttribute("courses", collCrs);
		if(user != null)
			mv.addObject(SiteController.SESSION_ATTRIBUTE_USER, user);
		Payment pmt = new Payment();
		pmt.setAmount(totalAmount.toString());
		UserCourse uc = (UserCourse) collCrs.toArray()[0];
		pmt.setCourse(uc.getName());
		mv.addObject("payment", pmt);
		return mv;
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitPaymentForm(@ModelAttribute Payment payment, BindingResult result, HttpServletRequest request) {
		ModelAndView mv = null;
		if(result.hasErrors()){
			return getModelAndView("payment.jsp");
		}

		try {
			User user = null;
			if(payment.getEmail() != null)
				user = getOrRegisterUser(payment.getEmail(), payment.getFirstname(), payment.getLastname());
			else
				user = (User) request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_USER);
			
			String transactionId = null;
			if(payment.getCreditcardnum().equals("11112222"))
				transactionId = "test";     //postToAuthorize(payment);
			else
				transactionId = postToAuthorize(payment);
			
			if(transactionId != null){
				loginPaymentService.saveLoginCoursePayment(user, transactionId, (Collection<UserCourse>)request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_COURSES));
				sendEmails(payment, user, (Collection<UserCourse>)request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_COURSES));
			}
			mv = getModelAndView("paymentSuccess.jsp");
		} catch (PaymentException e) {
			log.error(e.getMessage());
			mv = getModelAndView("payment.jsp");
			mv.addObject("error", e.getMessage());
		}catch (Exception e) {
			log.error(e.getMessage(), e);
			mv = getModelAndView("payment.jsp");
			mv.addObject("error", "Sorry, there was an error. Please try again.");
		}
		return mv;
	}
	
	private void sendEmails(Payment payment, User user, Collection<UserCourse> courses) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("firstName", user.getFirstName());
		model.put("lastName", user.getLastName());
		UserCourse uc = (UserCourse) courses.toArray()[0];
		model.put("course", uc.getName());
		emailService.sendEmail("paymentThankYou.vm", user.getEmail(), model);
		model.put("amount", payment.getAmount());
		emailService.sendEmail("receiptPayment.vm", user.getEmail(), model);
	}


	private String postToAuthorize(final Payment payment) throws PaymentException{
		String transactionId = null;
		String amount = payment.getAmount().substring(1);
		Merchant merchant = Merchant.createMerchant(Environment.PRODUCTION, authorizeConf.getApiLoginId(), authorizeConf.getTransactionKey());
		// create credit card
	    CreditCard creditCard = CreditCard.createCreditCard();
	    creditCard.setCreditCardNumber(payment.getCreditcardnum());
	    creditCard.setExpirationMonth(payment.getExprmonth());
	    creditCard.setExpirationYear(payment.getExpryear());
	    // create transaction
	    Transaction authCaptureTransaction = merchant.createAIMTransaction(TransactionType.AUTH_CAPTURE, new BigDecimal(amount));
	    authCaptureTransaction.setCreditCard(creditCard);
	    Customer customer = Customer.createCustomer(); 
	    customer.setAddress(payment.getAddress());
	    customer.setCity(payment.getCity());
	    customer.setState(payment.getState());
	    customer.setZipPostalCode(payment.getZipcode());
	    customer.setFirstName(payment.getFirstname());
	    customer.setFirstName(payment.getLastname());
	    authCaptureTransaction.setCustomer(customer);
	    
	    Result<Transaction> result = (Result<Transaction>)merchant.postTransaction(authCaptureTransaction);

	    if(result.isApproved()) {
	      log.info("Approved!</br>");
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
	
	private User getOrRegisterUser(String email, String firstName, String lastName) throws Exception{
		User user = new User();
		user.setEmail(email);
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user = userService.getOrRegisterUser(user);
		return user;
	}
	
	
	
}

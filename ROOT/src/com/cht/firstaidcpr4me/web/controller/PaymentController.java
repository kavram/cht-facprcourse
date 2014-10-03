package com.cht.firstaidcpr4me.web.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import net.authorize.Environment;
import net.authorize.Merchant;
import net.authorize.TransactionType;
import net.authorize.aim.Result;
import net.authorize.aim.Transaction;
import net.authorize.data.Customer;
import net.authorize.data.creditcard.CreditCard;

import org.apache.http.client.ClientProtocolException;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.objects.AuthorizeConf;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.core.domain.services.CourseService;
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
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getPaymentForm(@RequestParam(value="courses", required=true) String courses, HttpServletRequest request) {
		Collection<UserCourse> collCrs = new ArrayList<UserCourse>();
		Double totalAmount = new Double(0.0);
		String[] cs = courses.split(";");
		for(int i = 0; i < cs.length; i++){
			UserCourse course;
			try {
				course = courseService.getCourseById(new Long(cs[i]));
				totalAmount += new Double(course.getPrice());
				collCrs.add(course);
			} catch (Exception e) {
				log.error(e.getMessage(), e);
				return new ModelAndView("redirect:/");
			}
		}
		ModelAndView mv = getModelAndView("payment.jsp");
		request.getSession().setAttribute("courses", collCrs);
		if(request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_USER) != null)
			mv.addObject(SiteController.SESSION_ATTRIBUTE_USER, request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_USER));
		mv.addObject("amount", totalAmount.toString());
		return mv;
	}
	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitPaymentForm(@RequestParam(value="payment", required=true) Payment payment, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()){
			ModelAndView mv = new ModelAndView("payment.jsp");
			
			return mv;
		}

		try {
			User user = null;
			if(payment.getEmail() != null)
				user = getOrRegisterUser(payment.getEmail(), payment.getFirstName(), payment.getLastName());
			else
				user = (User) request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_USER);
			
			String transactionId = postToAuthorize(payment);
			if(transactionId != null){
				saveUserCoursePayment(transactionId, user, (Collection<Course>)request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_COURSES));
			}
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return null;
	}
	
	private void saveUserCoursePayment(String transactionId, User user, Collection<Course> courses) {
		
	}


	private String postToAuthorize(Payment payment) throws JSONException, ClientProtocolException, IOException{
		String transactionId = null;
		String amount = payment.getAmount().substring(1);
		Merchant merchant = Merchant.createMerchant(Environment.PRODUCTION, authorizeConf.getApiLoginId(), authorizeConf.getTransactionKey());
		// create credit card
	    CreditCard creditCard = CreditCard.createCreditCard();
	    creditCard.setCreditCardNumber(payment.getCreditCardNum());
	    creditCard.setExpirationMonth(payment.getExprMonth());
	    creditCard.setExpirationYear(payment.getExprYear());
	    // create transaction
	    Transaction authCaptureTransaction = merchant.createAIMTransaction(TransactionType.AUTH_CAPTURE, new BigDecimal(amount));
	    authCaptureTransaction.setCreditCard(creditCard);
	    Customer customer = Customer.createCustomer(); 
	    customer.setAddress(payment.getAddress());
	    customer.setCity(payment.getCity());
	    customer.setState(payment.getState());
	    customer.setZipPostalCode(payment.getZipcode());
	    customer.setFirstName(payment.getFirstName());
	    customer.setFirstName(payment.getLastName());
	    authCaptureTransaction.setCustomer(customer);
	    
	    Result<Transaction> result = (Result<Transaction>)merchant.postTransaction(authCaptureTransaction);

	    if(result.isApproved()) {
	      log.debug("Approved!</br>");
	      log.debug("Transaction Id: " + result.getTarget().getTransactionId());
	      transactionId = result.getTarget().getTransactionId();
	    } else if (result.isDeclined()) {
	    	log.debug("Declined.</br>");
	    	log.debug(result.getReasonResponseCode() + " : " + result.getResponseText());
	    } else {
	    	log.debug("Error.</br>");
	    	log.debug(result.getReasonResponseCode() + " : " + result.getResponseText());
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

package com.cht.firstaidcpr4me.web.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.exceptions.EmailExistException;
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
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getRegisterAndPaymentForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = getModelAndView("regandpayment.jsp");
		return mv;
	}	
	
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView submitPaymentForm(@ModelAttribute RegAndPay regpay, BindingResult result, HttpServletRequest request, HttpServletResponse response) {
		Collection<UserCourse> collCrs = new ArrayList<UserCourse>();
		ModelAndView mv = getModelAndView("regandpayment.jsp");
		if(result.hasErrors()){
			mv.addObject("regandpay", regpay);
			return mv;
		}

		User user = new User();
		user.setEmail(regpay.getEmail());
		user.setFirstName(regpay.getFirstName());
		user.setLastName(regpay.getLastName());
		user.setPassword(regpay.getEmail());
		try{
			user = userService.registerValidatedUser(user);
			for(Long cId : regpay.getSelectedCourses()){
				UserCourse uc = courseService.getCourseById(user, cId);
				collCrs.add(uc);
			}
			loginPaymentService.saveLoginCoursePayment(user, "CRM_PAID", collCrs);
			sendEmail(user);
		}catch(EmailExistException e){
			log.error("EmailExistException, email address: " + user.getEmail());
			mv.addObject("regandpay", regpay);
			mv.addObject("error", "Email already exists");
			return mv;
		} catch (Exception e) {
			log.error(e.getMessage(), e);
			mv.addObject("error", "Sorry, please try again.");
			return mv;
		}
		mv.addObject("status", "success");
		mv.addObject("regandpay", new RegAndPay());
		return mv;
	}
	
	private void sendEmail(User user) {
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("firstName", user.getFirstName());
		model.put("lastName", user.getLastName());
		emailService.sendEmail("regAndActivated.vm", user.getEmail(), model);
		//emailService.sendEmail("receiptPayment.vm", user.getEmail(), model);
	}
	
}

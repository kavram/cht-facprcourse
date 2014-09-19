package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.exceptions.EmailValidationKeyNotFoundException;
import com.cht.firstaidcpr4me.core.domain.services.UserService;


@Controller
public class EmailValidationController extends BaseController{

	private static final Logger LOG = LoggerFactory.getLogger(EmailValidationController.class);
	
	
	@Autowired 
	private UserService userService;
	
	@RequestMapping(value = "/email-validation/{token}", method = RequestMethod.GET)
	public ModelAndView getEmailValidationPage(@PathVariable(value="token") String token, HttpServletRequest request){
		ModelAndView mv = getModelAndView("");
		mv.addObject("user", getUser(request));
		try {
			userService.validateEmail(token);
		} catch (EmailValidationKeyNotFoundException e) {
			mv.setViewName("urlNotFound.jsp");
			return mv;
		}
		mv.setViewName("emailValidation.jsp");
		return mv;
	}
	
}

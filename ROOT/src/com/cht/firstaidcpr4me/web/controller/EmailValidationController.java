package com.cht.firstaidcpr4me.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.services.UserService;


@Controller
public class EmailValidationController {

	private static final Logger LOG = LoggerFactory.getLogger(EmailValidationController.class);
	
	
	@Autowired 
	private UserService userService;
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String getEmailForm(){
		return "emailForm.jsp";
	}
	
	@RequestMapping(value = "/email-validation/{validationKey}", method = RequestMethod.GET)
	public ModelAndView getEmailValidationPage(@PathVariable("validationKey") String validationId){
		ModelAndView mv = new ModelAndView("emailValidationPage.jsp");
		mv.addObject("error", "");
		try {
			userService.validateEmail(validationId);
		} catch (Exception e) {
			LOG.error(e.getMessage());
			mv.addObject("error", "error");
		}
		
		return mv;
	}
	
}

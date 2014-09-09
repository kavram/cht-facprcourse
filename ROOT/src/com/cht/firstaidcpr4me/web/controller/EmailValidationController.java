package com.cht.firstaidcpr4me.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cht.firstaidcpr4me.core.domain.services.UserService;


@Controller
public class EmailValidationController {

	@Autowired 
	private UserService userService;
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	public String getEmailForm(){
		return "emailForm.jsp";
	}
	
	@RequestMapping(value = "/email", method = RequestMethod.POST)
	public String processEmailSubmission(@ModelAttribute("email") String email){
		
		try {
			userService.createUserAndSendEmailValidatioEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "emailSubmission.jsp";
	}
	
	
	@RequestMapping(value = "/email-validation/{validationKey}", method = RequestMethod.GET)
	public String getEmailValidationPage(@PathVariable("validationKey") String validationId){
		
		
		return "emailValidationPage.jsp";
	}
	
}

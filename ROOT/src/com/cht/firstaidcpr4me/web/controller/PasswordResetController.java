package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.exceptions.PasswordResetTokenNotFound;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.LoginForgotPassword;
import com.cht.firstaidcpr4me.core.domain.services.UserForgotPasswordService;
import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.PasswordReset;
import com.cht.firstaidcpr4me.web.domain.User;

@Controller
public class PasswordResetController extends BaseController {

	private static final Logger log = LoggerFactory.getLogger(PasswordResetController.class);

	@Autowired
	private UserForgotPasswordService userForgotPasswordService;
	
	@Autowired 
	private UserService userService;

	
	@RequestMapping(value = "/password-reset/{token}", method = RequestMethod.GET)
	public ModelAndView getPasswordResetPage(@PathVariable(value="token") String token, HttpServletRequest request, HttpServletResponse response){
		ModelAndView mv = getModelAndView("");
		try {
			LoginForgotPassword lfp = userForgotPasswordService.getLoginForgotPasswordByToken(token);
			mv.addObject("token", token);
			mv.setViewName("passwordReset.jsp");
		} catch (PasswordResetTokenNotFound e) {
			log.error("Password reset token not found, token: " + token);
			mv.setViewName("urlNotFound.jsp");
		}
		return mv;
		
	}
	
	@RequestMapping(value = "/password-reset", method = RequestMethod.POST)
	public ModelAndView submitNewPassword(@ModelAttribute PasswordReset passwordReset, HttpServletRequest request, HttpServletResponse response){
		try {
			LoginForgotPassword lfp = userForgotPasswordService.getLoginForgotPasswordByToken(passwordReset.getToken());
			User user = userService.getUserById(lfp.getLoginId());
			setUser(user, request, response);
			user.setPassword(passwordReset.getNewPassword());
			userService.updateUser(user);
			userForgotPasswordService.deactivateLoginForgotPassword(passwordReset.getToken());
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		ModelAndView mv = getModelAndView("passwordResetSuccess.jsp");		
		return mv;
	}
	
	
}

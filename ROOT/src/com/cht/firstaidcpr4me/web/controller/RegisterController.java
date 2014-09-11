package com.cht.firstaidcpr4me.web.controller;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.User;

@Controller
@RequestMapping("/register")
public class RegisterController {
	private static final Logger LOG = LoggerFactory.getLogger(RegisterController.class);
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private User user;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String register(){
		return "register.jsp";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String doRegister(@Validated @ModelAttribute("user") User user, BindingResult result,  Map<String, Object> map, HttpServletResponse response){
		if(result.hasErrors()){
			return "register.jsp";
		}
		try{
			user = userService.registerUser(user);
			Cookie cookie = new Cookie("UID", user.getUserHash());
			int exprInSeconds = 60 * 60 * 24 * 365 * 10;
			cookie.setMaxAge(exprInSeconds);
			response.addCookie(cookie);
		}catch(Exception e){
			LOG.error(e.getMessage(), e);
			map.put("reason", "Email already exists");
			return "register.jsp";
			
		}
		return "redirect:registrationSuccess.jsp";
		
	}
	
	@ModelAttribute("user")
	private User getUser() {
		return new User();
	}	
	
}

    
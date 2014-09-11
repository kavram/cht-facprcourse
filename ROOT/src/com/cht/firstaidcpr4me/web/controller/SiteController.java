package com.cht.firstaidcpr4me.web.controller;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.User;




@Controller
@RequestMapping("/")
public class SiteController {

	private static final Logger log = LoggerFactory.getLogger(SiteController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private User user;
	
	
	@RequestMapping(method = RequestMethod.GET)
	public String getHomePage(Model model, HttpServletRequest request) {
		Cookie[] arrCookies = request.getCookies();
		User loggedIn = null;
		if(arrCookies != null){
			for(int i = 0; i < arrCookies.length; i++){
				if(arrCookies[i].getName().equals("UID")){
					try {
						loggedIn = userService.getUserBySecurityHash(arrCookies[i].getValue());
					} catch (Exception e) {
						log.error(e.getMessage());
					}
					break;
				}
			}
			user = loggedIn;
		}
		return "home.jsp";
	}
	
	@ModelAttribute
	User getUser(){
		return user;
	}
	
}

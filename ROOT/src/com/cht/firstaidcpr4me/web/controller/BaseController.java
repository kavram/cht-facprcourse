package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.User;

public abstract class BaseController {
	private static final Logger log = LoggerFactory.getLogger(BaseController.class);

	
	@Autowired
	private UserService userService;

	
	public BaseController(){
		
	}
	
	public User getUser(HttpServletRequest request){
		User user = null;
		user = (User) request.getSession().getAttribute(SiteController.SESSION_ATTRIBUTE_USER);
		if(user == null){
			Cookie cook = getCookie(SiteController.UID_COOKIE, request);
			if(cook != null){
				try {
					user = userService.getUserBySecurityHash(cook.getValue());
					request.getSession().setAttribute(SiteController.SESSION_ATTRIBUTE_USER, user);
				} catch (Exception e) {
					log.error(e.getMessage());
				}
			}
		}
		return user;
	}

	public Cookie getCookie(String name, HttpServletRequest request){
		Cookie cook = null;
		Cookie[] arrCookies = request.getCookies();
		if(arrCookies != null){
			for(int i = 0; i < arrCookies.length; i++){
				if(arrCookies[i].getName().equals(name)){
					cook = arrCookies[i];
					break;
				}
			}
		}
		return cook;
	}
}

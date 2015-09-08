package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.objects.EmailConf;
import com.cht.firstaidcpr4me.core.domain.services.UserService;
import com.cht.firstaidcpr4me.web.domain.User;

public abstract class BaseController {
	private static final Logger log = LoggerFactory.getLogger(BaseController.class);

	
	@Autowired
	protected UserService userService;

	@Autowired
	protected EmailConf emailConf;
	
	public BaseController(){
		
	}

	
	public ModelAndView getModelAndView(String viewName){
		ModelAndView mv = new ModelAndView(viewName);
		mv.addObject("domain", emailConf.getSiteDomain());
		return mv;
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

	protected void setUser(User user, HttpServletRequest request, HttpServletResponse response){
		request.getSession().setAttribute(SiteController.SESSION_ATTRIBUTE_USER, user);
		setCookie(user.getUserHash(), request, response);
	}
	
	private void setCookie(String userHash, HttpServletRequest request, HttpServletResponse response){
		Cookie cookie = getCookie(SiteController.UID_COOKIE, request); 
		if(cookie == null)		
			cookie = new Cookie(SiteController.UID_COOKIE, null);
		cookie.setValue(userHash);
		int exprInSeconds = 60 * 60 * 24 * 365 * 10;
		cookie.setPath("/");
		cookie.setMaxAge(exprInSeconds);
		response.addCookie(cookie);
	}
	
}

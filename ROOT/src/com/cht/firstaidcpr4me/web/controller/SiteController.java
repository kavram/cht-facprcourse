package com.cht.firstaidcpr4me.web.controller;


import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/")
public class SiteController extends BaseController{
	private static final Logger log = LoggerFactory.getLogger(SiteController.class);
	public static final String SESSION_ATTRIBUTE_USER = "user";
	public static final String SESSION_ATTRIBUTE_COURSES = "courses";
	public static final String UID_COOKIE = "UID";
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getHomePage(Model model, HttpServletRequest request) {
		ModelAndView mv = getModelAndView("index.jsp");
		mv.addObject("user", getUser(request));
		
		return mv;
	}
	
	
}

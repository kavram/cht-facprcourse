package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/aboutus")
public class AboutUsController extends BaseController {

	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getContact(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("aboutus.jsp");
		mv.addObject("user", getUser(request));
		return mv;
	}
	
	
}

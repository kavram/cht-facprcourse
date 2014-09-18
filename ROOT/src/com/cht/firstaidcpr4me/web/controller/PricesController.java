package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/certify")
public class PricesController extends BaseController {

	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getPrices(HttpServletRequest request){
		ModelAndView mv = new ModelAndView("certify.jsp");
		mv.addObject("user", getUser(request));
		return mv;
	}
	
	
}

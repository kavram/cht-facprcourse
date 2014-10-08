package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ExceptionHandlingController extends BaseController {

	@RequestMapping(value="/pageNotFound")
    public ModelAndView handlePageNotFound(HttpServletRequest request) {
		ModelAndView mv = getModelAndView("urlNotFound.jsp");
		mv.addObject("user", getUser(request));
        return mv;
    }	
	
}

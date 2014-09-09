package com.cht.firstaidcpr4me.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/courses")
public class CoursesController {

	
	@RequestMapping(method = RequestMethod.GET)
	public String courses(){
		return "courses.jsp";
	}
	
	
}

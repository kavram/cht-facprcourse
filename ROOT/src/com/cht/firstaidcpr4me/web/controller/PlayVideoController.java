package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/playvideo")
public class PlayVideoController extends BaseController{

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView getContact(@RequestParam(value="video", required=true) String video, @RequestParam(value="name", required=true) String name, HttpServletRequest request){
		ModelAndView mv = getModelAndView("");
		mv.setViewName("playvideo.jsp");
		mv.addObject("video", video);
		mv.addObject("name", name);
		return mv;
	}
	
}

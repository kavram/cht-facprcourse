package com.cht.firstaidcpr4me.web.controller;

import java.util.Collection;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.services.CourseService;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;


@Controller
@RequestMapping("/courses")
public class CoursesController extends BaseController{

	@Autowired
	private CourseService courseService;
	
	
	
	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView courses(HttpServletRequest request){
		ModelAndView mv = getModelAndView("courses.jsp");
		User user = getUser(request);
		Collection<UserCourse> courses = courseService.getUserCourses(user);
		mv.addObject("user", user);
		mv.addObject("courses", courses);
		return mv;
	}
	
	
}

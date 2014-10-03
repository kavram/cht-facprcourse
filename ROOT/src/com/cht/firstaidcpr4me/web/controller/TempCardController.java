package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.services.CourseService;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

@Controller
@RequestMapping("/printtempcard")
public class TempCardController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(TempCardController.class);
	
	@Autowired
	private CourseService courseService;
	
	
	
	@RequestMapping(method = RequestMethod.GET)	
	public ModelAndView getQuiz(HttpServletRequest request){
		ModelAndView mv = getModelAndView("tempCard.jsp");
		try {
			User user = getUser(request);
			if(user == null)
				return new ModelAndView("redirect:index");
			UserCourse course = (UserCourse) request.getSession().getAttribute(QuizController.COURSE);
			if(course == null || !course.isPaid())
				return new ModelAndView("redirect:courses");
			
			
			mv.addObject("course", course);
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}
	
}

package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

@Controller
@RequestMapping("/tempcard")
public class TempCardController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(TempCardController.class);
	
	
	@RequestMapping(method = RequestMethod.GET)	
	public ModelAndView getQuiz(HttpServletRequest request){
		try {
			User user = getUser(request);
			if(user == null)
				return new ModelAndView("redirect:/");
			UserCourse course = (UserCourse) request.getSession().getAttribute(QuizController.COURSE);
			if(course == null || !course.isPaid() || !course.isCompleted())
				return new ModelAndView("redirect:/courses");
		}catch (Exception e) {
			log.error(e.getMessage(), e);
			return new ModelAndView("redirect:/");
		}
		return new ModelAndView("forward:/gen-temp-cert-pdf");
	}
	
}

package com.cht.firstaidcpr4me.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.cht.firstaidcpr4me.core.domain.exceptions.QuestionNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.Answer;
import com.cht.firstaidcpr4me.core.domain.objects.Question;
import com.cht.firstaidcpr4me.core.domain.services.CourseService;
import com.cht.firstaidcpr4me.core.domain.services.QuestionService;
import com.cht.firstaidcpr4me.web.domain.AjaxResponse;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;


@Controller
@RequestMapping("/quiz")
public class QuizController extends BaseController {
	private static final Logger log = LoggerFactory.getLogger(QuizController.class);
	
	public final static String COURSE = "course";

	@Autowired
	private CourseService courseService;
	
	@Autowired
	private QuestionService questionService;
	
	
	@RequestMapping(method = RequestMethod.GET)	
	public ModelAndView getQuiz(@RequestParam(value="courses", required=true) String courses, HttpServletRequest request){
		ModelAndView mv = getModelAndView("quiz.jsp");
		try {
			User user = getUser(request);
			if(user == null)
				return new ModelAndView("redirect:index");
			UserCourse course = courseService.getPaidCourseById(user, new Long(courses));
			if(!course.isPaid())
				return new ModelAndView("redirect:courses");
			request.getSession().setAttribute(COURSE, course);
			mv.addObject("course", course);
		} catch (NumberFormatException e) {
			log.error(e.getMessage(), e);
		}catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return mv;
	}

	@RequestMapping("/submit")
	public @ResponseBody AjaxResponse processLoginSubmission(@RequestParam(value="params", required=true) String params, HttpServletRequest request, HttpServletResponse response){
		AjaxResponse ar = new AjaxResponse();
		try {
			JSONArray jArr = new JSONArray(params);
			int score = 0;
			for(int i = 0; i < jArr.length(); i++){
				JSONObject jo = jArr.getJSONObject(i);
				Long qId = jo.getLong("q");
				Long aId = jo.getLong("a");
				if(isAnswerCorrect(aId, questionService.getQuestionById(qId)))
					score++;
			}
			float res = score / jArr.length() * 100;
			if(res > 50){
				completeUserCourse(request);
				ar.setStatus("pass");
			}else
				ar.setStatus("fail");
		} catch (JSONException e) {
			log.error(e.getMessage(), e);
			ar.setStatus("error");
		} catch (QuestionNotFoundException e) {
			log.error(e.getMessage(), e);
			ar.setStatus("error");
		}
		return ar;
	}
	
	private void completeUserCourse(HttpServletRequest request) {
		UserCourse uCourse = (UserCourse) request.getSession().getAttribute(COURSE);
		courseService.saveCompletedCourse(uCourse);
		uCourse.setCompleted(true);
	}

	private boolean isAnswerCorrect(Long ansId, Question que){
		for(Answer a : que.getAnswers()){
			if(a.getCorrectAns().longValue() == QuestionService.CORRECT_ANSWER && a.getId().intValue() == ansId.intValue())
				return true;
		}
		return false;
	}
	
}

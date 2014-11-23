package com.cht.firstaidcpr4me.core.domain.services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.CourseDao;
import com.cht.firstaidcpr4me.core.domain.dao.LoginPaidCourseDao;
import com.cht.firstaidcpr4me.core.domain.exceptions.CourseNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.Answer;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.core.domain.objects.LoginCompletedCourse;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;
import com.cht.firstaidcpr4me.core.domain.objects.Question;
import com.cht.firstaidcpr4me.core.domain.objects.Video;
import com.cht.firstaidcpr4me.web.domain.CourseQuestion;
import com.cht.firstaidcpr4me.web.domain.CourseVideo;
import com.cht.firstaidcpr4me.web.domain.QAnswer;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;

	@Autowired
	private LoginPaidCourseDao loginPaidCourseDao;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public UserCourse getCourseById(User user, Long id) throws CourseNotFoundException {
		Collection coll = courseDao.getCourseById(id);
		if(coll.isEmpty())
			throw new CourseNotFoundException();
		Course course = (Course) coll.toArray()[0];
		return getUCourse(user, course);
	}

	private UserCourse getUCourse(User user, Course course){
		UserCourse uc = new UserCourse();
		uc.setCourseId(course.getId());
		uc.setName(course.getName());
		uc.setPrice(course.getPrice().toString());
		uc.setVideos(getCourseVideos(course));
		uc.setQuestions(getCourseQuestions(course));
		if(user != null){
			uc.setUser(user);
			if(loginPaidCourseDao.getLoginPaidCourseById(user.getId(), course.getId()).isEmpty()){
				uc.setPaid(false);
			}else
				uc.setPaid(true);
			if(courseDao.getLoginCompletedCourse(user.getId(), course.getId()).isEmpty())
				uc.setCompleted(false);
			else
				uc.setCompleted(true);
		}else{
			uc.setPaid(false);
			uc.setCompleted(false);
		}
		return uc;
	}
	
	
	private Collection<CourseQuestion> getCourseQuestions(Course course) {
		Collection<CourseQuestion> collQuestions = new ArrayList<CourseQuestion>();
		for(Question q : course.getQuestions()){
			CourseQuestion cq = new CourseQuestion();
			cq.setId(q.getId());
			cq.setQuestion(q.getQuestion());
			cq.setNumAnswers(q.getNumAnswers());
			Collection<QAnswer> collQA = new ArrayList<QAnswer>();
			for(Answer a : q.getAnswers()){
				QAnswer qa = new QAnswer();
				qa.setId(a.getId());
				qa.setAnswer(a.getAnswer());
				qa.setCorrectAns(a.getCorrectAns());
				collQA.add(qa);
			}
			cq.setAnswers(collQA);
			collQuestions.add(cq);
		}
		return collQuestions;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Collection<UserCourse> getUserCourses(User user) {
		Collection<UserCourse> collUserCourse = new ArrayList<UserCourse>();
		Collection<Course> coll = courseDao.getCourses();
		for(Course course : coll){
			collUserCourse.add(getUCourse(user, course));
		}
		return collUserCourse;
	}
	
	private Collection<CourseVideo> getCourseVideos(Course course){
		Collection<CourseVideo> coll = new ArrayList<CourseVideo>();
		for(Video v : course.getVideos()){
			CourseVideo cv = new CourseVideo();
			cv.setActiveThumbnail(v.getActiveThumbnail());
			cv.setInactiveThumbnail(v.getInactiveThumbnail());
			cv.setName(v.getName());
			cv.setUrl(v.getUrl());
			cv.setVideoId(v.getId());
			coll.add(cv);
		}
		return coll;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void saveCompletedCourse(UserCourse uCourse) {
		LoginCompletedCourse lcc = new LoginCompletedCourse();
		lcc.setCourseId(uCourse.getCourseId());
		lcc.setLoginId(uCourse.getUser().getId());
		lcc.setCertIssued(false);
		courseDao.saveLoginCompletedCourse(lcc);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public UserCourse getPaidCourseById(User user, Long courseId) throws CourseNotFoundException {
		Collection coll = courseDao.getCourseById(courseId);
		if(coll.isEmpty())
			throw new CourseNotFoundException();
		Course course = (Course) coll.toArray()[0];
		return getUCourse(user, course);
	}

}

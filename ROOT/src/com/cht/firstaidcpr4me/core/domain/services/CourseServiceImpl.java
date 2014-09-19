package com.cht.firstaidcpr4me.core.domain.services;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.CourseDao;
import com.cht.firstaidcpr4me.core.domain.dao.LoginPaidCourseDao;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;
import com.cht.firstaidcpr4me.core.domain.objects.Video;
import com.cht.firstaidcpr4me.web.domain.CourseVideo;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;

	@Autowired
	private LoginPaidCourseDao loginPaidCourseDao;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Course getCourseById(Long id) throws Exception {
		Collection coll = courseDao.getCourseById(id);
		if(coll.isEmpty())
			throw new Exception("Course not found for id: " + id);
		Course course = (Course) coll.toArray()[0];
		return course;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Collection<UserCourse> getUserCourses(User user) {
		Collection<UserCourse> collUserCourse = new ArrayList<UserCourse>();
		Collection<Course> coll = courseDao.getCourses();
		
		for(Course course : coll){
			UserCourse uc = new UserCourse();
			uc.setCourseId(course.getId());
			uc.setName(course.getName());
			uc.setPrice(course.getPrice().toString());
			uc.setVideos(getCourseVideos(course));
			if(user != null){
				if(loginPaidCourseDao.getLoginPaidCourseById(user.getId(), course.getId()).isEmpty()){
					uc.setPaid(false);
				}else
					uc.setPaid(true);
			}else
				uc.setPaid(false);
			collUserCourse.add(uc);
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

}

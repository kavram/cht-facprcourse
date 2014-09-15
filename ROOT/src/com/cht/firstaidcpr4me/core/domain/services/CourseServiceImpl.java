package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.CourseDao;
import com.cht.firstaidcpr4me.core.domain.objects.Course;

public class CourseServiceImpl implements CourseService {

	@Autowired
	private CourseDao courseDao;
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Course getCourseById(Long id) throws Exception {
		Collection coll = courseDao.getCourseById(id);
		if(coll.isEmpty())
			throw new Exception("Course not found for id: " + id);
		Course course = (Course) coll.toArray()[0];
		return course;
	}

}

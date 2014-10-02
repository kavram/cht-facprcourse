package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.LoginCompletedCourse;

public interface CourseDao {

	
	public Collection getCourseById(Long courseId);
	
	public Collection getCourses();
	
	public LoginCompletedCourse saveLoginCompletedCourse(LoginCompletedCourse complCourse);
	
}

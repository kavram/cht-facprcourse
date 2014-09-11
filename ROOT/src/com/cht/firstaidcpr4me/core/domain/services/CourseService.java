package com.cht.firstaidcpr4me.core.domain.services;

import com.cht.firstaidcpr4me.core.domain.objects.Course;

public interface CourseService {

	public Course getCourseById(Long id) throws Exception;
	
}

package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

public interface CourseService {

	public Course getCourseById(Long id) throws Exception;

	public Collection<UserCourse> getUserCourses(User user);
}

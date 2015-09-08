package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.exceptions.CourseNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

public interface CourseService {

	public Collection<UserCourse> getUserCourses(User user);

	public void saveCompletedCourse(UserCourse uCourse);

	public UserCourse getPaidCourseById(User user, Long courseId) throws CourseNotFoundException;

	public UserCourse getCourseById(User user, Long id) throws CourseNotFoundException;

	public Collection<Course> getCourses();
}

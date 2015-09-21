package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;

public interface LoginPaidCourseDao {

	public LoginPaidCourse save(LoginPaidCourse lpc);
	public Collection<LoginPaidCourse> getLoginPaidCourseById(Long loginId, Long courseId);
	public Collection<LoginPaidCourse> getLoginPaidCourses(Long loginId);
	void deleteLoginPaidCourses(Long loginId);
	
	
}

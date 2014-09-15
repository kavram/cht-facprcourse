package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;
import com.cht.firstaidcpr4me.web.domain.User;

public interface LoginPaymentService {

	public void saveLoginCoursePayment(User user, String transactionId, Collection<Course> courses);
	public LoginPaidCourse getLoginCoursePaymentById(Long loginId, Long courseId) throws Exception;
	
}

package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;
import com.cht.firstaidcpr4me.web.domain.User;
import com.cht.firstaidcpr4me.web.domain.UserCourse;

public interface LoginPaymentService {

	public LoginPaidCourse getLoginCoursePaymentById(Long loginId, Long courseId) throws Exception;
	public void saveLoginCoursePayment(User user, String transactionId, Collection<UserCourse> courses);
	void deleteLoginPaidCourse(Long loginId) throws Exception;
	
}

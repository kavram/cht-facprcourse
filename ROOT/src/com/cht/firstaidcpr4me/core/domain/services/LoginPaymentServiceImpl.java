package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginPaidCourseDao;
import com.cht.firstaidcpr4me.core.domain.objects.Course;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;
import com.cht.firstaidcpr4me.web.domain.User;

public class LoginPaymentServiceImpl implements LoginPaymentService {

	@Autowired
	LoginPaidCourseDao lpcDao;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void saveLoginCoursePayment(User user, String transactionId, Collection<Course> courses) {
		for(Course cr : courses){
			LoginPaidCourse lpc = new LoginPaidCourse();
			lpc.setPaymentTransactionId(transactionId);
			lpc.setAmount(cr.getPrice());
			lpc.setCourseId(cr.getId());
			lpc.setLoginId(user.getId());
			lpc = lpcDao.save(lpc);
		}
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public LoginPaidCourse getLoginCoursePaymentById(Long loginId, Long courseId) throws Exception {
		Collection<LoginPaidCourse> coll = lpcDao.getLoginPaidCourseById(loginId, courseId);
		if(coll.isEmpty())
			throw new Exception("LoginPaidCourse is not found.");
		LoginPaidCourse lp = (LoginPaidCourse) coll.toArray()[0];
		return lp;
	}



}

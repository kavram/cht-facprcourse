package com.cht.firstaidcpr4me.core.domain.services;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginPaidCourseDao;
import com.cht.firstaidcpr4me.core.domain.dao.LoginPaymentDao;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;
import com.cht.firstaidcpr4me.core.domain.objects.LoginPayment;
import com.cht.firstaidcpr4me.web.domain.User;

public class LoginPaymentServiceImpl implements LoginPaymentService {

	@Autowired
	LoginPaymentDao lpDao;

	@Autowired
	LoginPaidCourseDao lpcDao;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public LoginPayment saveLoginPayment(User user, Map<Long, Double> courses) {
		LoginPayment loginPayment = new LoginPayment();
		loginPayment.setLoginId(user.getId());
		loginPayment.setPaymentStatus(TRANSACTION_STATUS_PENDING);
		Double amount = new Double(0.0);
		loginPayment.setAmount(amount);
		loginPayment = lpDao.save(loginPayment);
		//Set<LoginPaidCourse> list = new HashSet<LoginPaidCourse>();
		Set<Entry<Long, Double>> set = courses.entrySet();
		for(Entry<Long, Double> entr : set){
			LoginPaidCourse lpc = new LoginPaidCourse();
			lpc.setLoginPayment(loginPayment);
			lpc.setAmount(entr.getValue());
			lpc.setCourseId(entr.getKey());
			lpc = lpcDao.save(lpc);
			amount += entr.getValue();
			loginPayment.getLoginPaidCourses().add(lpc);
		}
		loginPayment.setAmount(amount);
		lpDao.update(loginPayment);
		return loginPayment;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public LoginPayment getLoginPaymentById(Long id) throws Exception {
		Collection coll = lpDao.getById(id);
		if(coll.isEmpty())
			throw new Exception("LoginPayment not found.");
		LoginPayment lp = (LoginPayment) coll.toArray()[0];
		return lp;
	}


	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void updateLoginPayment(LoginPayment lp) {
		lpDao.update(lp);
	}

}

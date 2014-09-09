package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Map;

import com.cht.firstaidcpr4me.core.domain.objects.LoginPayment;
import com.cht.firstaidcpr4me.web.domain.User;

public interface LoginPaymentService {

	public static final Long TRANSACTION_STATUS_PENDING = new Long(0); 
	public static final Long TRANSACTION_STATUS_APPROVED = new Long(1);
	
	
	public LoginPayment saveLoginPayment(User user, Map<Long, Double> courses);
	public LoginPayment getLoginPaymentById(Long id) throws Exception;
	public void updateLoginPayment(LoginPayment lp);
	
}

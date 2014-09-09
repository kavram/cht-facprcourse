package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.LoginPayment;

public interface LoginPaymentDao {

	public LoginPayment save(LoginPayment lp);
	public void update(LoginPayment lp);
	public Collection getById(Long id);
	
}

package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.LoginEmailValidation;

public interface LoginEmailValidationDao {

	public LoginEmailValidation save(LoginEmailValidation lev);

	public Collection getLoginEmailValidationByKey(String key, Long status);
	
}

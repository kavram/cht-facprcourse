package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.LoginForgotPassword;

public interface LoginForgotPasswordDao {

	
	public LoginForgotPassword saveLoginForgotPassword(LoginForgotPassword lfp);
	public Collection getActiveLoginForgotPasswordByToken(String token);
	public void updateLoginForgotPassword(LoginForgotPassword lfp);
	
}

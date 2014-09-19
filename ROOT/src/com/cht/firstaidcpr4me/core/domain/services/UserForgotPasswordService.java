package com.cht.firstaidcpr4me.core.domain.services;

import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.LoginForgotPassword;

public interface UserForgotPasswordService {

	public final static Long ACTIVE = new Long(0);
	public final static Long DISABLE = new Long(1);
	
	public void generateLoginForgotPassword(String email) throws UserNotFoundException;
	
	public LoginForgotPassword getLoginForgotPasswordByKey(String key);
	
	public void deactivateLoginForgotPassword(String key);
	
}

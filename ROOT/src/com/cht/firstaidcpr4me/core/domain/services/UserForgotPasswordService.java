package com.cht.firstaidcpr4me.core.domain.services;

import com.cht.firstaidcpr4me.core.domain.exceptions.PasswordResetTokenNotFound;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.LoginForgotPassword;

public interface UserForgotPasswordService {

	public final static Long ACTIVE = new Long(0);
	public final static Long DISABLE = new Long(1);
	
	public void generateLoginForgotPassword(String email) throws UserNotFoundException;
	
	public LoginForgotPassword getLoginForgotPasswordByToken(String token) throws PasswordResetTokenNotFound;
	
	public void deactivateLoginForgotPassword(String token);

	String generateForgotPasswordToken(String email) throws UserNotFoundException;
	
}

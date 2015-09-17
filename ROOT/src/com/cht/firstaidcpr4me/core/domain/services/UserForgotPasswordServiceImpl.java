package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginForgotPasswordDao;
import com.cht.firstaidcpr4me.core.domain.exceptions.PasswordResetTokenNotFound;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.EmailConf;
import com.cht.firstaidcpr4me.core.domain.objects.LoginForgotPassword;
import com.cht.firstaidcpr4me.web.domain.User;

public class UserForgotPasswordServiceImpl implements	UserForgotPasswordService {

	@Autowired
	LoginForgotPasswordDao loginForgotPasswordDao;
	
	@Autowired
	UserService userService;
	
	@Autowired
	private EmailService emailService;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void generateLoginForgotPassword(String email) throws UserNotFoundException {
		User user = userService.getUserByEmail(email);
		LoginForgotPassword lfp = new LoginForgotPassword();
		lfp.setToken(UUID.randomUUID().toString());
		lfp.setLoginId(user.getId());
		lfp.setStatus(UserForgotPasswordService.ACTIVE);
		lfp = loginForgotPasswordDao.saveLoginForgotPassword(lfp);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("token", lfp.getToken());
		model.put("firstName", user.getFirstName());
		model.put("lastName", user.getLastName());
		emailService.sendEmail("passwordReset.vm", email, model);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public String generateForgotPasswordToken(String email) throws UserNotFoundException {
		User user = userService.getUserByEmail(email);
		LoginForgotPassword lfp = new LoginForgotPassword();
		lfp.setToken(UUID.randomUUID().toString());
		lfp.setLoginId(user.getId());
		lfp.setStatus(UserForgotPasswordService.ACTIVE);
		lfp = loginForgotPasswordDao.saveLoginForgotPassword(lfp);
		return lfp.getToken();
	}
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public LoginForgotPassword getLoginForgotPasswordByToken(String token) throws PasswordResetTokenNotFound {
		Collection coll = loginForgotPasswordDao.getActiveLoginForgotPasswordByToken(token);
		if(coll.isEmpty())
			throw new PasswordResetTokenNotFound();
		return (LoginForgotPassword) coll.toArray()[0];
	}

	@Override
	public void deactivateLoginForgotPassword(String key) {
		Collection<LoginForgotPassword> coll = loginForgotPasswordDao.getActiveLoginForgotPasswordByToken(key);
		if(coll.isEmpty())
			return;
		LoginForgotPassword lfp = (LoginForgotPassword) coll.toArray()[0];
		lfp.setStatus(UserForgotPasswordService.DISABLE);
		loginForgotPasswordDao.updateLoginForgotPassword(lfp);
	}

}

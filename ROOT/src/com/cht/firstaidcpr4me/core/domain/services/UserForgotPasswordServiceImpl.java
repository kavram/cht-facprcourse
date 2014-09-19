package com.cht.firstaidcpr4me.core.domain.services;

import java.util.UUID;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginForgotPasswordDao;
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
	private EmailConf emailConf;
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void generateLoginForgotPassword(String email) throws UserNotFoundException {
		User user = userService.getUserByEmail(email);
		LoginForgotPassword lfp = new LoginForgotPassword();
		lfp.setKey(UUID.randomUUID().toString());
		lfp.setLoginId(user.getId());
		lfp.setStatus(UserForgotPasswordService.ACTIVE);
		lfp = loginForgotPasswordDao.saveLoginForgotPassword(lfp);
		sendForgotPasswordEmail(user, lfp);
	}

	private void sendForgotPasswordEmail(User user, LoginForgotPassword lfp) {
		String message = "Please click on this link to reset your password: " + emailConf.getSiteDomain() + "/password-reset/" +
		lfp.getKey() + " Thank you.";
		try {
			send(user.getEmail(), "firstaidcprcourse.com password reset", message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void send(String recipient, String subject, String message) throws Exception{
		HtmlEmail email = new HtmlEmail();
		email.setHostName(emailConf.getSmtpHost());
		email.setFrom(emailConf.getFromAddress());
		email.setSubject(subject);
		email.setHtmlMsg(message);
		email.addTo(recipient);
		email.send();
	}
	
	
	@Override
	public LoginForgotPassword getLoginForgotPasswordByKey(String key) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deactivateLoginForgotPassword(String key) {
		// TODO Auto-generated method stub

	}

}

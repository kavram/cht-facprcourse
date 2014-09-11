package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import java.util.UUID;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginDAO;
import com.cht.firstaidcpr4me.core.domain.dao.LoginEmailValidationDao;
import com.cht.firstaidcpr4me.core.domain.objects.Login;
import com.cht.firstaidcpr4me.core.domain.objects.LoginEmailValidation;
import com.cht.firstaidcpr4me.web.domain.User;


public class UserServiceImpl implements UserService {

	private static final Long USER_EMAIL_VALIDATION_PENDING = new Long(0);
	private static final Long USER_EMAIL_VALIDATED = new Long(1);

	@Autowired
    private LoginDAO loginDao;

	@Autowired
	private LoginEmailValidationDao loginEmailValidationDao;
	
	@Override
	public boolean isLoginExists(String email) {
		Collection res = loginDao.getLoginByEmail(email);
		return !res.isEmpty();
	}

	@Override 
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User registerUser(User user) throws Exception {
		if(isLoginExists(user.getEmail())){
			throw new Exception("Email exists");
		}
		Login lg = new Login();
		lg.setEmail(user.getEmail());
		lg.setFirstName(user.getFirstName());
		lg.setLastName(user.getLastName());
		lg.setLevel(USER_EMAIL_VALIDATION_PENDING);
		lg.setSecureHash(UUID.randomUUID().toString());
		lg = loginDao.saveLogin(lg);
		user.setId(lg.getId());
		user.setUserHash(lg.getSecureHash());
		sendEmailValidation(lg);
		return user;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User getUserById(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User getUserBySecurityHash(String hash) throws Exception {
		Collection coll = loginDao.getLoginByHash(hash);
		if(coll.isEmpty())
			throw new Exception("User not found for hash: " + hash);
		Login login = (Login) coll.toArray()[0];
		User user = new User(login);
		return user;
	}
	
	
	private void sendEmailValidation(Login lg){
		LoginEmailValidation lev = new LoginEmailValidation();
		lev.setLoginId(lg.getId());
		lev.setValidationKey(UUID.randomUUID().toString());
		lev.setValidationStatus(USER_EMAIL_VALIDATION_PENDING);
		lev = loginEmailValidationDao.save(lev);
		String message = "Please click on this link to validate your email: http://localhost/email-validation/" +
		lev.getValidationKey() + " Thank you.";
		try {
			send(lg.getEmail(), "firstaidcprcourse.com email validation", message);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void send(String recipient, String subject, String message) throws Exception{
		HtmlEmail email = new HtmlEmail();
		email.setHostName("firstaidcprcourse.com");
		email.setFrom("mailer@firstaidcprcourse.com");
		email.setSubject(subject);
		email.setHtmlMsg(message);
		email.addTo(recipient);
		email.send();
}
	
	
	@Override
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRES_NEW)	
	public void validateEmail(String validationKey) throws Exception {
		Collection<LoginEmailValidation> coll = loginEmailValidationDao.getLoginEmailValidationByKey(validationKey, USER_EMAIL_VALIDATION_PENDING);
		if(coll.isEmpty())
			throw new Exception("validation key is not found");
	
		LoginEmailValidation lev = (LoginEmailValidation) coll.toArray()[0];
		lev.setValidationStatus(USER_EMAIL_VALIDATED);
		loginEmailValidationDao.updateLoginEmailValidation(lev);
		Collection<Login> collLogin = (Collection<Login>) loginDao.getLoginById(lev.getLoginId());
		Login login = (Login) collLogin.toArray()[0];
		login.setLevel(USER_EMAIL_VALIDATED);
		loginDao.updateLogin(login);
	}
	
}

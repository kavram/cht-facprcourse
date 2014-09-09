package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginDAO;
import com.cht.firstaidcpr4me.core.domain.dao.LoginEmailValidationDao;
import com.cht.firstaidcpr4me.core.domain.objects.Login;
import com.cht.firstaidcpr4me.core.domain.objects.LoginEmailValidation;
import com.cht.firstaidcpr4me.web.domain.User;


//@Transactional
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
		lg = loginDao.saveLogin(lg);
		user.setId(lg.getId());
		return user;
	}

	@Override
	public User getUserById(Long userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)	
	public void createUserAndSendEmailValidatioEmail(String email) throws Exception {
		if(isLoginExists(email)){
			throw new Exception("Email exists");
		}
		Login lg = new Login();
		lg.setLevel(USER_EMAIL_VALIDATION_PENDING);
		lg.setSecureHash(UUID.randomUUID().toString());
		lg.setEmail(email);
		lg = loginDao.saveLogin(lg);
		sendEmailValidation(lg);
	}

	private void sendEmailValidation(Login lg){
		LoginEmailValidation lev = new LoginEmailValidation();
		lev.setLoginId(lg.getId());
		lev.setValidationKey(UUID.randomUUID().toString());
		lev.setValidationStatus(USER_EMAIL_VALIDATION_PENDING);
		lev = loginEmailValidationDao.save(lev);
		//send email validation
	}

	@Override
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRES_NEW)	
	public void validateEmail(String validationKey) throws Exception {
		//Collection<LoginEmailValidation> coll = loginEmailValidationDao.getLoginEmailValidationByKey(validationKey);
		//if(coll.isEmpty())
		//	throw new Exception("validation key is not found");
	}
	
	//coll.
}
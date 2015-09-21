package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.LoginDAO;
import com.cht.firstaidcpr4me.core.domain.dao.LoginEmailValidationDao;
import com.cht.firstaidcpr4me.core.domain.exceptions.EmailExistException;
import com.cht.firstaidcpr4me.core.domain.exceptions.EmailValidationKeyNotFoundException;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.Login;
import com.cht.firstaidcpr4me.core.domain.objects.LoginEmailValidation;
import com.cht.firstaidcpr4me.web.domain.User;


public class UserServiceImpl implements UserService {

	@Autowired
    private LoginDAO loginDao;

	@Autowired
	private LoginEmailValidationDao loginEmailValidationDao;

	@Autowired
	private EmailService emailService;
	
	@Override
	public boolean isLoginExists(String email) {
		Collection res = loginDao.getLoginByEmail(email);
		return !res.isEmpty();
	}

	@Override 
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User registerUser(User user) throws EmailExistException {
		if(isLoginExists(user.getEmail())){
			throw new EmailExistException();
		}
		Login lg = new Login();
		lg.setEmail(user.getEmail());
		lg.setPassword(user.getPassword());
		lg.setFirstName(user.getFirstName());
		lg.setLastName(user.getLastName());
		lg.setLevel(USER_EMAIL_VALIDATION_PENDING);
		lg.setSecureHash(UUID.randomUUID().toString());
		lg = loginDao.saveLogin(lg);
		sendEmailValidation(lg);
		return new User(lg);
	}

	@Override 
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User getOrRegisterUser(User user) throws Exception {
		Collection coll = loginDao.getLoginByEmail(user.getEmail());
		if(!coll.isEmpty()){
			Login existLogin = (Login) coll.toArray()[0];
			user.setId(existLogin.getId());
			return user;
		}
		
		Login lg = new Login();
		lg.setEmail(user.getEmail());
		lg.setPassword(user.getPassword());
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
	public User getUserById(Long userId) throws UserNotFoundException {
		Collection coll = loginDao.getLoginById(userId);
		if(coll.isEmpty())
			throw new UserNotFoundException();
		Login login = (Login) coll.toArray()[0];
		User user = new User(login);
		return user;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User getUserBySecurityHash(String hash) throws UserNotFoundException {
		Collection coll = loginDao.getLoginByHash(hash);
		if(coll.isEmpty())
			throw new UserNotFoundException();
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
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("token", lev.getValidationKey());
		model.put("firstName", lg.getFirstName());
		model.put("lastName", lg.getLastName());
		emailService.sendEmail("confirmEmail.vm", lg.getEmail(), model);
	}

	@Override
	@SuppressWarnings("unchecked")
	@Transactional(propagation = Propagation.REQUIRES_NEW)	
	public User validateEmail(String validationKey) throws EmailValidationKeyNotFoundException {
		Collection<LoginEmailValidation> coll = loginEmailValidationDao.getLoginEmailValidationByKey(validationKey, USER_EMAIL_VALIDATION_PENDING);
		if(coll.isEmpty())
			throw new EmailValidationKeyNotFoundException();
	
		LoginEmailValidation lev = (LoginEmailValidation) coll.toArray()[0];
		lev.setValidationStatus(USER_EMAIL_VALIDATED);
		loginEmailValidationDao.updateLoginEmailValidation(lev);
		Collection<Login> collLogin = (Collection<Login>) loginDao.getLoginById(lev.getLoginId());
		Login login = (Login) collLogin.toArray()[0];
		login.setLevel(USER_EMAIL_VALIDATED);
		loginDao.updateLogin(login);
		User user = new User(login);
		Map<String, Object> model = new HashMap<String, Object>();
		model.put("firstName", login.getFirstName());
		model.put("lastName", login.getLastName());
		emailService.sendEmail("welcome.vm", login.getEmail(), model);
		return user;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User getUserByEmail(String email) throws UserNotFoundException {
		Collection coll = loginDao.getLoginByEmail(email);
		if(coll.isEmpty())
			throw new UserNotFoundException();
		Login login = (Login) coll.toArray()[0];
		User user = new User(login);
		return user;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)	
	public User getUserByEmailAndPassword(String email, String password) throws UserNotFoundException {
		Collection coll = loginDao.getLoginByEmailAndPassword(email, password);
		if(coll.isEmpty())
			throw new UserNotFoundException();
		Login login = (Login) coll.toArray()[0];
		User user = new User(login);
		return user;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void updateUser(User user) throws Exception {
		Collection coll = loginDao.getLoginById(user.getId());
		if(coll.isEmpty())
			throw new UserNotFoundException();
		Login login = (Login) coll.toArray()[0];
		login.setPassword(user.getPassword());
		login.setFirstName(user.getFirstName());
		login.setLastName(user.getLastName());
		login.setPhoneNum(user.getPhoneNum());
		loginDao.updateLogin(login);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public User registerValidatedUser(User user) throws EmailExistException  {
		if(isLoginExists(user.getEmail())){
			throw new EmailExistException();
		}
		Login lg = new Login();
		lg.setEmail(user.getEmail());
		lg.setPassword(user.getPassword());
		lg.setFirstName(user.getFirstName());
		lg.setLastName(user.getLastName());
		lg.setPhoneNum(user.getPhoneNum());
		lg.setLevel(USER_EMAIL_VALIDATED);
		lg.setSecureHash(UUID.randomUUID().toString());
		lg = loginDao.saveLogin(lg);
		return new User(lg);
	}
	
}

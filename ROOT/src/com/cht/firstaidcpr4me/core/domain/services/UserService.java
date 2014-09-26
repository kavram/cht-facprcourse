package com.cht.firstaidcpr4me.core.domain.services;

import com.cht.firstaidcpr4me.core.domain.exceptions.EmailExistException;
import com.cht.firstaidcpr4me.core.domain.exceptions.EmailValidationKeyNotFoundException;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.web.domain.User;

public interface UserService {

	public boolean isLoginExists(String email);
	
	public void validateEmail(String validationKey) throws EmailValidationKeyNotFoundException;
	
	public User registerUser(User user) throws EmailExistException;
	
	public User getUserById(Long userId) throws UserNotFoundException;
	
	public User getUserByEmailAndPassword(String email, String password) throws UserNotFoundException;

	public User getUserBySecurityHash(String hash) throws UserNotFoundException;

	public User getUserByEmail(String email) throws UserNotFoundException;

	public User getOrRegisterUser(User user) throws Exception;

	public void updateUser(User user) throws Exception;
}

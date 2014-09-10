package com.cht.firstaidcpr4me.core.domain.services;

import com.cht.firstaidcpr4me.web.domain.User;

public interface UserService {

	public boolean isLoginExists(String email);
	
	public void validateEmail(String validationKey) throws Exception;
	
	public User registerUser(User user) throws Exception;
	
	public User getUserById(Long userId);
}

package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.objects.Login;

public interface LoginDAO {

	public Collection getLoginByEmail(String email);
	public Login saveLogin(Login login);
	public Collection getLoginById(Long id);
	public void updateLogin(Login login);
	public Collection getLoginByHash(String hash);
	
}

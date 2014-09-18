package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;

import com.cht.firstaidcpr4me.core.domain.objects.LoginForgotPassword;

public class LoginForgotPasswordDaoImpl implements LoginForgotPasswordDao {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	@Override
	public LoginForgotPassword saveLoginForgotPassword(LoginForgotPassword lfp) {
		sessionFactory.getCurrentSession().save(lfp);
		return lfp;
	}

	@Override
	public Collection getActiveLoginForgotPasswordByKey(String key) {
		return sessionFactory.getCurrentSession().createQuery("select p from LoginForgotPassword p where p.key = :key and p.status = :status")
		        .setString("key", key)
		        .setLong("status", 0)
		        .list();	
	}

	@Override
	public void updateLoginForgotPassword(LoginForgotPassword lfp) {
		sessionFactory.getCurrentSession().update(lfp);
	}

}

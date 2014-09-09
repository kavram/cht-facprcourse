package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;

import com.cht.firstaidcpr4me.core.domain.objects.LoginEmailValidation;

public class LoginEmailValidationDaoImpl implements LoginEmailValidationDao {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	
	@Override
	public LoginEmailValidation save(LoginEmailValidation lev) {
		lev = (LoginEmailValidation) sessionFactory.getCurrentSession().save(lev);
		return lev;
	}



	@Override
	public Collection getLoginEmailValidationByKey(String key, Long status) {
		return this.sessionFactory.getCurrentSession()
                .createQuery("select l from LoginEmailVerification l where l.validationKey = :key and l.validationStatus = :status")
                .setString("key", key)
                .setLong("status", status)
                .list();	
	}




}

package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;

import com.cht.firstaidcpr4me.core.domain.objects.LoginPayment;

public class LoginPaymentDaoImpl implements LoginPaymentDao {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	@Override
	public LoginPayment save(LoginPayment lp) {
		Long id = (Long) sessionFactory.getCurrentSession().save(lp);
		return lp;
	}


	@Override
	public void update(LoginPayment lp) {
		sessionFactory.getCurrentSession().saveOrUpdate(lp);
	}


	@Override
	public Collection getById(Long id) {
		return sessionFactory.getCurrentSession().createQuery("select l from LoginPayment l where l.id = :id")
        .setLong("id", id)
        .list();	
	}

}

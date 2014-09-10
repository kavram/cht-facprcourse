package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.objects.Login;


public class LoginDAOImpl implements LoginDAO {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	@Override
	public Collection getLoginByEmail(String email) {
		return this.sessionFactory.getCurrentSession()
                .createQuery("select l from Login l where l.email = :email")
                .setString("email", email)
                .list();	
	}

	@Override
	public Collection getLoginById(Long id) {
		return this.sessionFactory.getCurrentSession()
                .createQuery("select l from Login l where l.id = :id")
                .setLong("id", id)
                .list();	
	}
	
	
	@Override
	public Login saveLogin(Login login) {
		Long id = (Long) sessionFactory.getCurrentSession().save(login);
		
		return login;
	}

	@Override
	public void updateLogin(Login login) {
		sessionFactory.getCurrentSession().update(login);
	}

}

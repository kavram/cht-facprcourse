package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;

public class QuestionDaoImpl implements QuestionDao {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	@Override
	public Collection getQuestions() {
		return sessionFactory.getCurrentSession().createQuery("select q from Question q")
		        .list();	
	}


	@Override
	public Collection getQuestionById(Long id) {
		return this.sessionFactory.getCurrentSession()
                .createQuery("select q from Question q where q.id = :id")
                .setLong("id", id)
                .list();	
	}

}

package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;

public class CourseDaoImpl implements CourseDao {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	
	@Override
	public Collection getCourseById(Long courseId) {
		return this.sessionFactory.getCurrentSession()
                .createQuery("select c from Course c where c.id = :id")
                .setLong("id", courseId)
                .list();	
	}

}

package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

import org.hibernate.SessionFactory;

import com.cht.firstaidcpr4me.core.domain.objects.LoginCompletedCourse;

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



	@Override
	public Collection getCourses() {
		return this.sessionFactory.getCurrentSession()
                .createQuery("select c from Course c")
                .list();	
	}

	@Override
	public LoginCompletedCourse saveLoginCompletedCourse(LoginCompletedCourse complCourse) {
		Long id = (Long) sessionFactory.getCurrentSession().save(complCourse);
		return complCourse;
	}

}

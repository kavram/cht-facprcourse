package com.cht.firstaidcpr4me.core.domain.dao;

import org.hibernate.SessionFactory;

import com.cht.firstaidcpr4me.core.domain.objects.LoginPaidCourse;

public class LoginPaidCourseDaoImpl implements LoginPaidCourseDao {

	private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
	
	
	@Override
	public LoginPaidCourse save(LoginPaidCourse lpc) {
		sessionFactory.getCurrentSession().save(lpc);
		return lpc;
	}

}

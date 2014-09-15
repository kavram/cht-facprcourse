package com.cht.firstaidcpr4me.core.domain.dao;

import java.util.Collection;

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


	@Override
	public Collection<LoginPaidCourse> getLoginPaidCourseById(Long loginId,	Long courseId) {
		return sessionFactory.getCurrentSession().createQuery("select p from LoginPaidCourse p where p.courseId = :courseId and p.loginId = :loginId")
		        .setLong("courseId", courseId)
		        .setLong("loginId", loginId)
		        .list();	
	}

}

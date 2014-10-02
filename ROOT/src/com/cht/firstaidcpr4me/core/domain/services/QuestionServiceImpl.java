package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.QuestionDao;
import com.cht.firstaidcpr4me.core.domain.exceptions.QuestionNotFoundException;
import com.cht.firstaidcpr4me.core.domain.exceptions.UserNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.Login;
import com.cht.firstaidcpr4me.core.domain.objects.Question;
import com.cht.firstaidcpr4me.web.domain.User;

public class QuestionServiceImpl implements QuestionService {
	
	
	
	@Autowired
	QuestionDao questionDao;
	
		
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Collection getQuestions() {
		Collection coll = questionDao.getQuestions();
		return coll;
	}



	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)	
	public Question getQuestionById(Long id) throws QuestionNotFoundException {
		Collection coll = questionDao.getQuestionById(id);
		if(coll.isEmpty())
			throw new QuestionNotFoundException();
		Question q = (Question) coll.toArray()[0];
		return q;
	}
	

}

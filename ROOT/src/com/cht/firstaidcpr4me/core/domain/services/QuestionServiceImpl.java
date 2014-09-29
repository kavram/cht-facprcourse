package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cht.firstaidcpr4me.core.domain.dao.QuestionDao;

public class QuestionServiceImpl implements QuestionService {

	@Autowired
	QuestionDao questionDao;
	
	
	
	@Override
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public Collection getQuestions() {
		Collection coll = questionDao.getQuestions();
		return coll;
	}

}

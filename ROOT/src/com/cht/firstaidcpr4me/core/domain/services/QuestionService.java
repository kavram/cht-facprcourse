package com.cht.firstaidcpr4me.core.domain.services;

import java.util.Collection;

import com.cht.firstaidcpr4me.core.domain.exceptions.QuestionNotFoundException;
import com.cht.firstaidcpr4me.core.domain.objects.Question;

public interface QuestionService {
	public static final long CORRECT_ANSWER = 1;
	
	public Collection getQuestions();
	public Question getQuestionById(Long id) throws QuestionNotFoundException;
	
	
}

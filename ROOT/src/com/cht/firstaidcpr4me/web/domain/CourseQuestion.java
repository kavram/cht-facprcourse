package com.cht.firstaidcpr4me.web.domain;

import java.util.Collection;

public class CourseQuestion {
	private Long id;
	private String question;
	private Long numAnswers;
	private Collection<QAnswer> answers;
	
	public CourseQuestion(){
		
	}
	
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getNumAnswers() {
		return numAnswers;
	}
	public void setNumAnswers(Long numAnswers) {
		this.numAnswers = numAnswers;
	}

	public Collection<QAnswer> getAnswers() {
		return answers;
	}

	public void setAnswers(Collection<QAnswer> answers) {
		this.answers = answers;
	}
	
	
}

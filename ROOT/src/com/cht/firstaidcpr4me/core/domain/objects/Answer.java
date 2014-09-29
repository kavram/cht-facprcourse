package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="fa_answers_tb")
public class Answer implements Serializable{
	private static final long serialVersionUID = -889866153761550268L;

	@Id 
	@Column(name="ans_id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	
	@Column(name="que_id") 
	private Long questionId;
	
	@Column(name="que_answer") 
	private String answer;
	
	@Column(name="que_correct_ans") 
	private Long correctAns;

	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Long questionId) {
		this.questionId = questionId;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Long getCorrectAns() {
		return correctAns;
	}

	public void setCorrectAns(Long correctAns) {
		this.correctAns = correctAns;
	}
	
	
}

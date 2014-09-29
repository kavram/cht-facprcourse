package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="fa_questions_tb")
public class Question implements Serializable{
	private static final long serialVersionUID = -26860105297732723L;

	@Id 
	@Column(name="que_id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="que_question") 
	private String question;
	
	@Column(name="que_num_ans")
	private Long numAnswers;
	
	@Column(name="que_type")
	private Long questionType;

	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="que_id")
	private List<Answer> answers;	
	
	public Question(){
		
	}
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public Long getNumAnswers() {
		return numAnswers;
	}

	public void setNumAnswers(Long numAnswers) {
		this.numAnswers = numAnswers;
	}

	public Long getQuestionType() {
		return questionType;
	}

	public void setQuestionType(Long questionType) {
		this.questionType = questionType;
	}


	public List<Answer> getAnswers() {
		return answers;
	}


	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	
	
	
	
}

package com.cht.firstaidcpr4me.web.domain;

public class QAnswer {
	private Long id;
	private String answer;
	private Long correctAns;
	
	public QAnswer(){
		
	}
	
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public Long getCorrectAns() {
		return correctAns;
	}

	public void setCorrectAns(Long correctAns) {
		this.correctAns = correctAns;
	}
	
	
}

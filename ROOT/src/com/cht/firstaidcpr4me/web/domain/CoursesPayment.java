package com.cht.firstaidcpr4me.web.domain;

import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;


public class CoursesPayment {
	private Map<Long, Double> courses;
	private Integer responseCode;
	private Integer responseReasonCode;
	private String responseReasonText;
	private Boolean isApproved;
	private String transactionId;
	

	public CoursesPayment(){
		
	}


	public Double getTotalAmount(){
		Double total = new Double(0.0);
		for(Double price : courses.values()){
			total += price;
		}
		return total;
	}

	public Map<Long, Double> getCourses() {
		return courses;
	}



	public void setCourses(Map<Long, Double> courses) {
		this.courses = courses;
	}



	public Integer getResponseCode() {
		return responseCode;
	}



	public void setResponseCode(Integer responseCode) {
		this.responseCode = responseCode;
	}



	public Integer getResponseReasonCode() {
		return responseReasonCode;
	}



	public void setResponseReasonCode(Integer responseReasonCode) {
		this.responseReasonCode = responseReasonCode;
	}



	public String getResponseReasonText() {
		return responseReasonText;
	}



	public void setResponseReasonText(String responseReasonText) {
		this.responseReasonText = responseReasonText;
	}



	public Boolean getIsApproved() {
		return isApproved;
	}



	public void setIsApproved(Boolean isApproved) {
		this.isApproved = isApproved;
	}



	public String getTransactionId() {
		return transactionId;
	}



	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}



}

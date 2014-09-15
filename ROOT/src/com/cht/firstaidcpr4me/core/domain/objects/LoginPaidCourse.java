package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="fa_login_paid_courses_tb")
public class LoginPaidCourse implements Serializable {
	private static final long serialVersionUID = -7216963782159375634L;

	@Id 
	@Column(name="id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="login_id", nullable = false)
	private Long loginId;
	
	@Column(name="payment_transaction_id", nullable = false)
	private String paymentTransactionId;
	
	@Column(name="course_id", nullable = false)
	private Long courseId;
	
	@Column(name="amount", nullable = false)
	private Double amount;
	
	
	public LoginPaidCourse(){
		
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}

	public Long getCourseId() {
		return courseId;
	}


	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}


	public Double getAmount() {
		return amount;
	}


	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public String getPaymentTransactionId() {
		return paymentTransactionId;
	}
	public void setPaymentTransactionId(String paymentTransactionId) {
		this.paymentTransactionId = paymentTransactionId;
	}


	public Long getLoginId() {
		return loginId;
	}


	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}
	
	
}

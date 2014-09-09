package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;



@Entity
@Table(name="fa_login_paid_courses_tb")
public class LoginPaidCourse implements Serializable {
	private static final long serialVersionUID = -7216963782159375634L;

	@Id 
	@Column(name="id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@ManyToOne(cascade = {CascadeType.PERSIST, CascadeType.MERGE})
	@JoinColumn(name="login_payment_id", nullable = false)
	private LoginPayment loginPayment;
	
	public LoginPayment getLoginPayment(){
		return loginPayment;
	}
	public void setLoginPayment(LoginPayment loginPayment){
		this.loginPayment = loginPayment;
	}

	
	@Column(name="course_id")
	private Long courseId;
	
	@Column(name="amount")
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
	
	
}

package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;

@Entity
@Table(name="fa_login_payments_tb")
public class LoginPayment implements Serializable{
	private static final long serialVersionUID = 1616275646420892695L;

	@Id 
	@Column(name="id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="login_id")
	private Long loginId;
	
	@Column(name="payment_status")
	private Long paymentStatus;
	
	@Column(name="transaction_id")
	private String transactionId;
	
	@Column(name="authorization_code")
	private String authorizationCode;
	
	@Column(name="amount")
	private Double amount;
	
		
	@OneToMany(mappedBy="loginPayment")
	private List<LoginPaidCourse> loginPaidCourses = new ArrayList<LoginPaidCourse>();
	
	public List<LoginPaidCourse> getLoginPaidCourses(){
		return loginPaidCourses;
	}
	void setLoginPaidCourses(List<LoginPaidCourse> loginPaidCourses){
		this.loginPaidCourses = loginPaidCourses;
	}
	
	
	
	public LoginPayment(){
		
	}
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getLoginId() {
		return loginId;
	}
	public void setLoginId(Long loginId) {
		this.loginId = loginId;
	}
	public Long getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(Long paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getAuthorizationCode() {
		return authorizationCode;
	}
	public void setAuthorizationCode(String authorizationCode) {
		this.authorizationCode = authorizationCode;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
}

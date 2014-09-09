package com.cht.firstaidcpr4me.core.domain.objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="fa_login_email_validation_tb")
public class LoginEmailValidation {

	@Id 
	@Column(name="id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="login_id") 
	private Long loginId;
	
	@Column(name="validation_key") 
	private String validationKey;
	
	@Column(name="validation_status") 
	private Long validationStatus;

	
	public LoginEmailValidation(){
		
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

	public String getValidationKey() {
		return validationKey;
	}

	public void setValidationKey(String validationKey) {
		this.validationKey = validationKey;
	}

	public Long getValidationStatus() {
		return validationStatus;
	}

	public void setValidationStatus(Long validationStatus) {
		this.validationStatus = validationStatus;
	}
	
	
}

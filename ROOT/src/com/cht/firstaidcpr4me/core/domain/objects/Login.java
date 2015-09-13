package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="fa_login_tb")
public class Login implements Serializable {

	private static final long serialVersionUID = 8899299674243686757L;

	@Id 
	@Column(name="log_id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="log_email_tx")
	private String email;
	
	@Column(name="log_password_tx")
	private String password;
	
	@Column(name="log_name_tx")
	private String name;

	@Column(name="log_first_name_tx")
	private String firstName;

	@Column(name="log_last_name_tx")
	private String lastName;

	@Column(name="log_phone_num")
	private String phoneNum;
	
	@Column(name="log_level_tx")
	private Long level;

	@Column(name="log_hash")
	private String secureHash;
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSecureHash() {
		return secureHash;
	}

	public void setSecureHash(String secureHash) {
		this.secureHash = secureHash;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
	
	
}

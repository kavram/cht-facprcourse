package com.cht.firstaidcpr4me.web.domain;



import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.cht.firstaidcpr4me.core.domain.objects.Login;

import javax.validation.constraints.NotNull;

@Component
@Scope(value="session", proxyMode=ScopedProxyMode.TARGET_CLASS)
public class User {

	private Long id;
	
	@NotNull
	@NotEmpty
	private String email;

	@NotNull
	@NotEmpty
	private String firstName;

	@NotNull
	@NotEmpty
	private String lastName;
	private String password;
	private Long level;
	private String userHash;
	private String phoneNum;
	
	public User(){
		
	}
	
	public User(final Login login) {
		id = login.getId();
		email = login.getEmail();
		firstName = login.getFirstName();
		lastName = login.getLastName();
		level = login.getLevel();
		userHash = login.getSecureHash();
		phoneNum = login.getPhoneNum();
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

	public Long getLevel() {
		return level;
	}

	public void setLevel(Long level) {
		this.level = level;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getUserHash() {
		return userHash;
	}

	public void setUserHash(String userHash) {
		this.userHash = userHash;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
	
}

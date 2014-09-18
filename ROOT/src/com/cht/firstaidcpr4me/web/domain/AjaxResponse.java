package com.cht.firstaidcpr4me.web.domain;

import java.io.Serializable;

public class AjaxResponse implements Serializable{
	private static final long serialVersionUID = -4298370175994448348L;
	
	private String status;
	private String error;
	private String firstName;
	private String lastName;
	
	public AjaxResponse(){
		
	}
	
	public AjaxResponse(String status){
		this.status = status;
	}
	
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
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
	
	
	
}

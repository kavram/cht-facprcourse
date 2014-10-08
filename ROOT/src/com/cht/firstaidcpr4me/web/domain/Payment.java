package com.cht.firstaidcpr4me.web.domain;



public class Payment {

	private String amount;
	private String creditcardnum;
	private String exprmonth;
	private String expryear;
	private String firstname;
	private String lastname;
	private String email;
	private String address;
	private String city;
	private String state;
	private String zipcode;
	private String course;
	
	
	public Payment(){
		
	}
	
	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public String getCreditcardnum() {
		return creditcardnum;
	}

	public void setCreditcardnum(String creditcardnum) {
		this.creditcardnum = creditcardnum;
	}

	public String getExprmonth() {
		return exprmonth;
	}

	public void setExprmonth(String exprmonth) {
		this.exprmonth = exprmonth;
	}

	public String getExpryear() {
		return expryear;
	}

	public void setExpryear(String expryear) {
		this.expryear = expryear;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}
	
}

package com.cht.firstaidcpr4me.web.domain;

import java.util.List;


public class RegAndPay {

	private String email;
	private String firstName;
	private String lastName;
	private String password;
	private String phoneNum;

	private List<Long> selectedCourses;
	
	private String amount;
	private String creditcardnum;
	private String exprmonth;
	private String expryear;
	private String ccFirstName;
	private String ccLastName;
	private String ccEmail;
	private String address;
	private String city;
	private String state;
	private String zipcode;
	
	
	public RegAndPay(){
		
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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

	public String getCcFirstName() {
		return ccFirstName;
	}

	public void setCcFirstName(String ccFirstName) {
		this.ccFirstName = ccFirstName;
	}

	public String getCcLastName() {
		return ccLastName;
	}

	public void setCcLastName(String ccLastName) {
		this.ccLastName = ccLastName;
	}

	public String getCcEmail() {
		return ccEmail;
	}

	public void setCcEmail(String ccEmail) {
		this.ccEmail = ccEmail;
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

	public List<Long> getSelectedCourses() {
		return selectedCourses;
	}

	public void setSelectedCourses(List<Long> selectedCourses) {
		this.selectedCourses = selectedCourses;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}
	
}

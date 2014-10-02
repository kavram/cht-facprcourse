package com.cht.firstaidcpr4me.core.domain.objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="fa_login_courses_tb")
public class LoginCompletedCourse {

	@Id 
	@Column(name="id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@Column(name="log_id")
	private Long loginId;
	
	@Column(name="crs_id")
	private Long courseId;
	
	@Column(name="loc_cert_issued")
	private Boolean certIssued;
	
	public LoginCompletedCourse(){
		
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

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Boolean getCertIssued() {
		return certIssued;
	}

	public void setCertIssued(Boolean certIssued) {
		this.certIssued = certIssued;
	}
	
}

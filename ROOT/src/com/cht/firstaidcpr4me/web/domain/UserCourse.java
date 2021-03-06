package com.cht.firstaidcpr4me.web.domain;

import java.util.Collection;

public class UserCourse {

	private Long courseId;
	private User user;
	private boolean paid;
	private boolean completed;
	private String name;
	private String price;
	private Collection<CourseVideo> videos;
	private Collection<CourseQuestion> questions;

	public boolean isPaid() {
		return paid;
	}

	public void setPaid(boolean paid) {
		this.paid = paid;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Collection<CourseVideo> getVideos() {
		return videos;
	}

	public void setVideos(Collection<CourseVideo> videos) {
		this.videos = videos;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public Collection<CourseQuestion> getQuestions() {
		return questions;
	}

	public void setQuestions(Collection<CourseQuestion> questions) {
		this.questions = questions;
	}

	public boolean isCompleted() {
		return completed;
	}

	public void setCompleted(boolean completed) {
		this.completed = completed;
	}
	
}

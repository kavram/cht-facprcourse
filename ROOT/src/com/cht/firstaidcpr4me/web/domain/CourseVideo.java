package com.cht.firstaidcpr4me.web.domain;

public class CourseVideo {

	private Long videoId;
	private String name;
	private String url;
	private String activeThumbnail;
	private String inactiveThumbnail;

	
	public CourseVideo(){
		
	}
	
	public Long getVideoId() {
		return videoId;
	}

	public void setVideoId(Long videoId) {
		this.videoId = videoId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getActiveThumbnail() {
		return activeThumbnail;
	}

	public void setActiveThumbnail(String activeThumbnail) {
		this.activeThumbnail = activeThumbnail;
	}

	public String getInactiveThumbnail() {
		return inactiveThumbnail;
	}

	public void setInactiveThumbnail(String inactiveThumbnail) {
		this.inactiveThumbnail = inactiveThumbnail;
	}
	
}

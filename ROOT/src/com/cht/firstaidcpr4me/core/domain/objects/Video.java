package com.cht.firstaidcpr4me.core.domain.objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="fa_video_tb")
public class Video {

	@Id 
	@Column(name="vid_id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="vid_name")
	private String name;

	@Column(name="vid_url")
	private String url;
	
	@Column(name="vid_icon_act")
	private String activeThumbnail;
	
	@Column(name="vid_icon_inact")
	private String inactiveThumbnail;
	
	public Video(){
		
	}
	
	
	
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getInactiveThumbnail() {
		return inactiveThumbnail;
	}

	public void setInactiveThumbnail(String inactiveThumbnail) {
		this.inactiveThumbnail = inactiveThumbnail;
	}

	public String getActiveThumbnail() {
		return activeThumbnail;
	}

	public void setActiveThumbnail(String activeThumbnail) {
		this.activeThumbnail = activeThumbnail;
	}
	
	
	
	
}

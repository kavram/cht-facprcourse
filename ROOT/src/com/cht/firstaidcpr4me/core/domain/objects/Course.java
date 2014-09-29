package com.cht.firstaidcpr4me.core.domain.objects;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinTable;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="fa_courses_tb")
public class Course implements Serializable {
	private static final long serialVersionUID = 7324354268692806737L;

	@Id 
	@Column(name="crs_id") 
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;

	@Column(name="crs_name")
	private String name;
	
	@Column(name="crs_price")
	private Double price;

	
	@OneToMany(
			targetEntity=com.cht.firstaidcpr4me.core.domain.objects.Video.class,
					 cascade={CascadeType.PERSIST, CascadeType.MERGE}
	)
    @JoinTable(
            name="fa_video_ptr_tb",
            joinColumns = @JoinColumn(name= "crs_id"),
            inverseJoinColumns = @JoinColumn( name="vid_id")
    )	
	private Set<Video> videos;

	public Set<Video> getVideos(){
		return videos;
	}
	
	
	@OneToMany(
			targetEntity=com.cht.firstaidcpr4me.core.domain.objects.Question.class,
					 cascade={CascadeType.PERSIST, CascadeType.MERGE}
	)
    @JoinTable(
            name="fa_quiz_ptr_tb",
            joinColumns = @JoinColumn(name= "crs_id"),
            inverseJoinColumns = @JoinColumn( name="que_id")
    )	
	private Set<Question> questions;

	public Set<Question> getQuestions(){
		return questions;
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

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	
}

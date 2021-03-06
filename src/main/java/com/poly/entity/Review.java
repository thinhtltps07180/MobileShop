package com.poly.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;
@Entity
@Table(name="Reviews")
public class Review {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer id;
	@NotBlank(message = "Không được để trống tên tiêu đề bài viết")// phải là chuỗi String
	@Length(min=6 , message = "tiêu đề bài viết phải có ít nhất 6 ký tự")
	String title;
	@NotBlank(message = "Không được để trống tên mô tả ngắn bài viết")// phải là chuỗi String
	@Length(min=6 , message = " mô tả ngắn bài viết phải có ít nhất 6 ký tự")
	String description;
	@NotBlank(message = "Không được để trống nội dụng bài viết")// phải là chuỗi String
	@Length(min=6 , message = " nội dụng bài viết phải có ít nhất 6 ký tự")
	String content;
	String thumbnail;	
//	String CreateBy;	
	/* @Temporal(TemporalType.DATE) */
	Date createDate;
	Boolean status;
//	Integer CategoryId;

	
	@ManyToOne
	@JoinColumn(name="createBy")
	User user;

	public Integer getId() {
		return id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}


	public Boolean getStatus() {
		return status;
	}

	public void setStatus(Boolean status) {
		this.status = status;
	}


	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}




}

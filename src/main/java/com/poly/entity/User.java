package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name = "Users")
public class User {
	@Id
	@NotBlank(message = "Không được để trống username")// phải là chuỗi String
	@Length(min=6 , message = "User name phải có ít nhất 6 ký tự")
	String id;
	@Length(min=6 , message = "Mật khẩu phải có ít nhất 6 ký tự")
	@NotBlank(message = "Không được để trống password")// phải là chuỗi String
	String password;
	String photo;
	@NotBlank(message = "Không được để trống email")// phải là chuỗi String
	@Email (message = "Định dạng email không đúng")
	String email;
	String address;
	Integer phoneNumber;
	String name;
//	Integer roleId;

	@ManyToOne
	@JoinColumn(name = "roleId")
	Role role;
	
	@OneToMany(mappedBy="user" )
	List<Review> reviews;
	
	@OneToMany(mappedBy="user" )
	List<Order> orders;
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}


	public List<Order> getOrders() {
		return orders;
	}

	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(Integer phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


}

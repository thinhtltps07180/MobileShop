package com.poly.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {
	@Id
//	@NotBlank(message = "Không được để trống username")// phải là chuỗi String
//	@Length(min=6 , message = "User name phải có ít nhất 6 ký tự")
	String id;
//	@Length(min=6 , message = "Mật khẩu phải có ít nhất 6 ký tự")
//	@NotBlank(message = "Không được để trống password")// phải là chuỗi String
	String password;
	String photo;
//	@NotBlank(message = "Không được để trống email")// phải là chuỗi String
//	@Email (message = "Định dạng email không đúng")
	String email;
//	Integer roleId;

	@ManyToOne
	@JoinColumn(name = "roleId")
	Role roles;
	


	



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

	public Role getRoles() {
		return roles;
	}

	public void setRoles(Role roles) {
		this.roles = roles;
	}


}

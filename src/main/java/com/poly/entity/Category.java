package com.poly.entity;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.validator.constraints.Length;

@Entity
@Table(name="Categories")
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer id;
	@NotBlank(message = "Không được để trống tên loại sản phẩm")// phải là chuỗi String
	@Length(min=6 , message = "Tên loại sản phẩm phải có ít nhất 1 ký tự")
	String name;

	@OneToMany(mappedBy="category", fetch=FetchType.EAGER)
	List<Product> products;


	public Integer getId() {
		return id;
	}


	public void setId(Integer id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public List<Product> getProducts() {
		return products;
	}


	public void setProducts(List<Product> products) {
		this.products = products;
	}


	




	
	
	
}

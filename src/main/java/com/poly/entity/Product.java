package com.poly.entity;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Length;
import org.springframework.format.annotation.NumberFormat;

@Entity
@Table(name="Products")
public class Product {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer id;
	@NotBlank(message = "Không được để trống tên sản phẩm")// phải là chuỗi String
	@Length(min=6 , message = "Tên sản phẩm phải có ít nhất 6 ký tự")
	String name;
	@NotNull(message = "Không được để trống giá sản phẩm")
	@DecimalMin(value = "1000.0" , message = "Giá của sản phẩm tối thiểu là 1000 vnđ ")
	@DecimalMax(value = "100000000.0" , message = "Giá của sản phẩm tối đa phải nhỏ hơn là 100.000.000 vnđ  ")
	@NumberFormat(pattern = "#,######,###.##")
	Double unitPrice;
	@NotNull(message = "Không được để trống số lượng sản phẩm")
	@Min(value = 1 , message = "Số lượng tối thiểu là 1" )
	@Max(value = 100 , message = "Số lượng tối đa là 100" )
	Integer quantity;
	@NotBlank(message = "Không được để trống mô tả ngắn của sản phẩm")
	String description;
	Date createDate;
	String image;
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "categoryId")
	Category category;
	
	@ManyToOne
	@JoinColumn(name = "promotionId")
	Promotion promotion;
	

	@OneToMany(mappedBy="product" )
	List<OrderDetail> orderDetails;
	


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}


	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}


	public List<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(List<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public Category getCategory() {
		return category;
	}

	public Promotion getPromotion() {
		return promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}








	
}

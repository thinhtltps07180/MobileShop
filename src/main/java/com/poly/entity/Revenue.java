package com.poly.entity;

public class Revenue {
	
	private Object productName;
	private Object quantity;
	private Object revenue;
	private Object min;
	private Object max;
	public Object getProductName() {
		return productName;
	}
	public void setProductName(Object productName) {
		this.productName = productName;
	}
	public Object getQuantity() {
		return quantity;
	}
	public void setQuantity(Object quantity) {
		this.quantity = quantity;
	}
	public Object getRevenue() {
		return revenue;
	}
	public void setRevenue(Object revenue) {
		this.revenue = revenue;
	}
	public Object getMin() {
		return min;
	}
	public void setMin(Object min) {
		this.min = min;
	}
	public Object getMax() {
		return max;
	}
	public void setMax(Object max) {
		this.max = max;
	}
	public Revenue(Object productName, Object quantity, Object revenue, Object min, Object max) {
		super();
		this.productName = productName;
		this.quantity = quantity;
		this.revenue = revenue;
		this.min = min;
		this.max = max;
	}
	
	


}

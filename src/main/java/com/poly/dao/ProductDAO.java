package com.poly.dao;

import java.util.List;

import com.poly.entity.Product;

public interface ProductDAO {
	Product findById(Integer id);
	List<Product>findAll();
	List<Product>findAllNew();
	List<Product>findTrend();
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);
	long getCount();
	List<Product> pagination(int a, int b);
}

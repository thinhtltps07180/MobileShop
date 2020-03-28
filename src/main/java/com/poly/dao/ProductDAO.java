package com.poly.dao;

import java.util.List;

import com.poly.entity.Product;

public interface ProductDAO {
	List<Product> sortAsc(int pageNo);
	Product findById(Integer id);

	/* Product findByIphone(); */
	List<Product>findAll();
	List<Product>findAllNew();
	List<Product>findTrend();
	List<Product>findByIphone(int pageNo);
	Product create(Product entity);
	void update(Product entity);
	Product delete(Integer id);
	List<Product> findPage(int pageNo);
	int getPageCount();
	List<Product> sortDesc(int pageNo);

}

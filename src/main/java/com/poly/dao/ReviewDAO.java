package com.poly.dao;

import java.util.List;

import com.poly.entity.Review;

public interface ReviewDAO {
	Review findById(Integer id);
	Review findByTop1News();
	List<Review> findAllTop2();
	List<Review> findPage(int pageNo);
	int getPageCount();
	List<Review>findAll();
	List<Review>findAllTrue();
	List<Review>findByUserId();
	Review create(Review entity);
	void update(Review entity);
	Review delete(Integer id);
	List<Review> findAllTrueIndex();
}

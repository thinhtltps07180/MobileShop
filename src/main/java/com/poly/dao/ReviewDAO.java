package com.poly.dao;

import java.util.List;

import com.poly.entity.Review;

public interface ReviewDAO {
	Review findById(Integer id);
	List<Review>findAll();
	List<Review>findByUserId();
	Review create(Review entity);
	void update(Review entity);
	Review delete(Integer id);
}

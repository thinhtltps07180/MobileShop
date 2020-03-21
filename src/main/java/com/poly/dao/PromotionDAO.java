package com.poly.dao;

import java.util.List;

import com.poly.entity.Promotion;

public interface PromotionDAO {
	Promotion findById(Integer id);
	List<Promotion>findAll();
	Promotion create(Promotion entity);
	void update(Promotion entity);
	Promotion delete(Integer id);
}

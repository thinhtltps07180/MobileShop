package com.poly.dao;

import java.util.List;

import com.poly.entity.Role;
import com.poly.entity.Status;

public interface StatusDAO {
	Status findById(Integer id);
	List<Status>findAll();
	Status create(Status entity);
	void update(Status entity);
	Status delete(Integer id);
}

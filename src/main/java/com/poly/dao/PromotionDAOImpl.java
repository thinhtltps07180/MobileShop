package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Promotion;

@Transactional
@Repository
public class PromotionDAOImpl implements PromotionDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Promotion findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Promotion.class, id);
	}

	@Override
	public List<Promotion> findAll() {
		String hql = "FROM Promotion";
		Session session = factory.getCurrentSession();
		TypedQuery<Promotion> query = session.createQuery(hql, Promotion.class);
		return query.getResultList();
		
	}

	@Override
	public Promotion create(Promotion entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Promotion entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Promotion delete(Integer id) {
		Promotion entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}
	
}

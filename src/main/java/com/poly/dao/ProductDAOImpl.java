package com.poly.dao;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Product;

@Transactional
@Repository
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Product findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Product.class, id);
	}

	@Override
	public List<Product> findAll() {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		return query.getResultList();
		
	}

	@Override
	public Product create(Product entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Product entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Product delete(Integer id) {
		Product entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public List<Product> findAllNew() {
		String hql = "SELECT p FROM Product p  ORDER BY p.id DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.getResultList();
	}

	@Override
	public List<Product> findTrend() {
		String hql = "SELECT p FROM Product p  ORDER BY p.quantity ";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(0);
		query.setMaxResults(4);
		return query.getResultList();
	}

	//Total product number
	@Override
	public long getCount() {
		String hql = "SELECT count(p) FROM Product p";
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql, Long.class);
	    long count = query.getSingleResult();
	    
	    return count;
	}
	
	@Override
	public List<Product> pagination(int resultsPerPage, int page) {
	    String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
	    query.setMaxResults(resultsPerPage);
	    if(page <= 0)
	       query.setFirstResult(page * resultsPerPage);
	    else
	       query.setFirstResult((page-1) * resultsPerPage);
	    List<Product> resultList = query.getResultList();
	    
	    return resultList;
	}
	
	

	
}

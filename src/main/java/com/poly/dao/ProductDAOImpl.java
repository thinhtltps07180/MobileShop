package com.poly.dao;

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
	
	int pageSize = 6;

	@Override
	public Product findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Product.class, id);
	}

	@Override
	public List<Product> findAll() {
		String hql = "SELECT p FROM Product p  ORDER BY p.id DESC";
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

	@Override
	public List<Product> findPage(int pageNo) {
		String hql = "FROM Product";
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int getPageCount() {
		String hql = "SELECT count(p) FROM Product p ";
		
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql, Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count/pageSize);
		return pageCount;
	}

	@Override
	public List<Product> sortAsc(int pageNo) {
		String hql = "SELECT p FROM Product p  ORDER BY p.unitPrice ";	
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public List<Product> sortDesc(int pageNo) {
		String hql = "SELECT p FROM Product p  ORDER BY p.unitPrice Desc ";	
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public List<Product> findByIphone(int pageNo) {
		String hql = "SELECT p FROM Product p WHERE p.category = 1008 ORDER BY p.unitPrice Desc ";	
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public List<Product> findBySamSung(int pageNo) {
		String hql = "SELECT p FROM Product p WHERE p.category = 1009 ORDER BY p.unitPrice Desc ";	
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public List<Product> findByXiaoMi(int pageNo) {
		String hql = "SELECT p FROM Product p WHERE p.category = 1011 ORDER BY p.unitPrice Desc ";	
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public List<Product> findProductByCategory(int pageNo , int category) {
		int categoryId = category;
		String hql = "SELECT p FROM Product p WHERE p.category.id = :id ORDER BY p.unitPrice Desc ";	
		Session session = factory.getCurrentSession();
		TypedQuery<Product> query = session.createQuery(hql, Product.class);
		query.setParameter("id", categoryId);
		query.setFirstResult(pageNo*pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();

	}





	

	
}

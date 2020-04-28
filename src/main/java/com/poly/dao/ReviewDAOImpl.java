package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Review;
import com.poly.entity.User;

@Transactional
@Repository
public class ReviewDAOImpl implements ReviewDAO {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	HttpSession session;
	
	int pageSize = 5;

	@Override
	public Review findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Review.class, id);
	}

	@Override
	public List<Review> findAll() {
		String hql = "FROM Review r where r.status = false ";
		Session session = factory.getCurrentSession();
		TypedQuery<Review> query = session.createQuery(hql, Review.class);
		return query.getResultList();
		
	}

	@Override
	public Review create(Review entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Review entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Review delete(Integer id) {
		Review entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	@Override
	public List<Review> findByUserId() {
		User user = (User) session.getAttribute("user");
		String hql = "FROM Review n WHERE n.user.id =:id  ";
		Session session = factory.getCurrentSession();
		TypedQuery<Review> query = session.createQuery(hql, Review.class);
		query.setParameter("id", user.getId());
		return query.getResultList();
	}

	@Override
	public Review findByTop1News() {
		String hql = "SELECT r FROM Review r WHERE r.status = true  ORDER BY r.id DESC ";
		Session session = factory.getCurrentSession();
		TypedQuery<Review> query = session.createQuery(hql,Review.class);
		query.setFirstResult(0);
		query.setMaxResults(1);
		Review result = query.getSingleResult();
		return result;
	}

	@Override
	public List<Review> findAllTop2() {
		String hql = "FROM Review r  WHERE r.status = true ORDER BY r.id DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Review> query = session.createQuery(hql, Review.class);
		query.setFirstResult(1);
		query.setMaxResults(2);
		return query.getResultList();
	}

	@Override
	public List<Review> findAllTrue() {
		String hql = "FROM Review r where r.status = true ";
		Session session = factory.getCurrentSession();
		TypedQuery<Review> query = session.createQuery(hql, Review.class);
		return query.getResultList();
	}

	@Override
	public List<Review> findPage(int pageNo) {
		String hql = "FROM Review r  WHERE r.status = true ORDER BY r.id DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Review> query = session.createQuery(hql, Review.class);
		query.setFirstResult(pageNo * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int getPageCount() {
		String hql = "SELECT count(r) FROM Review r  WHERE r.status = true ";
		
		Session session = factory.getCurrentSession();
		TypedQuery<Long> query = session.createQuery(hql, Long.class);
		long count = query.getSingleResult();
		int pageCount = (int) Math.ceil(1.0 * count/pageSize);
		return pageCount;
	}



	

	
}

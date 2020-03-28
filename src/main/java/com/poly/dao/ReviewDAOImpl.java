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

	@Override
	public Review findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Review.class, id);
	}

	@Override
	public List<Review> findAll() {
		String hql = "FROM Review";
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



	

	
}

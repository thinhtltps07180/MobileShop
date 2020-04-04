package com.poly.dao;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.poly.entity.Role;
import com.poly.entity.Status;

@Transactional
@Repository
public class StatusDAOImpl implements StatusDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public Status findById(Integer id) {
		Session session = factory.getCurrentSession();
		return session.find(Status.class, id);
	}

	@Override
	public List<Status> findAll() {
		String hql = "FROM Status";
		Session session = factory.getCurrentSession();
		TypedQuery<Status> query = session.createQuery(hql, Status.class);
		return query.getResultList();
		
	}

	@Override
	public Status create(Status entity) {
		Session session = factory.getCurrentSession();
		session.save(entity);
		return entity;
	}

	@Override
	public void update(Status entity) {
		Session session = factory.getCurrentSession();
		session.update(entity);

	}

	@Override
	public Status delete(Integer id) {
		Status entity = this.findById(id);
		Session session = factory.getCurrentSession();
		session.remove(entity);
		return entity;
	}

	

	
}

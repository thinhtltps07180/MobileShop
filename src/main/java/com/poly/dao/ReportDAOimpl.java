package com.poly.dao;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Transactional
@Repository
public class ReportDAOimpl implements ReportDAO {
	@Autowired
	SessionFactory factory;

	@Override
	public List<Object[]> inventoryByCategory() {
		String hql = "SELECT p.category.name," 
				+ "SUM(p.quantity), " 
				+ "SUM(p.quantity * p.unitPrice),"
				+ "MIN(p.unitPrice), " 
				+ "MAX(p.unitPrice), " 
				+ "AVG(p.unitPrice) "
				+ "FROM Product p GROUP BY p.category.name";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}




	@Override
	public List<Object[]> revenueByCustomer() {
		String hql = "SELECT d.order.user.id," 
				+ "SUM(d.quantity), " 
				+ "SUM(d.quantity * d.unitPrice),"
				+ "MIN(d.unitPrice), " 
				+ "MAX(d.unitPrice), " 
				+ "AVG(d.unitPrice) "
				+ "FROM OrderDetail d GROUP BY d.order.user.id ORDER BY SUM(d.quantity * d.unitPrice) DESC";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByDate() {	
		LocalDate today = LocalDate.now();
		int day = today.getDayOfMonth();
		System.out.println(day);
		String hql = "SELECT d.product.category.name," 
				+ "SUM(d.quantity), " 
				+ "SUM(d.quantity * d.unitPrice),"
				+ "MIN(d.unitPrice)," 
				+ "MAX(d.unitPrice)" 
				+ "FROM OrderDetail d "
				+ "WHERE day(d.createDate) =:day "
				+ "GROUP BY d.product.category.name";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		List<Object[]> list = query.getResultList();
		
		return list;
	}




	@Override
	public List<Object[]> revenueByDay() {
		LocalDate today = LocalDate.now();
		int day = today.getDayOfMonth();
		String hql = "SELECT od.orderDate, " 
				+ "SUM(od.amount) "
				+ "FROM Order od "
				+ "WHERE day(od.orderDate) =:day "
				+ "GROUP BY od.orderDate";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> sumOrderofDay() {
		LocalDate today = LocalDate.now();
		int day = today.getDayOfMonth();
		String hql = "SELECT od.orderDate, " 
				+ "COUNT(od.id) "
				+ "FROM Order od "
				+ "WHERE day(od.orderDate) =:day "
				+ "GROUP BY od.orderDate";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> revenueByMonth() {
		LocalDate today = LocalDate.now();
		int day = today.getDayOfMonth();
		String hql = "SELECT od.orderDate, " 
				+ "COUNT(od.id) "
				+ "FROM Order od "
				+ "WHERE day(od.orderDate) =:day "
				+ "GROUP BY od.orderDate";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> sumOrderofMonth() {
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		int month = today.getMonthValue();
		String hql = "SELECT month(od.orderDate), " 
				+ "COUNT(od.id) "
				+ "FROM Order od "
				+ "WHERE month(od.orderDate) =:month AND year(od.orderDate)= :year "
				+ "GROUP BY month(od.orderDate)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("month", month);
		query.setParameter("year", year);
		List<Object[]> list = query.getResultList();	
		return list;
	}

}

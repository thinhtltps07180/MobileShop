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
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		int day = today.getDayOfMonth();
		String hql = "SELECT d.order.user.id," 
				+ "SUM(d.quantity), " 
				+ "SUM(d.unitPrice * d.quantity),"
				+ "MIN(d.unitPrice)," 
				+ "MAX(d.unitPrice)" 
				+ "FROM OrderDetail d "
				+ "WHERE day(d.createDate) =:day AND month(d.createDate)= :month "
				+ "GROUP BY d.order.user.id";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		query.setParameter("month", month);
		List<Object[]> list = query.getResultList();
		
		return list;
	}
	
	@Override
	public List<Object[]> revenueByCustomerMonth() {
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		String hql = "SELECT d.order.user.id," 
				+ "SUM(d.quantity), "
				+ "SUM(d.unitPrice * d.quantity),"
				+ "MIN(d.unitPrice)," 
				+ "MAX(d.unitPrice)" 
				+ "FROM OrderDetail d "
				+ "WHERE month(d.createDate) =:month "
				+ "GROUP BY d.order.user.id";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("month", month);
		List<Object[]> list = query.getResultList();
		return list;
	}

	@Override
	public List<Object[]> revenueByDate() {	
		LocalDate today = LocalDate.now();
		int day = today.getDayOfMonth();
		int month = today.getMonthValue();
		String hql = "SELECT d.product.category.name," 
				+ "SUM(d.quantity), " 
				+ "SUM(d.unitPrice),"
				+ "MIN(d.unitPrice)," 
				+ "MAX(d.unitPrice)" 
				+ "FROM OrderDetail d "
				+ "WHERE day(d.createDate) =:day AND month(d.createDate)= :month "
				+ "GROUP BY d.product.category.name";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		query.setParameter("month", month);
		List<Object[]> list = query.getResultList();
		
		return list;
	}




	@Override
	public List<Object[]> revenueByDay() {
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		int day = today.getDayOfMonth();
		String hql = "SELECT day(od.orderDate), " 
				+ "SUM(od.amount) "
				+ "FROM Order od "
				+ "WHERE day(od.orderDate) =:day AND month(od.orderDate)= :month "
				+ "GROUP BY day(od.orderDate)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		query.setParameter("month", month);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> sumOrderofDay() {
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		int day = today.getDayOfMonth();
		String hql = "SELECT day(od.orderDate), " 
				+ "COUNT(od.id) "
				+ "FROM Order od "
				+ "WHERE day(od.orderDate) =:day AND month(od.orderDate)= :month "
				+ "GROUP BY day(od.orderDate)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("day", day);
		query.setParameter("month", month);
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








	@Override
	public List<Object[]> totalMonth() {
		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		String hql = "SELECT month(od.orderDate), " 
				+ "SUM(od.amount) "
				+ "FROM Order od "
				+ "WHERE month(od.orderDate) =:month "
				+ "GROUP BY month(od.orderDate)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("month", month);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> totalYear() {
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		String hql = "SELECT year(od.orderDate), " 
				+ "SUM(od.amount) "
				+ "FROM Order od "
				+ "WHERE year(od.orderDate) =:year "
				+ "GROUP BY year(od.orderDate)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("year", year);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> sumOrderofYear() {
		LocalDate today = LocalDate.now();
		int year = today.getYear();
		String hql = "SELECT year(od.orderDate), " 
				+ "COUNT(od.id) "
				+ "FROM Order od "
				+ "WHERE year(od.orderDate) =:year "
				+ "GROUP BY year(od.orderDate)";
		Session session = factory.getCurrentSession();
		TypedQuery<Object[]> query = session.createQuery(hql, Object[].class);
		query.setParameter("year", year);
		List<Object[]> list = query.getResultList();	
		return list;
	}




	@Override
	public List<Object[]> totalAllMonth() {
		// TODO Auto-generated method stub
		return null;
	}






}

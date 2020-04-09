package com.poly.dao;

import java.util.List;

public interface ReportDAO {
	List<Object[]>inventoryByCategory();
	List<Object[]>revenueByDay();
	List<Object[]>revenueByDate();
	List<Object[]>sumOrderofDay();
	List<Object[]>sumOrderofMonth();
	List<Object[]>revenueByMonth();
	List<Object[]>revenueByCustomer();
	List<Object[]>totalMonth();
	List<Object[]>totalYear();
	List<Object[]>sumOrderofYear();



}

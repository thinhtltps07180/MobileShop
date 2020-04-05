package com.poly.dao;

import java.util.List;

public interface ReportDAO {
	List<Object[]>inventoryByCategory();
	List<Object[]>revenueByDay();
	List<Object[]>revenueByDate();
	List<Object[]>revenueByCustomer();
}

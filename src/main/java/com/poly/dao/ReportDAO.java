package com.poly.dao;

import java.util.List;

public interface ReportDAO {
	List<Object[]>inventoryByCategory();
	List<Object[]>revenueByCategory();
	List<Object[]>revenueByCustomer();
}

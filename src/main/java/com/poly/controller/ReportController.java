package com.poly.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.ReportDAO;

@Controller
public class ReportController {
	@Autowired
	ReportDAO dao;
	
	@RequestMapping("admin/inventoryreport")
	public String inventoryByCategory(Model model) {
		model.addAttribute("data",dao.inventoryByCategory());
		return "admin/inventoryreport";
	}
	
	@RequestMapping("admin/revenuereport")
	public String revenueByCategory(Model model) {
		model.addAttribute("data",dao.revenueByCategory());
		return "admin/revenuereport";
	}
	
	@RequestMapping("admin/report")
	public String revenueByCustomer(Model model) {

		return "admin/report";
	}
}

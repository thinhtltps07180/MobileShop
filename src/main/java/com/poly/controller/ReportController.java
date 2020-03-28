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
	
	@RequestMapping("admin/revenueByDate")
	public String inventoryByCategory(Model model) {
		model.addAttribute("data",dao.revenueByDate());
		return "admin/revenueByDate";
	}
	

	

}

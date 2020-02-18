package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.User;

@Controller
public class AdminController {
	
	@Autowired
	UserDAO dao;
	
	@Autowired
	RoleDAO roleDAO;
	
	@ResponseBody
	@RequestMapping("/test/query")
	public String query() {
		return "OK";
	}
	
	@GetMapping("/admin/index")
	public String index() {
		return "admin/index";
	}
	
	@GetMapping("/admin/register")
	public String register() {
		return "admin/register";
	}
	
	@GetMapping("/admin/users")
	public String adminList(Model model) {
		List<User> list = dao.findAll();
		model.addAttribute("listUsers", list);
		return "admin/users";
	}
	
}

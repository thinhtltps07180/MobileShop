package com.poly.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.service.CartService;

@Controller
public class CartController {
	@Autowired
	HttpSession session;

	@Autowired
	ServletContext app;

	@Autowired
	UserDAO dao;

	@Autowired
	CategoryDAO categoryDao;

	@Autowired
	ProductDAO productDao;

	@Autowired
	OrderDetailDAO orderDetailDao;

	@Autowired
	RoleDAO roleDAO;

	@Autowired
	CartService cart;

	@RequestMapping("/cart/add/{id}")
	public String add(@PathVariable("id") Integer id) {
		cart.add(id);
		return "redirect:/user/category";
	}
	
	@RequestMapping("/cart/view")
	public String index() {
		return "cart/index";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update")
	public String update(@RequestParam("id") Integer id, @RequestParam("qty") Integer qty) {
		cart.update(id, qty);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}

}

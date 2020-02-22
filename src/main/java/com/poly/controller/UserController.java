package com.poly.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.User;

@Controller
public class UserController {

	@Autowired
	HttpSession session;

	@Autowired
	ServletContext app;

	@Autowired
	UserDAO dao;

	@Autowired
	RoleDAO roleDAO;

	@GetMapping("/user/index")
	public String index() {
		return "user/index";
	}

	@GetMapping("/user/contact")
	public String contact() {
		return "user/contact";
	}

	@GetMapping("/user/category")
	public String category() {
		return "user/category";
	}

	@GetMapping("/user/cart")
	public String cart() {
		return "user/cart";
	}

	@GetMapping("/user/checkout")
	public String checkout() {
		return "user/checkout";
	}

	@GetMapping("/user/singleblog")
	public String singleblog() {
		return "user/singleblog";
	}

	@GetMapping("/user/singleproduct")
	public String singleproduct() {
		return "user/singleproduct";
	}

	@GetMapping("/user/trackingorder")
	public String trackingorder() {
		return "user/trackingorder";
	}

	@GetMapping("/user/confirmation")
	public String confirmation() {
		return "user/confirmation";
	}

	@GetMapping("/user/blog")
	public String blog() {
		return "user/blog";
	}

	@GetMapping("/user/login")
	public String login() {
		return "user/login";
	}

	@PostMapping("/user/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("password") String pw) {
		User user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");

		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Invalid password!");
		} else {
			session.setAttribute("user", user);

			if (user.getRoles().getName().equals("admin")) {
				return "redirect:/admin/index";
			} else if (user.getRoles().getName().equals("user")) {
				return "redirect:/user/index";
			}
			model.addAttribute("message", "Login successfully!");
		}
		return "user/login";
	}

	@GetMapping("/user/register")
	public String registerg() {
		return "user/register";
	}
}

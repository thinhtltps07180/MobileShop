package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
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
	
	@GetMapping("/user/register")
	public String registerg() {
		return "user/register";
	}
}

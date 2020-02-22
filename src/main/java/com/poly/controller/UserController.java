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
	
}

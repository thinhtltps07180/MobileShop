package com.poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Role;
import com.poly.entity.User;

@Controller
public class AdminController {
	
	@Autowired
	UserDAO dao;
	
	@Autowired
	RoleDAO roleDAO;
	
	@Autowired
	ServletContext app;
	
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
	
	@GetMapping("/home/register")
	public String register(Model model) {
		model.addAttribute("form", new User());
		return "home/register";
	}

	@PostMapping("/home/register")
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			user.setPhoto(user.getPhoto());
		} else {
			user.setPhoto(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/images/users/" + user.getPhoto());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			return "home/register";
		} else {
			try {

				Role role = new Role();
//				role.setId(user.getRoles().getId());
//				user.setRoles(role);
				role.setId(2);
				user.setRoles(role);
				dao.create(user);
				model.addAttribute("message", "Đăng ký thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Đăng ký thất bại!");
				return "redirect:/home/register";
				
			}
		}

//		model.addAttribute("form" , user);
		return "home/login";
	}
	
}

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
	
	
	@GetMapping("/admin/login")
	public String login() {
		return "admin/login";
	}

//	@RequestMapping("/home/logout")
//	public String logout() {
//		session.removeAttribute("user");
//		return "redirect:/home/index";
//	}

	@PostMapping("/admin/login")
	public String login(Model model, @RequestParam("id") String id, @RequestParam("password") String pw) {
		User user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");
			return "admin/login";
			
		} else if (!pw.equals(user.getPassword())) {
			model.addAttribute("message", "Invalid password!");
			return "admin/login";
		} else {
//			session.setAttribute("user", user);

//			if (user.getRoles().getName().equals("admin")) {
//				return "redirect:/admin/userList";
//			} else if (user.getRoles().getName().equals("user")) {
//				return "redirect:/home/index";
//			} else if (user.getRoles().getName().equals("client")) {
//				return "redirect:/client/home";
//			} else if (user.getRoles().getName().equals("journalist")) {
//				return "redirect:/journalist/home";
//			}
			model.addAttribute("message", "Login successfully!");	
		}
		return "admin/index";
	}
	


	@PostMapping("/admin/register")
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
		return "admin/login";
	}
	
}

package com.poly.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.entity.Role;
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
	CategoryDAO  categoryDao;
	
	@Autowired
	ProductDAO productDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;

	@Autowired
	RoleDAO roleDAO;

	@GetMapping("/user/index")
	public String index(Model model) {
		List<Product> newList = productDao.findAllNew();
		model.addAttribute("newList", newList);
		return "user/index";
	}

	@GetMapping("/user/contact")
	public String contact() {
		return "user/contact";
	}
	
	@GetMapping("/user/category")
	public String category(Model model) {
		List<Product> list = productDao.findAll();
		List<Category> listCategory = categoryDao.findAll();
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);
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

	@GetMapping("/user/singleproduct/{id}")
	public String singleproduct(Model model , @PathVariable("id") Integer id) {
		Product p = productDao.findById(id);
		List<Category> list = categoryDao.findAll();
		model.addAttribute("listCategory", list);
		model.addAttribute("detail", p);
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

			if (user.getRole().getName().equals("admin")) {
				return "redirect:/admin/index";
			} else if (user.getRole().getName().equals("user")) {
				return "redirect:/user/index";
			}
			model.addAttribute("message", "Login successfully!");
		}
		return "user/login";
	}

	@GetMapping("/user/register")
	public String register(Model model) {
		model.addAttribute("form", new User());
		return "user/register";
	}
	
	@PostMapping("/user/register")
	public String register(Model model, @Validated @ModelAttribute("form") User user, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			user.setPhoto(user.getPhoto());
		} else {
			user.setPhoto(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/user/photo/" + user.getPhoto());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			return "user/register";
		} else {
			try {
				Role role = new Role();
				role.setId(2);
				user.setRole(role);
				dao.create(user);
			} catch (Exception e) {
				return "redirect:/user/register";		
			}
		}

//		model.addAttribute("form" , user);
		return "user/login";
	}
}

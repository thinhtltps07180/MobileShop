package com.poly.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.PromotionDAO;
import com.poly.dao.ReviewDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.StatusDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Category;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.entity.Promotion;
import com.poly.entity.Review;
import com.poly.entity.Role;
import com.poly.entity.Status;
import com.poly.entity.User;

@Controller
public class AdminController {

	@Autowired
	UserDAO userDao;
	
	@Autowired
	PromotionDAO promotionDao;

	@Autowired
	ProductDAO productDao;

	@Autowired
	OrderDAO orderDao;

	@Autowired
	OrderDetailDAO orderDetailDao;

	@Autowired
	RoleDAO roleDao;

	@Autowired
	CategoryDAO categoryDao;
	
	@Autowired
	ReviewDAO reviewDao;
	
	@Autowired
	StatusDAO statusDAO;

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



	@GetMapping("/admin/products")
	public String productList(Model model) {
		List<Product> list = productDao.findAll();
		model.addAttribute("productList", list);
		return "admin/products";
	}

	@GetMapping("/admin/create")
	public String register(Model model) {
		List<Category> list = categoryDao.findAll();
		model.addAttribute("form", new Product());
		model.addAttribute("list", list);
		return "admin/create";
	}

	@PostMapping("/admin/create")
	public String register(Model model, @Validated @ModelAttribute("form") Product product, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			product.setImage(product.getImage());
		} else {
			product.setImage(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/admin/product/" + product.getImage());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			return "admin/create";
		} else {
			try {
				Category category = new Category();
				category.setId(product.getCategory().getId());
				product.setCategory(category);
				product.setCreateDate(new Date());
				productDao.create(product);

			} catch (Exception e) {
				return "redirect:/admin/create";
			}
		}

		return "redirect:/admin/products";
	}

	@GetMapping("/admin/edit/{id}")
	public String edit(Model model, @PathVariable("id") Integer id) {
		Product p = productDao.findById(id);
		List<Category> list = categoryDao.findAll();
		List<Promotion> listPromotion = promotionDao.findAll();
		model.addAttribute("list", list);
		model.addAttribute("form", p);
		model.addAttribute("listPromotion", listPromotion);
		return "admin/edit";
	}

	@PostMapping("/admin/update")
	public String update(Model model, @Valid @ModelAttribute("form") Product product, BindingResult errors,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			product.setImage(product.getImage());
		} else {
			product.setImage(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/admin/product/" + product.getImage());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			List<Category> list = categoryDao.findAll();
			model.addAttribute("list", list);
			return "admin/edit";
		} else {
			try {
				Category category = new Category();
				category.setId(product.getCategory().getId());
				product.setCategory(category);
				product.setCreateDate(new Date());
				productDao.update(product);
				model.addAttribute("message", "Update thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Update thất bại!");
			}

			// model.addAttribute("form" , user);

			return "redirect:/admin/products";
		}
	}
	
	@GetMapping("/admin/users")
	public String adminList(Model model) {
		List<User> list = userDao.findAll();
		model.addAttribute("listUsers", list);
		return "admin/users";
	}
	
	@RequestMapping("/admin/delete/{id}")
	public String delete(Model model, @PathVariable("id") Integer id) {	
		productDao.delete(id);
		return "redirect:/admin/products";
	}
	
	@RequestMapping("/admin/editUser/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User user = userDao.findById(id);
		model.addAttribute("listRole", roleDao.findAll());
		model.addAttribute("userEdit", user);
		return "admin/userEdit";
	}
	
	
	@PostMapping("/admin/updateUser")
	public String register(Model model, @Validated @ModelAttribute("userEdit") User user, BindingResult errors,
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
			return "redirect:/admin/userEdit";
		} else {
			try {
				Role role = new Role();
				role.setId(user.getRole().getId());
				user.setRole(role);
				userDao.update(user);
			} catch (Exception e) {
				return "redirect:/admin/userEdit";		
			}
		}

//		model.addAttribute("form" , user);
		return "redirect:/admin/users";
	}
	
	@GetMapping("/admin/blog")
	public String blog(Model model) {
		List<Review> listReview = reviewDao.findAll();
		model.addAttribute("reviewList" ,listReview );
		return "admin/blog";
	}
	
	@GetMapping("/admin/order")
	public String order(Model model) {
		List<Order> listOrder = orderDao.findAll();
		model.addAttribute("listOrder" ,listOrder );
		return "admin/order";
	}
	
	@GetMapping("/admin/orderStatus")
	public String orderStatus(Model model) {
		List<Order> st = orderDao.findByStatus();
		model.addAttribute("st" ,st );
		return "admin/orderStatus";
	}
	
	@RequestMapping("/admin/checkOrders/{value}/{id}")
	public String checkOrders(Model model , @PathVariable("id") Integer id) {
		Order order = orderDao.findById(id);
		Status st = statusDAO.findById(2);
		order.setStatus(st);
		orderDao.update(order);;
		return "redirect:/admin/orderStatus";
	}
	
	@GetMapping("/admin/isDelivery")
	public String isDelivery(Model model) {
		List<Order> st = orderDao.findByIsDelivery();
		model.addAttribute("st" ,st );
		return "admin/isDelivery";
	}
	
	@RequestMapping("/admin/isDelivery/{value}/{id}")
	public String checkOrdersisDelivery(Model model , @PathVariable("id") Integer id) {
		Order order = orderDao.findById(id);
		Status st = statusDAO.findById(3);
		order.setStatus(st);
		orderDao.update(order);;
		return "redirect:/admin/order";
	}

}

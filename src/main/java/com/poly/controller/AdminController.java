package com.poly.controller;

import java.io.File;
import java.time.LocalDate;
import java.time.Month;
import java.time.Year;
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
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.PromotionDAO;
import com.poly.dao.ReportDAO;
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
	ReportDAO reportDao;

	@Autowired
	ServletContext app;

	@ResponseBody
	@RequestMapping("/test/query")
	public String query() {
		return "OK";
	}

	@GetMapping("/admin/index")
	public String index(Model model) {
		List<Order> listOrder = orderDao.findAll();
		model.addAttribute("listOrder", listOrder);

		model.addAttribute("data", reportDao.revenueByDate());
		
		model.addAttribute("rnvDay", reportDao.revenueByDay());
		model.addAttribute("rnvMonth", reportDao.totalMonth());
		model.addAttribute("rnvYear", reportDao.totalYear());
		
		model.addAttribute("sumOrder", reportDao.sumOrderofDay());
		model.addAttribute("sumOrderYear", reportDao.sumOrderofYear());
		model.addAttribute("sumOrderM", reportDao.sumOrderofMonth());
		
		model.addAttribute("rnvCusMonth", reportDao.revenueByCustomerMonth());
		model.addAttribute("rnvCus", reportDao.revenueByCustomer());

		LocalDate today = LocalDate.now();
		int month = today.getMonthValue();
		int year = today.getYear();
		int day = today.getDayOfMonth();

		model.addAttribute("dayNow", day);
		model.addAttribute("monthNow", month);
		model.addAttribute("yearNow", year);

		return "admin/index";
	}

	@GetMapping("/admin/category")
	public String category(Model model) {
		List<Category> list = categoryDao.findAll();
		model.addAttribute("categoryList", list);
		return "admin/category";
	}

	@GetMapping("/admin/createCategory")
	public String createCategory(Model model) {
		model.addAttribute("form", new Category());
		return "admin/createCategory";
	}

	@PostMapping("/admin/createCategory")
	public String addCategory(Model model, @Validated @ModelAttribute("form") Category category, BindingResult errors) {
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");
			return "admin/createCategory";
		} else {

			categoryDao.create(category);
		}

		return "redirect:/admin/category";

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
		List<Promotion> listPromotion = promotionDao.findAll();
		model.addAttribute("listPromotion", listPromotion);
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
			List<Category> list = categoryDao.findAll();
			model.addAttribute("list", list);
			List<Promotion> listPromotion = promotionDao.findAll();
			model.addAttribute("listPromotion", listPromotion);
			return "admin/create";
		} else {
			try {
				Category category = new Category();
				category.setId(product.getCategory().getId());
				product.setCategory(category);
				if (product.getCategory().getId() == null) {
					List<Category> list = categoryDao.findAll();
					model.addAttribute("list", list);
					model.addAttribute("messageCategory", "Vui lòng chọn loại sản phẩm");
					List<Promotion> listPromotion = promotionDao.findAll();
					model.addAttribute("listPromotion", listPromotion);
					return "admin/create";

				}
				if (product.getPromotion().getId() == null) {
					List<Category> list = categoryDao.findAll();
					model.addAttribute("list", list);
					model.addAttribute("messagePromotion", "Vui lòng chọn khuyến mãi cho sản phẩm");
					List<Promotion> listPromotion = promotionDao.findAll();
					model.addAttribute("listPromotion", listPromotion);
					return "admin/create";

				}
				product.setCreateDate(new Date());
				productDao.create(product);

			} catch (Exception e) {
				return "admin/create";
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
			List<Promotion> listPromotion = promotionDao.findAll();
			model.addAttribute("listPromotion", listPromotion);
			return "admin/edit";
		} else {
			try {
				Category category = new Category();
				category.setId(product.getCategory().getId());
				product.setCategory(category);
				if (product.getCategory().getId() == null) {
					List<Category> list = categoryDao.findAll();
					model.addAttribute("list", list);
					model.addAttribute("messageCategory", "Vui lòng chọn loại sản phẩm");
					List<Promotion> listPromotion = promotionDao.findAll();
					model.addAttribute("listPromotion", listPromotion);
					return "admin/create";

				}
				if (product.getPromotion().getId() == null) {
					List<Category> list = categoryDao.findAll();
					model.addAttribute("list", list);
					model.addAttribute("messagePromotion", "Vui lòng chọn khuyến mãi cho sản phẩm");
					List<Promotion> listPromotion = promotionDao.findAll();
					model.addAttribute("listPromotion", listPromotion);
					return "admin/create";

				}
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
	
	@RequestMapping("/admin/delete/review/{id}")
	public String deleteReview(Model model, @PathVariable("id") Integer id) {
		reviewDao.delete(id);
		return "redirect:/admin/review";
	}

	@GetMapping("/admin/addUser")
	public String getFormUser(Model model) {
		model.addAttribute("formUser", new User());
		model.addAttribute("listRole", roleDao.findAll());
		return "admin/createUser";
	}

	@PostMapping("/admin/addNewUser")
	public String formUser(Model model, @Validated @ModelAttribute("formUser") User user, BindingResult errors,
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
			model.addAttribute("listRole", roleDao.findAll());
			return "admin/createUser";
		} else {
			try {
				Role role = new Role();
				role.setId(user.getRole().getId());
				user.setRole(role);
				userDao.create(user);
			} catch (Exception e) {
				return "admin/createUser";
			}
		}

//		model.addAttribute("form" , user);
		return "redirect:/admin/users";
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
			model.addAttribute("listRole", roleDao.findAll());
			return "admin/userEdit";
		} else {
			try {
				Role role = new Role();
				role.setId(user.getRole().getId());
				user.setRole(role);
				userDao.update(user);
			} catch (Exception e) {
				return "admin/userEdit";
			}
		}

//		model.addAttribute("form" , user);
		return "redirect:/admin/users";
	}

	@GetMapping("/admin/review")
	public String blog(Model model) {
		List<Review> listReview = reviewDao.findAll();
		List<Review> listReviewTrue = reviewDao.findAllTrue();
		model.addAttribute("reviewListTrue", listReviewTrue);
		model.addAttribute("reviewList", listReview);
		return "admin/review";
	}
	
	@RequestMapping("/admin/checkReview/{value}/{id}")
	public String checkReview(Model model, @PathVariable("id") Integer id) {
		Review rv = reviewDao.findById(id);
		rv.setStatus(true);;
		reviewDao.update(rv);
		;
		return "redirect:/admin/review";
	}

	@GetMapping("/admin/order")
	public String order(Model model) {
		List<Order> listOrder = orderDao.findAll();
		model.addAttribute("listOrder", listOrder);
		return "admin/order";
	}

	@RequestMapping("/admin/orderDetail/{orderId}/{id}")
	public String detail(Model model, @PathVariable("id") Integer id, @PathVariable("orderId") Integer orderId) {
		List<OrderDetail> list = orderDetailDao.findAllByOrderId(id);
		Order order = orderDao.findById(orderId);
		model.addAttribute("order", order);
		model.addAttribute("listDetail", list);

		return "admin/orderDetail";
	}

	@GetMapping("/admin/orderStatus")
	public String orderStatus(Model model) {
		List<Order> st = orderDao.findByStatus();
		model.addAttribute("st", st);
		return "admin/orderStatus";
	}

	@RequestMapping("/admin/checkOrders/{value}/{id}")
	public String checkOrders(Model model, @PathVariable("id") Integer id) {
		Order order = orderDao.findById(id);
		Status st = statusDAO.findById(2);
		order.setStatus(st);
		orderDao.update(order);
		;
		return "redirect:/admin/isDelivery";
	}

	@GetMapping("/admin/isDelivery")
	public String isDelivery(Model model) {
		List<Order> st = orderDao.findByIsDelivery();
		model.addAttribute("st", st);
		return "admin/isDelivery";
	}

	@RequestMapping("/admin/isDelivery/{value}/{id}")
	public String checkOrdersisDelivery(Model model, @PathVariable("id") Integer id) {
		Order order = orderDao.findById(id);
		Status st = statusDAO.findById(3);
		order.setStatus(st);
		orderDao.update(order);
		;
		return "redirect:/admin/isPaid";
	}

	@GetMapping("/admin/isPaid")
	public String isisPaid(Model model) {
		List<Order> st = orderDao.findByIsPaid();
		model.addAttribute("st", st);
		return "admin/isPaid";
	}

	@RequestMapping("/admin/isPaid/{value}/{id}")
	public String checkOrdersisPaid(Model model, @PathVariable("id") Integer id) {
		Order order = orderDao.findById(id);
		Status st = statusDAO.findById(5);
		order.setStatus(st);
		orderDao.update(order);
		;
		return "redirect:/admin/order";
	}

}

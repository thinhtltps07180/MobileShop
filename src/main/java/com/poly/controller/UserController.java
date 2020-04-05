package com.poly.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
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
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.ReviewDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.StatusDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Category;
import com.poly.entity.Order;
import com.poly.entity.Product;
import com.poly.entity.Review;
import com.poly.entity.Role;
import com.poly.entity.Status;
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
	StatusDAO statusDao;
	
	@Autowired
	CategoryDAO  categoryDao;
	
	@Autowired
	ProductDAO productDao;
	
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	ReviewDAO reviewDAO;

	@Autowired
	RoleDAO roleDAO;
	
	@Autowired
	public JavaMailSender emailSender;

	@GetMapping("/user/index")
	public String index(Model model) {
		List<Product> newList = productDao.findAllNew();
		List<Product> trendList = productDao.findTrend();
		List<Review> listReview = reviewDAO.findAll();	
		model.addAttribute("reviewList" ,listReview );
		model.addAttribute("newList", newList);
		model.addAttribute("trendList", trendList);
		return "user/index";
	}

	@GetMapping("/user/contact")
	public String contact() {
		return "user/contact";
	}
	
	@GetMapping("/user/category/{pageNo}")
	public String category(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.findPage(pageNo);
		List<Category> listCategory = categoryDao.findAll();
		
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);

		return "user/category";
	}
	
	@GetMapping("/user/categorySortAsc/{pageNo}")
	public String categorySortAsc(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.sortAsc(pageNo);
		List<Category> listCategory = categoryDao.findAll();
		
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);
		return "user/categorySortAsc";
	}
	
	@GetMapping("/user/categorySortDesc/{pageNo}")
	public String categorySortDesc(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.sortDesc(pageNo);
		List<Category> listCategory = categoryDao.findAll();
		
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);
		return "user/categorySortDesc";
	}
	
	
	@GetMapping("/user/category/{pageNo}/{categoryId}")
	public String getProductByCategory(Model model , @PathVariable( name ="pageNo") int pageNo , @PathVariable( name ="categoryId") int categoryId) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.findProductByCategory(pageNo,categoryId);
		List<Category> listCategory = categoryDao.findAll();
		
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);

		return "user/productByCategory";
	}
	
	@GetMapping("/user/categoryByIphone/{pageNo}")
	public String categoryByIphone(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.findByIphone(pageNo);
		List<Category> listCategory = categoryDao.findAll();
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);

		return "user/categoryByIphone";
	}
	
	@GetMapping("/user/categoryBySamSung/{pageNo}")
	public String categoryBySamSung(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.findBySamSung(pageNo);
		List<Category> listCategory = categoryDao.findAll();
		
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);

		return "user/categoryBySamSung";
	}
	
	@GetMapping("/user/categoryByXiaomi/{pageNo}")
	public String categoryByXiaoMi(Model model , @PathVariable( name ="pageNo") int pageNo) {
		if(pageNo >= productDao.getPageCount()) {
			pageNo = 0;
		}else if(pageNo < 0) {
			pageNo = productDao.getPageCount() - 1;
		}
		

		model.addAttribute("pageNo", pageNo);
		model.addAttribute("lastPageCount", productDao.getPageCount() - 1);
		List<Product> list = productDao.findByXiaoMi(pageNo);
		List<Category> listCategory = categoryDao.findAll();
		
		model.addAttribute("categoryList" ,listCategory );
		model.addAttribute("productList", list);

		return "user/categoryByXiaomi";
	}
	



	@GetMapping("/user/cart")
	public String cart() {
		return "user/cart";
	}

	@GetMapping("/user/checkout")
	public String checkout() {
		return "user/checkout";
	}

	
	@GetMapping("/user/singleblog/{id}")
	public String singleblog(Model model , @PathVariable("id") Integer id) {
		Review r = reviewDAO.findById(id);
		model.addAttribute("detail", r);
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
	
	@GetMapping("/user/logout")
	public String logout() {
		session.removeAttribute("user");
		return "user/index";
	}


	@GetMapping("/user/blog")
	public String blog(Model model) {
		List<Review> listReview = reviewDAO.findAll();	
		model.addAttribute("reviewList" ,listReview );
		return "user/blog";
	}
	
	@GetMapping("/user/myBlog")
	public String myBlog(Model model) {
		List<Review> list = reviewDAO.findByUserId();
		model.addAttribute("listMyBlog", list);
		return "user/myBlog";
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
			model.addAttribute("userInfor", user);

			if (user.getRole().getName().equals("admin")) {
//				String url = (String) session.getAttribute("back-url");
//				if(url != null) {
//					return "redirect:"+url;
//				}
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
	
	@GetMapping("/user/edit")
	public String edit(Model model) {
		User user = (User) session.getAttribute("user");
		user = dao.findById(user.getId());
		List<Role> list = roleDAO.findAll();
		model.addAttribute("listRole", list);
		model.addAttribute("userEdit", user);
		return "user/profile";
	}
	
	@RequestMapping("/user/editUser/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		User user = dao.findById(id);
		model.addAttribute("listRole", roleDAO.findAll());
		model.addAttribute("userEdit", user);
		return "user/edit";
	}

	@PostMapping("/user/updateUser")
	public String updateUser(Model model, @Validated @ModelAttribute("userEdit") User user, BindingResult errors,
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
			return "redirect:/user/edit";
		} else {
			try {
				Role role = new Role();
				role.setId(user.getRole().getId());
				user.setRole(role);
				dao.update(user);
			} catch (Exception e) {
				return "redirect:/user/edit";		
			}
		}

//		model.addAttribute("form" , user);
		return "redirect:/admin/profile";
	}
	

	
	@GetMapping("/user/createNews")
	public String createNews(Model model) {
		model.addAttribute("news", new Review());
		// tao object moi
		return "user/createNews";
	}
	
	@RequestMapping("/user/updateNews/{id}")
	public String updateNews(Model model, @PathVariable("id") Integer id) {
		Review news = reviewDAO.findById(id);
		model.addAttribute("updateNews", news);
		return "user/updateNews";
	}
	
	@PostMapping("/user/updateNews")
	public String updateNews(Model model,@Valid @ModelAttribute("updateNews") Review review,  BindingResult errors ,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			review.setThumbnail(review.getThumbnail());
		} else {
			review.setThumbnail(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/user/news/" + review.getThumbnail());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");

			return "user/updateNews";	
		}else {
			try {
				User user = (User) session.getAttribute("user");// lay cai thang login vao
				review.setUser(user);// set cai thang do vao 
				review.setCreateDate(new Date());
				reviewDAO.update(review);
				model.addAttribute("message", "Tạo bài viết thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Tạo bài viết  thất bại!");
				
			}
		}
		

		// model.addAttribute("form" , user);

		return "redirect:/user/myBlog";
	}
	
	
	
	@PostMapping("/user/createNews")
	public String register(Model model,@Valid @ModelAttribute("news") Review review,  BindingResult errors ,
			@RequestParam("up_photo") MultipartFile file) {
		if (file.isEmpty()) {
			review.setThumbnail("news.png");
		} else {
			review.setThumbnail(file.getOriginalFilename());
			try {
				String path = app.getRealPath("/static/user/news/" + review.getThumbnail());
				file.transferTo(new File(path));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		if (errors.hasErrors()) {
			model.addAttribute("message", "Vui lòng sửa các lỗi sau đây");

			return "user/createNews";	
		}else {
			try {
				User user = (User) session.getAttribute("user");// lay cai thang login vao
				review.setUser(user);// set cai thang do vao 
				review.setStatus(false);
				review.setCreateDate(new Date());
				reviewDAO.create(review);
				model.addAttribute("message", "Tạo bài viết thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Tạo bài viết  thất bại!");
				
			}
		}
		

		// model.addAttribute("form" , user);

		return "redirect:/user/blog";
	}
	
	@RequestMapping("/user/cancle/{index}/{id}")
	public String clear(Model model , @PathVariable("id") Integer id) {
		Order order = orderDao.findById(id);
		Status st = statusDao.findById(4);
		order.setStatus(st);
		orderDao.update(order);
		return "redirect:/user/orderList";
	}
	
	

	
	@GetMapping("/user/forget")
	public String forget() {
		return "user/forget";
	}

	@PostMapping("/user/forget")
	public String forget(Model model, @RequestParam("id") String id, @RequestParam("email") String email) {
		User user = dao.findById(id);
		if (user == null) {
			model.addAttribute("message", "Invalid username!");

		} else if (!email.equals(user.getEmail())) {
			model.addAttribute("message", "Invalid email!");

		} else {
			SimpleMailMessage message = new SimpleMailMessage();
			message.setTo(user.getEmail());
			message.setSubject("Your password");
			message.setText("Welcome to the shop, we are very happy that you have trusted our store\r\n"
					+ "Here is your account and password:\r\n" + "Your account id is: " + user.getId() + "\r\n"
					+ "Your password is: " + user.getPassword() + "\r\n" + "Thanks and warm regards");
			this.emailSender.send(message);
			
			model.addAttribute("message", "Success, please check you email!");
			return "redirect:/user/login";
			
		}
		return "user/forget";
	}

	@Bean
	public JavaMailSender getJavaMailSender() {
		JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
		mailSender.setHost("smtp.gmail.com");
		mailSender.setPort(587);

		mailSender.setUsername("dquangcuong1505@gmail.com");
		mailSender.setPassword("mingtyno0");

		Properties props = mailSender.getJavaMailProperties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.debug", "true");

		return mailSender;
	}
}

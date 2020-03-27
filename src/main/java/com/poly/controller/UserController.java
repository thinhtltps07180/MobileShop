package com.poly.controller;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.sound.sampled.ReverbType;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.ReviewDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Category;
import com.poly.entity.Product;
import com.poly.entity.Review;
import com.poly.entity.Role;
import com.poly.entity.User;
import com.poly.service.Pagination;


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
	ReviewDAO reviewDAO;

	@Autowired
	RoleDAO roleDAO;
	
	@Autowired
	public JavaMailSender emailSender;

	@GetMapping("/user/index")
	public String index(Model model) {
		List<Product> newList = productDao.findAllNew();
		List<Product> trendList = productDao.findTrend();
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
	
	@GetMapping("/user/url/{url}")
	public String url(Model model , @PathVariable("url") String url) {
		List<User> checkUser =dao.findByEmail(url);
		if(checkUser == null) {
			User u = new User();
			u.setEmail(url);
			model.addAttribute("usergg", u);
			return "user/AccountGG";
		}

		

		
		return "user/index";
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
	


	@GetMapping("/user/blog")
	public String blog(Model model) {
		List<Review> listReview = reviewDAO.findAll();
		
		model.addAttribute("reviewList" ,listReview );
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
	@GetMapping("/user/createNews")
	public String createNews(Model model) {
		model.addAttribute("news", new Review());
		// tao object moi
		return "user/createNews";
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
				review.setCountViewer(0);
				reviewDAO.create(review);
				model.addAttribute("message", "Tạo bài viết thành công!");
			} catch (Exception e) {
				model.addAttribute("message", "Tạo bài viết  thất bại!");
				
			}
		}
		

		// model.addAttribute("form" , user);

		return "redirect:/user/blog";
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

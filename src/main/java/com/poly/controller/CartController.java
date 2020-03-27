package com.poly.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.CategoryDAO;
import com.poly.dao.OrderDAO;
import com.poly.dao.OrderDetailDAO;
import com.poly.dao.ProductDAO;
import com.poly.dao.RoleDAO;
import com.poly.dao.StatusDAO;
import com.poly.dao.UserDAO;
import com.poly.entity.Order;
import com.poly.entity.OrderDetail;
import com.poly.entity.Product;
import com.poly.entity.Status;
import com.poly.entity.User;
import com.poly.service.CartService;

@Controller
public class CartController {
	@Autowired
	HttpSession session;

	@Autowired
	ServletContext app;

	@Autowired
	UserDAO dao;

	@Autowired
	CategoryDAO categoryDao;

	@Autowired
	ProductDAO productDao;

	@Autowired
	OrderDetailDAO orderDetailDao;

	@Autowired
	OrderDAO orderDao;
	
	@Autowired
	RoleDAO roleDAO;
	
	@Autowired
	StatusDAO statusDAO;

	@Autowired
	CartService cart;

	@RequestMapping("/cart/add/{pageNo}/{id}")
	public String add(@PathVariable("id") Integer id , @PathVariable("pageNo") Integer pageNo) {
		cart.add(id);
		String redirect = "redirect:/user/category/"+pageNo;
		return redirect;
	}
	
	@RequestMapping("/cart/addAsc/{pageNo}/{id}")
	public String addSortAsc(@PathVariable("id") Integer id , @PathVariable("pageNo") Integer pageNo) {
		cart.add(id);
		String redirect = "redirect:/user/categorySortAsc/"+pageNo;
		return redirect;
	}
	
	@RequestMapping("/cart/addDesc/{pageNo}/{id}")
	public String addSortDesc(@PathVariable("id") Integer id , @PathVariable("pageNo") Integer pageNo) {
		cart.add(id);
		String redirect = "redirect:/user/categorySortDesc/"+pageNo;
		return redirect;
	}
	@RequestMapping("/cart/view")
	public String index() {
		return "user/cart";
	}

	@RequestMapping("/cart/remove/{id}")
	public String remove(@PathVariable("id") Integer id) {
		cart.remove(id);
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/update")
	public String update(HttpServletRequest request) {
		List<Product> list = cart.getItems();
		for (Product p : list) {
			String id = p.getId().toString();
			int qty = Integer.parseInt(request.getParameter(id));
		cart.update(p.getId(), qty);
		}
		return "redirect:/cart/view";
	}

	@RequestMapping("/cart/clear")
	public String clear() {
		cart.clear();
		return "redirect:/cart/view";
	}
	
	@RequestMapping("/cart/accept")
	public String accept(Model model, HttpServletRequest request) {
		Order order = new Order();
		order.setOrderDate(new Date());
		order.setAmount(cart.getAmount());
		User user = (User) session.getAttribute("user");
		order.setUser(user);
		Status st = statusDAO.findById(1);
		order.setStatus(st);


		List<OrderDetail> orderDetails = new ArrayList<OrderDetail>();
		List<Product> list = cart.getItems();
		for (Product p : list) {
			OrderDetail orderDetail = new OrderDetail();
			orderDetail.setUnitPrice(cart.getAmount());
			orderDetail.setQuantity(p.getQuantity());
			orderDetail.setImage(p.getImage());
			orderDetail.setStatus(false);
			orderDetail.setOrder(order);
			orderDetail.setProduct(p);
//			orderDetail.setImage(image);
			orderDetails.add(orderDetail);
			Product product = productDao.findById(p.getId());
			int a = product.getQuantity();
			System.out.println(a);		
			product.setQuantity(a - p.getQuantity());
			productDao.update(product);
			System.out.println(product.getQuantity());	
		}


		orderDao.create(order, orderDetails);

		return "redirect:/user/orderList";
	}
	
	@RequestMapping("/user/orderList")
	public String orderList(Model model) {
		List<Order> listOrDer = orderDao.findAllByUser();
		model.addAttribute("listDetailByUser", listOrDer);
	
		return "user/orderList";
	}
	
	@RequestMapping("/user/orderDetail/{orderId}/{id}")
	public String detail(Model model, @PathVariable("id") Integer id , @PathVariable("orderId") Integer orderId) {
		List<OrderDetail> list = orderDetailDao.findAllByOrderId(id);
		Order order = orderDao.findById(orderId);
		System.out.println(order.getId());
		model.addAttribute("order", order);
		model.addAttribute("listDetail", list);

		return "user/orderDetail";
	}
	


}

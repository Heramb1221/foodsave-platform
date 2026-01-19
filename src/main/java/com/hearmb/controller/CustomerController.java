package com.hearmb.controller;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.heramb.model.FoodItems;
import com.heramb.model.Orders;
import com.heramb.model.User;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.heramb.dao.FoodItemsDao;
import com.heramb.dao.OrderDao;
import com.heramb.dao.UserDao;
import com.heramb.enums.OrderStatus;
import com.heramb.enums.Role;
import com.heramb.enums.Status;

@Controller
public class CustomerController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	UserDao userDao = context.getBean("userDao", UserDao.class);
	FoodItemsDao foodItemsDao = context.getBean("foodItemsDao", FoodItemsDao.class);
	OrderDao orderDao = context.getBean("orderDao", OrderDao.class);

	@RequestMapping("/customerDashboard")
	public String customerDashboard() {
		return "customer";
	}

	@PostMapping("/registerNewCustomer")
	public String registerCustomer(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		try {
			User customer = new User();
			customer.setName(request.getParameter("name"));
			customer.setEmail(request.getParameter("email"));
			customer.setPhone(request.getParameter("phone"));
			customer.setPassword(request.getParameter("password"));
			customer.setRole(Role.CUSTOMER);
			customer.setStatus(Status.APPROVED);

			Long id = userDao.addUser(customer);

			if (id != null) {
				return "redirect:/customer";
			} else {
				redirectAttributes.addFlashAttribute("error", "Error creating customer.");
				return "redirect:/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "An unexpected error occurred.");
			return "redirect:/error";
		}
	}

	@PostMapping("/customerLogin")
	public String loginCustomer(HttpServletRequest request, HttpSession session,
			RedirectAttributes redirectAttributes) {
		try {
			String email = request.getParameter("customerEmail");
			String password = request.getParameter("customerPassword");

			User user = userDao.getUserByEmail(email);

			if (user != null && user.getPassword().equals(password) && user.getRole() == Role.CUSTOMER
					&& user.getStatus() == Status.APPROVED) {

				session.setAttribute("loggedInCustomer", user);

				session.setAttribute("foodItemsDao", foodItemsDao);

				return "customer";
			} else {
				redirectAttributes.addFlashAttribute("error", "Invalid credentials or account not approved.");
				return "redirect:/error";
			}

		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "An unexpected error occurred during login.");
			return "redirect:/error";
		}
	}

	@PostMapping("/placeOrder")
	public String placeOrder(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) {
		try {
			Long foodItemId = Long.parseLong(request.getParameter("foodItemId"));
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			LocalDateTime pickupTime = LocalDateTime.parse(request.getParameter("pickupTime"));

			FoodItems item = foodItemsDao.getFoodItemById(foodItemId);
			if (item.getQuantity() < quantity) {
				redirectAttributes.addFlashAttribute("error", "Not enough items available.");
				return "redirect:/error";
			}

			Orders order = new Orders();
			order.setFoodItemId(foodItemId);
			order.setCustomerId(((User) session.getAttribute("loggedInCustomer")).getId());
			order.setQuantity(quantity);
			order.setPickupTime(pickupTime);
			order.setOrderDate(LocalDateTime.now());
			order.setTotalAmount(quantity * item.getDiscountedPrice());
			order.setStatus(OrderStatus.PENDING);

			orderDao.addOrder(order);

			item.setQuantity(item.getQuantity() - quantity);
			foodItemsDao.updateFoodItem(item);

			return "redirect:/customerDashboard";
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Error placing order.");
			return "redirect:/error";
		}
	}

	@GetMapping("/orderForm")
	public String showOrderForm(HttpServletRequest request, HttpSession session) {
		String foodItemIdStr = request.getParameter("foodItemId");
		if (foodItemIdStr != null) {
			Long foodItemId = Long.parseLong(foodItemIdStr);
			FoodItems item = foodItemsDao.getFoodItemById(foodItemId);
			session.setAttribute("foodItem", item);
		}
		return "orderForm";
	}

	@GetMapping("/viewOrders")
	public String viewOrders(HttpSession session) {
		User customer = (User) session.getAttribute("loggedInCustomer");
		if (customer == null) {
			return "redirect:/login";
		}

		List<Orders> orders = orderDao.getOrdersByCustomer(customer.getId());
		session.setAttribute("customerOrders", orders);
		return "viewOrders";
	}
	
	@RequestMapping("/customerOrders")
	public String customerOrders(HttpSession session, HttpServletRequest request) {
	    User customer = (User) session.getAttribute("loggedInCustomer");
	    if (customer == null) {
	        return "redirect:/customerLoginPage";
	    }

	    List<Orders> orders = orderDao.getOrdersByCustomer(customer.getId());
	    
	    Map<Long, FoodItems> foodMap = new HashMap<Long, FoodItems>();
	    for (Orders o : orders) {
	        FoodItems item = foodItemsDao.getFoodItemById(o.getFoodItemId());
	        foodMap.put(item.getId(), item);
	    }

	    request.setAttribute("orders", orders);
	    request.setAttribute("foodMap", foodMap);
	    return "customerOrders";
	}

	@PostMapping("/customerLogout")
	public String logoutCustomer(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}

}

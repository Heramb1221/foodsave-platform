package com.hearmb.controller;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.ui.Model;

import com.heramb.dao.FoodItemsDao;
import com.heramb.dao.OrderDao;
import com.heramb.dao.UserDao;
import com.heramb.enums.FoodStatus;
import com.heramb.enums.OrderStatus;
import com.heramb.model.FoodItems;
import com.heramb.model.Orders;
import com.heramb.model.User;

@Controller
public class BusinessController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	UserDao userDao = context.getBean("userDao", UserDao.class);
	FoodItemsDao foodItemsDao = context.getBean("foodItemsDao", FoodItemsDao.class);
	OrderDao orderDao = context.getBean("orderDao", OrderDao.class);

	@RequestMapping("/businessDashboard")
	public String businessDashboard() {
		return "business";
	}

	@RequestMapping(path = "/registerBusiness", method = RequestMethod.POST)
	public String registerBusiness(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		try {

			User user = new User();

			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPhone(request.getParameter("phone"));
			user.setPassword(request.getParameter("password"));
			user.setRole(com.heramb.enums.Role.BUSINESS);
			user.setStatus(com.heramb.enums.Status.PENDING);

			Long id = userDao.addUser(user);
			if (id != null && id > 0) {
				return "index";
			} else {
				redirectAttributes.addFlashAttribute("error", "Error creating business account.");
				return "redirect:/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "An unexpected error occurred.");
			return "redirect:/error";
		}
	}

	@RequestMapping(path = "/BusinessLogin", method = RequestMethod.POST)
	public String businessLogin(HttpServletRequest request, RedirectAttributes redirectAttributes, Model model) {
		try {

			String email = request.getParameter("businessEmail");
			String password = request.getParameter("businessPassword");

			User user = userDao.getUserByEmail(email);

			if (user != null && user.getPassword().equals(password)
					&& user.getRole() == com.heramb.enums.Role.BUSINESS) {

				if (user.getStatus() == com.heramb.enums.Status.APPROVED) {
					request.getSession().setAttribute("businessLoggedIn", true);
					request.getSession().setAttribute("businessName", user.getName());
					request.getSession().setAttribute("businessLoggedInUser", user);
					List<FoodItems> foodItems = foodItemsDao.getAvailableFoodItems();
			        model.addAttribute("foodItems", foodItems);
					return "business";
				} else if (user.getStatus() == com.heramb.enums.Status.PENDING) {
					redirectAttributes.addFlashAttribute("error", "Your account is pending approval. Please wait.");
					return "redirect:/approval";
				} else if (user.getStatus() == com.heramb.enums.Status.REJECTED) {
					redirectAttributes.addFlashAttribute("error", "Your account was rejected. Contact admin.");
					return "redirect:/approval";
				} else {
					redirectAttributes.addFlashAttribute("error", "Invalid account status.");
					return "redirect:/error";
				}

			} else {
				redirectAttributes.addFlashAttribute("error", "Invalid credentials or not a Business account.");
				return "redirect:/error";
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "An unexpected error occurred.");
			return "redirect:/index";
		}
	}

	@RequestMapping("/inventory")
	public String inventoryPage(HttpServletRequest request) {
		User business = (User) request.getSession().getAttribute("businessLoggedInUser");
		if (business == null)
			return "redirect:/BusinessLoginPage";

		request.setAttribute("foodItems", foodItemsDao.getFoodItemsByBusinessId(business.getId()));
		return "inventory";
	}

	@PostMapping("/addFoodItem")
	public String addFoodItem(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		try {
			User business = (User) request.getSession().getAttribute("businessLoggedInUser");
			if (business == null)
				return "redirect:/BusinessLoginPage";

			FoodItems item = new FoodItems();
			item.setBusinessId(business.getId());
			item.setName(request.getParameter("name"));
			item.setDescription(request.getParameter("description"));
			item.setQuantity(Integer.parseInt(request.getParameter("quantity")));
			item.setOriginalPrice(Double.parseDouble(request.getParameter("originalPrice")));
			item.setDiscountedPrice(Double.parseDouble(request.getParameter("discountedPrice")));
			item.setCategory(request.getParameter("category"));
			item.setImage(request.getParameter("image"));
			item.setAvailableTill(LocalDateTime.parse(request.getParameter("availableTill")));
			item.setStatus(FoodStatus.AVAILABLE);

			foodItemsDao.addFoodItem(item);
			redirectAttributes.addFlashAttribute("success", "Food item added successfully!");
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("error", "Failed to add food item.");
		}
		return "redirect:/inventory";
	}
	
	@RequestMapping("/businessOrders")
	public String businessOrdersPage(HttpServletRequest request) {
	    User business = (User) request.getSession().getAttribute("businessLoggedInUser");
	    if (business == null)
	        return "redirect:/BusinessLoginPage";

	    List<FoodItems> foodItems = foodItemsDao.getFoodItemsByBusinessId(business.getId());

	    Map<Long, FoodItems> foodMap = new HashMap<Long, FoodItems>();
	    for(FoodItems item : foodItems) {
	        foodMap.put(item.getId(), item);
	    }

	    List<Orders> allOrders = new ArrayList<Orders>();
	    for(FoodItems item : foodItems) {
	        allOrders.addAll(orderDao.getOrdersByFoodItem(item.getId()));
	    }

	    request.setAttribute("orders", allOrders);
	    request.setAttribute("foodMap", foodMap);

	    return "businessOrders";
	}


	@PostMapping("/updateOrderStatus")
	public String updateOrderStatus(HttpServletRequest request) {
	    User business = (User) request.getSession().getAttribute("businessLoggedInUser");
	    if (business == null)
	        return "redirect:/BusinessLoginPage";

	    Long orderId = Long.parseLong(request.getParameter("orderId"));
	    String action = request.getParameter("action");

	    Orders order = orderDao.getOrderById(orderId);
	    if(order != null) {
	        if("APPROVE".equalsIgnoreCase(action)) {
	            order.setStatus(OrderStatus.COMPLETED);
	        } else if("REJECT".equalsIgnoreCase(action)) {
	            order.setStatus(OrderStatus.CANCELLED);
	        }
	        orderDao.updateOrder(order);
	    }

	    return "redirect:/businessOrders";
	}

}

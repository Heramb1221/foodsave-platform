package com.hearmb.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.heramb.dao.UserDao;
import com.heramb.dao.FoodItemsDao;
import com.heramb.model.User;
import com.heramb.model.FoodItems;
import com.heramb.enums.Role;
import com.heramb.enums.Status;

@Controller
public class AdminController {

	ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
	UserDao userDao = context.getBean("userDao", UserDao.class);
	FoodItemsDao foodItemsDao = context.getBean("foodItemsDao", FoodItemsDao.class);

	@RequestMapping("/")
	public String init() {
		return "index";
	}

	@RequestMapping("/index")
	public String home() {
		return "index";
	}

	@RequestMapping("/about")
	public String aboutUs() {
		return "about";
	}

	@RequestMapping("/working")
	public String howItWorks() {
		return "working";
	}

	@RequestMapping("/error")
	public String error() {
		return "error";
	}

	@RequestMapping("/approval")
	public String approval() {
		return "approval";
	}

	@RequestMapping("/contact")
	public String Contact() {
		return "contact";
	}

	@RequestMapping("/hbusiness")
	public String Business() {
		return "hbusiness";
	}

	@RequestMapping(path = "/AdminLogin", method = RequestMethod.POST)
	public String adminLogin(HttpServletRequest request) {
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		if (email.equals("admin@gmail.com") && password.equals("admin")) {
			request.getSession().setAttribute("adminLoggedIn", true);
			request.getSession().setAttribute("adminName", "Admin");

			return "redirect:/admin";
		} else {
			return "index";
		}
	}

	@RequestMapping("/admin")
	public String adminDashboard(HttpServletRequest request) {
		List<User> pendingBusinesses = userDao.getUsersByRoleAndStatus(Role.BUSINESS, Status.PENDING);

		// other stats
		List<User> allBusinesses = userDao.getUsersByRole(Role.BUSINESS);
		List<User> approvedBusinesses = userDao.getUsersByRoleAndStatus(Role.BUSINESS, Status.APPROVED);
		List<User> allCustomers = userDao.getUsersByRole(Role.CUSTOMER);
		List<FoodItems> allFoodItems = foodItemsDao.getAllFoodItems();

		request.setAttribute("totalBusinesses", allBusinesses.size());
		request.setAttribute("totalCustomers", allCustomers.size());
		request.setAttribute("totalUsers", allBusinesses.size() + allCustomers.size());
		request.setAttribute("totalFoodListings", allFoodItems.size());
		request.setAttribute("pendingApprovals", pendingBusinesses);
		request.setAttribute("pendingApprovalsNumber", pendingBusinesses.size());
		request.setAttribute("approvedBusinesses", approvedBusinesses.size());

		return "adminDashboard";
	}

	@RequestMapping(path = "/approveUser", method = RequestMethod.POST)
	public String approveUser(HttpServletRequest request) {
		Long userId = Long.parseLong(request.getParameter("userId"));
		User user = userDao.getUserById(userId);
		if (user != null) {
			user.setStatus(Status.APPROVED);
			userDao.updateUser(user);
		}
		return "redirect:/admin";
	}

	@RequestMapping(path = "/rejectUser", method = RequestMethod.POST)
	public String rejectUser(HttpServletRequest request) {
		Long userId = Long.parseLong(request.getParameter("userId"));
		User user = userDao.getUserById(userId);
		if (user != null) {
			user.setStatus(Status.REJECTED);
			userDao.updateUser(user);
		}
		return "redirect:/admin";
	}

}

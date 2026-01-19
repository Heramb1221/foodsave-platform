<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heramb.model.FoodItems"%>
<%@ page import="com.heramb.model.User"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Dashboard - FoodSave</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
	--primary: #2E8B57;
	--secondary: #FF6B35;
	--accent: #4ECDC4;
	--light: #F7F9FC;
	--dark: #2D3A3A;
	--success: #28a745;
	--warning: #ffc107;
	--danger: #dc3545;
	--gray: #6c757d;
	--light-gray: #e9ecef;
	--sidebar-width: 260px;
	--header-height: 70px;
	--transition: all 0.3s ease;
	--shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
	--card-radius: 12px;
}

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Open Sans', sans-serif;
	color: #333;
	background-color: #f5f7f9;
	overflow-x: hidden;
	min-height: 100vh;
	display: flex;
}

/* Sidebar Styles */
.sidebar {
	width: var(--sidebar-width);
	background: var(--dark);
	color: white;
	height: 100vh;
	position: fixed;
	transition: var(--transition);
	z-index: 1000;
	box-shadow: var(--shadow);
	overflow-y: auto;
}

.sidebar-header {
	padding: 20px;
	border-bottom: 1px solid rgba(255, 255, 255, 0.1);
	display: flex;
	align-items: center;
}

.sidebar-logo {
	width: 40px;
	height: 40px;
	background: var(--primary);
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: bold;
	margin-right: 10px;
}

.sidebar-title {
	font-family: 'Poppins', sans-serif;
	font-size: 20px;
	font-weight: 600;
}

.sidebar-title span {
	color: var(--accent);
}

.sidebar-menu {
	padding: 20px 0;
}

.menu-label {
	margin: 20px 20px 10px;
	text-transform: uppercase;
	font-size: 12px;
	color: rgba(255, 255, 255, 0.5);
	letter-spacing: 1px;
}

.menu-item {
	padding: 14px 20px;
	display: flex;
	align-items: center;
	color: rgba(255, 255, 255, 0.7);
	text-decoration: none;
	transition: var(--transition);
	position: relative;
	border-left: 4px solid transparent;
}

.menu-item:hover, .menu-item.active {
	background: rgba(255, 255, 255, 0.05);
	color: white;
	border-left-color: var(--primary);
}

.menu-item i {
	width: 24px;
	margin-right: 12px;
	font-size: 18px;
}

.menu-badge {
	position: absolute;
	right: 20px;
	background: var(--primary);
	color: white;
	font-size: 11px;
	padding: 2px 8px;
	border-radius: 10px;
}

/* Main Content */
.main-content {
	flex: 1;
	margin-left: var(--sidebar-width);
	transition: var(--transition);
	min-height: 100vh;
	display: flex;
	flex-direction: column;
}

/* Header */
.header {
	height: var(--header-height);
	background: white;
	box-shadow: var(--shadow);
	display: flex;
	align-items: center;
	justify-content: space-between;
	padding: 0 25px;
	position: sticky;
	top: 0;
	z-index: 100;
	flex-shrink: 0;
}

.header-left {
	display: flex;
	align-items: center;
	gap: 15px;
}

.page-title {
	font-family: 'Poppins', sans-serif;
	font-size: 24px;
	font-weight: 600;
	color: var(--dark);
}

.header-actions {
	display: flex;
	align-items: center;
	gap: 20px;
}

.search-box {
	position: relative;
}

.search-input {
	padding: 10px 15px 10px 40px;
	border: 1px solid var(--light-gray);
	border-radius: 50px;
	font-size: 14px;
	width: 250px;
	transition: var(--transition);
}

.search-input:focus {
	outline: none;
	border-color: var(--primary);
	box-shadow: 0 0 0 3px rgba(46, 139, 87, 0.1);
}

.search-icon {
	position: absolute;
	left: 15px;
	top: 50%;
	transform: translateY(-50%);
	color: var(--gray);
}

.user-profile {
	display: flex;
	align-items: center;
	gap: 10px;
	cursor: pointer;
	padding: 5px 10px;
	border-radius: 50px;
	transition: var(--transition);
}

.user-profile:hover {
	background: var(--light);
}

.user-avatar {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	background: linear-gradient(135deg, var(--primary), var(--accent));
	display: flex;
	align-items: center;
	justify-content: center;
	color: white;
	font-weight: 600;
}

.user-info {
	display: flex;
	flex-direction: column;
}

.user-name {
	font-weight: 600;
	font-size: 14px;
}

.user-role {
	font-size: 12px;
	color: var(--gray);
}

.notification-bell {
	position: relative;
	cursor: pointer;
	color: var(--gray);
	font-size: 18px;
	transition: var(--transition);
	padding: 10px;
	border-radius: 50%;
}

.notification-bell:hover {
	color: var(--primary);
	background: var(--light);
}

.notification-badge {
	position: absolute;
	top: 5px;
	right: 5px;
	background: var(--danger);
	color: white;
	font-size: 10px;
	width: 18px;
	height: 18px;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
}

/* Dashboard Content */
.dashboard {
	padding: 25px;
	flex: 1;
	background-color: #f5f7f9;
}

.stats-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 20px;
	margin-bottom: 30px;
}

.stat-card {
	background: white;
	border-radius: var(--card-radius);
	padding: 20px;
	box-shadow: var(--shadow);
	transition: var(--transition);
	position: relative;
	overflow: hidden;
}

.stat-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.stat-card::after {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 5px;
	height: 100%;
	background: var(--primary);
}

.stat-card.warning::after {
	background: var(--warning);
}

.stat-card.danger::after {
	background: var(--danger);
}

.stat-card.accent::after {
	background: var(--accent);
}

.stat-icon {
	width: 50px;
	height: 50px;
	background: rgba(46, 139, 87, 0.1);
	border-radius: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--primary);
	font-size: 22px;
	margin-bottom: 15px;
}

.stat-card.warning .stat-icon {
	background: rgba(255, 193, 7, 0.1);
	color: var(--warning);
}

.stat-card.danger .stat-icon {
	background: rgba(220, 53, 69, 0.1);
	color: var(--danger);
}

.stat-card.accent .stat-icon {
	background: rgba(78, 205, 196, 0.1);
	color: var(--accent);
}

.stat-value {
	font-family: 'Poppins', sans-serif;
	font-size: 28px;
	font-weight: 700;
	margin-bottom: 5px;
	color: var(--dark);
}

.stat-title {
	color: var(--gray);
	font-size: 14px;
	margin-bottom: 10px;
}

.stat-change {
	display: flex;
	align-items: center;
	font-size: 12px;
	color: var(--success);
}

.stat-change.negative {
	color: var(--danger);
}

.stat-change i {
	margin-right: 5px;
}

/* Charts and Graphs */
.charts-container {
	display: grid;
	grid-template-columns: 2fr 1fr;
	gap: 20px;
	margin-bottom: 30px;
}

.chart-card {
	background: white;
	border-radius: var(--card-radius);
	padding: 20px;
	box-shadow: var(--shadow);
	height: 100%;
}

.chart-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.chart-title {
	font-family: 'Poppins', sans-serif;
	font-size: 18px;
	font-weight: 600;
	color: var(--dark);
}

.chart-actions {
	display: flex;
	gap: 10px;
}

.chart-action-btn {
	background: var(--light);
	border: none;
	width: 30px;
	height: 30px;
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	color: var(--gray);
	transition: var(--transition);
}

.chart-action-btn:hover {
	background: var(--primary);
	color: white;
}

.chart-placeholder {
	height: 300px;
	background: var(--light);
	border-radius: 8px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: var(--gray);
	font-style: italic;
}

/* Recent Activity */
.activity-card {
	background: white;
	border-radius: var(--card-radius);
	padding: 20px;
	box-shadow: var(--shadow);
	margin-bottom: 30px;
}

.activity-list {
	list-style: none;
}

.activity-item {
	display: flex;
	padding: 15px 0;
	border-bottom: 1px solid var(--light-gray);
}

.activity-item:last-child {
	border-bottom: none;
}

.activity-icon {
	width: 40px;
	height: 40px;
	border-radius: 10px;
	background: var(--light);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 15px;
	color: var(--primary);
}

.activity-content {
	flex: 1;
}

.activity-title {
	font-weight: 600;
	margin-bottom: 5px;
	color: var(--dark);
}

.activity-desc {
	color: var(--gray);
	font-size: 14px;
	margin-bottom: 5px;
}

.activity-time {
	font-size: 12px;
	color: var(--gray);
}

/* Pending Approvals */
.approval-card {
	background: white;
	border-radius: var(--card-radius);
	padding: 20px;
	box-shadow: var(--shadow);
}

.approval-item {
	display: flex;
	align-items: center;
	padding: 15px 0;
	border-bottom: 1px solid var(--light-gray);
}

.approval-item:last-child {
	border-bottom: none;
}

.approval-avatar {
	width: 45px;
	height: 45px;
	border-radius: 10px;
	background: var(--light);
	display: flex;
	align-items: center;
	justify-content: center;
	margin-right: 15px;
	font-weight: 600;
	color: var(--primary);
	flex-shrink: 0;
}

.approval-info {
	flex: 1;
	min-width: 0;
}

.approval-name {
	font-weight: 600;
	margin-bottom: 5px;
	color: var(--dark);
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.approval-details {
	color: var(--gray);
	font-size: 14px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.approval-actions {
	display: flex;
	gap: 10px;
	flex-shrink: 0;
}

.btn-approve, .btn-reject {
	padding: 8px 15px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	cursor: pointer;
	transition: var(--transition);
	font-weight: 500;
}

.btn-approve {
	background: var(--success);
	color: white;
}

.btn-approve:hover {
	background: #218838;
	transform: translateY(-2px);
}

.btn-reject {
	background: var(--light);
	color: var(--gray);
}

.btn-reject:hover {
	background: var(--danger);
	color: white;
	transform: translateY(-2px);
}

.no-approvals {
	text-align: center;
	padding: 30px;
	color: var(--gray);
	font-style: italic;
}

.no-approvals i {
	font-size: 48px;
	margin-bottom: 15px;
	color: var(--success);
	display: block;
}

/* Toggle button for mobile */
.menu-toggle {
	display: none;
	background: var(--primary);
	color: white;
	border: none;
	width: 40px;
	height: 40px;
	border-radius: 8px;
	align-items: center;
	justify-content: center;
	cursor: pointer;
	font-size: 20px;
	transition: var(--transition);
}

.menu-toggle:hover {
	background: var(--secondary);
}

/* Animation for charts */
@keyframes fadeIn {
	from { 
		opacity: 0;
		transform: translateY(10px);
	}
	to {
		opacity: 1;
		transform: translateY(0);
	}
}

.chart-card, .stat-card, .activity-card, .approval-card {
	animation: fadeIn 0.5s ease-out;
}

/* Responsive Design */
@media (max-width: 992px) {
	.charts-container {
		grid-template-columns: 1fr;
	}
	
	.sidebar {
		transform: translateX(-100%);
		width: var(--sidebar-width);
	}
	
	.sidebar.active {
		transform: translateX(0);
	}
	
	.main-content {
		margin-left: 0;
	}
	
	.menu-toggle {
		display: flex;
	}
	
	.search-input {
		width: 180px;
	}
	
	.header {
		padding: 0 15px;
	}
}

@media (max-width: 768px) {
	.stats-grid {
		grid-template-columns: 1fr;
	}
	
	.header {
		flex-direction: column;
		height: auto;
		padding: 15px;
		gap: 15px;
	}
	
	.header-left {
		width: 100%;
		justify-content: space-between;
	}
	
	.header-actions {
		width: 100%;
		justify-content: space-between;
	}
	
	.search-input {
		width: 100%;
	}
	
	.user-info {
		display: none;
	}
	
	.dashboard {
		padding: 15px;
	}
	
	.approval-item {
		flex-direction: column;
		align-items: flex-start;
		gap: 15px;
	}
	
	.approval-info {
		width: 100%;
	}
	
	.approval-actions {
		width: 100%;
		justify-content: flex-end;
	}
}

/* Loading spinner */
.spinner {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 10px;
}

.spinner i {
	font-size: 24px;
	color: var(--primary);
}
</style>
</head>
<body>
	<!-- Sidebar -->
	<div class="sidebar" id="sidebar">
		<div class="sidebar-header">
			<div class="sidebar-logo">FW</div>
			<div class="sidebar-title">
				Food<span>Save</span>
			</div>
		</div>

		<div class="sidebar-menu">
			<div class="menu-label">Main</div>
			<a href="#" class="menu-item active"> 
				<i class="fas fa-home"></i>
				<span>Dashboard</span>
			</a>

			<div class="menu-label">Management</div>
			<a href="#" class="menu-item"> 
				<i class="fas fa-store"></i> 
				<span>Businesses</span>
				<span class="menu-badge">3</span>
			</a> 
			<a href="#" class="menu-item"> 
				<i class="fas fa-users"></i> 
				<span>Customers</span>
			</a> 
			<a href="#" class="menu-item"> 
				<i class="fas fa-utensils"></i> 
				<span>Food Listings</span> 
				<span class="menu-badge">2</span>
			</a> 
			<a href="#" class="menu-item"> 
				<i class="fas fa-clipboard-list"></i>
				<span>Orders</span>
			</a>
		</div>
	</div>

	<!-- Main Content -->
	<div class="main-content">
		<!-- Header -->
		<div class="header">
			<div class="header-left">
				<button class="menu-toggle" id="menuToggle">
					<i class="fas fa-bars"></i>
				</button>
				<h1 class="page-title">Admin Dashboard</h1>
			</div>

			<div class="header-actions">
				<div class="search-box">
					<i class="fas fa-search search-icon"></i> 
					<input type="text" class="search-input" placeholder="Search...">
				</div>

				<div class="notification-bell">
					<i class="fas fa-bell"></i> 
					<span class="notification-badge">5</span>
				</div>

				<div class="user-profile">
					<div class="user-avatar">AD</div>
					<div class="user-info">
						<div class="user-name">Admin User</div>
						<div class="user-role">System Administrator</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Dashboard Content -->
		<div class="dashboard">
			<!-- Stats Grid -->
			<div class="stats-grid">
				<div class="stat-card">
					<div class="stat-icon">
						<i class="fas fa-store"></i>
					</div>
					<div class="stat-value"><%= request.getAttribute("totalBusinesses") != null ? request.getAttribute("totalBusinesses") : "0" %></div>
					<div class="stat-title">Total Businesses</div>
					<div class="stat-change">
						<i class="fas fa-arrow-up"></i> <span>12% from last month</span>
					</div>
				</div>

				<div class="stat-card accent">
					<div class="stat-icon">
						<i class="fas fa-users"></i>
					</div>
					<div class="stat-value"><%= request.getAttribute("totalCustomers") != null ? request.getAttribute("totalCustomers") : "0" %></div>
					<div class="stat-title">Registered Customers</div>
					<div class="stat-change">
						<i class="fas fa-arrow-up"></i> <span>8% from last month</span>
					</div>
				</div>

				<div class="stat-card warning">
					<div class="stat-icon">
						<i class="fas fa-utensils"></i>
					</div>
					<div class="stat-value"><%= request.getAttribute("totalFoodListings") != null ? request.getAttribute("totalFoodListings") : "0" %></div>
					<div class="stat-title">Active Food Listings</div>
					<div class="stat-change">
						<i class="fas fa-arrow-up"></i> <span>5% from yesterday</span>
					</div>
				</div>

				<div class="stat-card danger">
					<div class="stat-icon">
						<i class="fas fa-clipboard-list"></i>
					</div>
					<div class="stat-value"><%= request.getAttribute("pendingApprovalsNumber") != null ? request.getAttribute("pendingApprovalsNumber") : "0" %></div>
					<div class="stat-title">Pending Approvals</div>
					<div class="stat-change negative">
						<i class="fas fa-arrow-down"></i> <span>3% from yesterday</span>
					</div>
				</div>
			</div>

			<!-- Two Column Layout -->
			<div class="charts-container">
				<!-- Pending Approvals -->
				<div class="approval-card">
					<div class="chart-header">
						<h3 class="chart-title">Pending Approvals</h3>
						<div class="chart-actions">
							<button class="chart-action-btn">
								<i class="fas fa-ellipsis-v"></i>
							</button>
						</div>
					</div>

					<%
					List<User> pendingApprovals = (List<User>) request.getAttribute("pendingApprovals");
					if (pendingApprovals != null && !pendingApprovals.isEmpty()) {
						for (User user : pendingApprovals) {
					%>
					<div class="approval-item">
						<div class="approval-avatar">
							<%= user.getName() != null && user.getName().length() >= 2 
								? user.getName().substring(0, 2).toUpperCase() 
								: "NA" %>
						</div>
						<div class="approval-info">
							<div class="approval-name"><%= user.getName() %></div>
							<div class="approval-details">
								<%= user.getRole() != null ? user.getRole() : "User" %>
								• Email: <%= user.getEmail() != null ? user.getEmail() : "N/A" %>
								• Phone: <%= user.getPhone() != null ? user.getPhone() : "N/A" %>
							</div>
						</div>
						<div class="approval-actions">
							<form action="approveUser" method="post" style="display: inline;">
								<input type="hidden" name="userId" value="<%= user.getId() %>" />
								<button type="submit" class="btn-approve">Approve</button>
							</form>
							<form action="rejectUser" method="post" style="display: inline;">
								<input type="hidden" name="userId" value="<%= user.getId() %>" />
								<button type="submit" class="btn-reject">Reject</button>
							</form>
						</div>
					</div>
					<%
						}
					} else {
					%>
					<div class="no-approvals">
						<i class="fas fa-check-circle"></i>
						<p>No pending approvals 🎉</p>
						<p class="approval-details">All users have been reviewed and approved.</p>
					</div>
					<%
					}
					%>
				</div>
				
				<!-- Recent Activity -->
				<div class="activity-card">
					<div class="chart-header">
						<h3 class="chart-title">Recent Activity</h3>
						<div class="chart-actions">
							<button class="chart-action-btn">
								<i class="fas fa-ellipsis-v"></i>
							</button>
						</div>
					</div>
					<div class="activity-list">
						<div class="activity-item">
							<div class="activity-icon">
								<i class="fas fa-user-plus"></i>
							</div>
							<div class="activity-content">
								<div class="activity-title">New Business Registration</div>
								<div class="activity-desc">Fresh Market joined FoodSave</div>
								<div class="activity-time">2 hours ago</div>
							</div>
						</div>
						<div class="activity-item">
							<div class="activity-icon">
								<i class="fas fa-utensils"></i>
							</div>
							<div class="activity-content">
								<div class="activity-title">Food Listing Added</div>
								<div class="activity-desc">Bakery Delight added 5 new items</div>
								<div class="activity-time">5 hours ago</div>
							</div>
						</div>
						<div class="activity-item">
							<div class="activity-icon">
								<i class="fas fa-shopping-cart"></i>
							</div>
							<div class="activity-content">
								<div class="activity-title">Order Completed</div>
								<div class="activity-desc">Order #FS-4892 was successfully completed</div>
								<div class="activity-time">Yesterday</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
        // Toggle sidebar on mobile
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        
        menuToggle.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });
        
        // Close sidebar when clicking outside on mobile
        document.addEventListener('click', (e) => {
            if (window.innerWidth < 992 && 
                !sidebar.contains(e.target) && 
                !menuToggle.contains(e.target) &&
                sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        });
        
        // Simulate chart loading animation
        document.querySelectorAll('.chart-placeholder').forEach(chart => {
            chart.innerHTML = '<div class="spinner"><i class="fas fa-circle-notch fa-spin"></i> Loading chart data...</div>';
            
            setTimeout(() => {
                chart.innerHTML = 'Interactive chart loaded successfully';
            }, 2000);
        });
        
        // Add hover effects to stat cards
        document.querySelectorAll('.stat-card').forEach(card => {
            card.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-5px)';
            });
            
            card.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(0)';
            });
        });
    </script>
</body>
</html>
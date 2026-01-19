<%@ page import="com.heramb.dao.FoodItemsDao"%>
<%@ page import="com.heramb.model.FoodItems"%>
<%@ page import="java.util.List"%>
<%@ page import="com.heramb.enums.FoodStatus"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Customer Dashboard - FoodSave</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root { 
    --primary: #2E8B57; 
    --primary-light: #4daa72; 
    --primary-dark: #1f6b41;
    --secondary: #FF6B35; 
    --secondary-light: #ff8c5d; 
    --secondary-dark: #e55a2b;
    --accent: #4ECDC4; 
    --accent-light: #7ad9d3;
    --light: #F7F9FC;
    --dark: #1a2a2a; 
    --dark-light: #2D3A3A; 
    --success: #28a745;
    --warning: #ffc107; 
    --danger: #dc3545; 
    --gray: #6c757d; 
    --light-gray: #e9ecef; 
    --transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275); 
    --shadow: 0 8px 30px rgba(0, 0, 0, 0.08); 
    --shadow-hover: 0 15px 40px rgba(0, 0, 0, 0.12);
    --card-radius: 20px; 
    --gradient-primary: linear-gradient(135deg, var(--primary), var(--primary-light)); 
    --gradient-secondary: linear-gradient(135deg, var(--secondary), var(--secondary-light));
    --gradient-dark: linear-gradient(135deg, var(--dark), var(--dark-light));
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
    line-height: 1.6;
}

/* Dashboard Layout */
.dashboard-container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 280px;
    background: var(--gradient-dark);
    color: white;
    padding: 30px 0;
    transition: var(--transition);
    position: fixed;
    height: 100vh;
    z-index: 100;
    overflow-y: auto;
    box-shadow: var(--shadow);
}

.sidebar-header {
    padding: 0 25px 30px;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
    margin-bottom: 20px;
}

.user-info {
    display: flex;
    align-items: center;
    margin-bottom: 25px;
}

.user-avatar {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: var(--gradient-primary);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    font-weight: bold;
    color: white;
    margin-right: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.user-details h3 {
    font-family: 'Poppins', sans-serif;
    margin-bottom: 5px;
    font-size: 1.1rem;
}

.user-details p {
    font-size: 0.85rem;
    opacity: 0.8;
}

.sidebar-menu {
    list-style: none;
    padding: 0 15px;
}

.menu-item {
    margin-bottom: 8px;
    position: relative;
}

.menu-link {
    display: flex;
    align-items: center;
    padding: 12px 15px;
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    border-radius: 12px;
    transition: var(--transition);
    position: relative;
}

.menu-link:hover, .menu-link.active {
    background: rgba(255, 255, 255, 0.1);
    color: white;
    transform: translateX(5px);
}

.menu-link.active:before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 4px;
    background: var(--accent);
    border-radius: 0 10px 10px 0;
}

.menu-icon {
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    font-size: 18px;
}

.menu-text {
    flex: 1;
}

.menu-badge {
    background: var(--accent);
    color: white;
    padding: 3px 8px;
    border-radius: 20px;
    font-size: 0.75rem;
    font-weight: 600;
}

/* Main Content */
.main-content {
    flex: 1;
    margin-left: 280px;
    padding: 30px;
    transition: var(--transition);
    min-height: 100vh;
    background: #f5f7f9;
}

/* Header */
.dashboard-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 30px;
    background: white;
    padding: 25px 30px;
    border-radius: var(--card-radius);
    box-shadow: var(--shadow);
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.page-title h1 {
    font-family: 'Poppins', sans-serif;
    font-size: 1.8rem;
    color: var(--dark);
    margin-bottom: 5px;
}

.page-title p {
    color: var(--gray);
    font-size: 0.9rem;
}

.header-actions {
    display: flex;
    align-items: center;
    gap: 15px;
}

.search-box {
    position: relative;
}

.search-input {
    padding: 12px 20px 12px 45px;
    border: 2px solid var(--light-gray);
    border-radius: 50px;
    font-family: 'Open Sans', sans-serif;
    font-size: 14px;
    width: 280px;
    transition: var(--transition);
}

.search-input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(46, 139, 87, 0.2);
}

.search-icon {
    position: absolute;
    left: 15px;
    top: 50%;
    transform: translateY(-50%);
    color: var(--gray);
}

.notification-btn {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    background: var(--light);
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--dark);
    text-decoration: none;
    transition: var(--transition);
    position: relative;
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.notification-btn:hover {
    background: var(--primary);
    color: white;
    transform: translateY(-2px);
}

.notification-badge {
    position: absolute;
    top: -5px;
    right: -5px;
    width: 20px;
    height: 20px;
    background: var(--secondary);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.7rem;
    font-weight: bold;
}

.user-menu {
    position: relative;
}

.user-btn {
    display: flex;
    align-items: center;
    gap: 10px;
    background: var(--light);
    padding: 10px 15px;
    border-radius: 50px;
    cursor: pointer;
    transition: var(--transition);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.user-btn:hover {
    background: var(--primary-light);
    color: white;
}

.user-btn span {
    font-weight: 500;
}

/* Dashboard Sections */
.dashboard-section {
    display: none;
    animation: fadeIn 0.5s ease;
}

.dashboard-section.active {
    display: block;
}

/* Browse Food Section */
.filters-row {
    display: flex;
    gap: 20px;
    margin-bottom: 30px;
    flex-wrap: wrap;
}

.filter-group {
    flex: 1;
    min-width: 200px;
}

.filter-label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: var(--dark);
}

.filter-select {
    width: 100%;
    padding: 12px 20px;
    border: 2px solid var(--light-gray);
    border-radius: 50px;
    font-family: 'Open Sans', sans-serif;
    font-size: 14px;
    appearance: none;
    background: white url("data:image/svg+xml;charset=utf-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 24 24' fill='none' stroke='%236c757d' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3E%3Cpath d='M6 9l6 6 6-6'/%3E%3C/svg%3E") no-repeat right 15px center;
    transition: var(--transition);
}

.filter-select:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(46, 139, 87, 0.2);
}

.food-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
    gap: 25px;
    margin-bottom: 40px;
}

.food-card {
    background: white;
    border-radius: var(--card-radius);
    overflow: hidden;
    box-shadow: var(--shadow);
    transition: var(--transition);
    position: relative;
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.food-card:hover {
    transform: translateY(-10px);
    box-shadow: var(--shadow-hover);
}

.food-badge {
    position: absolute;
    top: 15px;
    left: 15px;
    background: var(--gradient-secondary);
    color: white;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    z-index: 2;
    box-shadow: 0 3px 10px rgba(255, 107, 53, 0.3);
}

.food-image {
    height: 200px;
    overflow: hidden;
    position: relative;
}

.food-image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: var(--transition);
}

.food-card:hover .food-image img {
    transform: scale(1.1);
}

.food-details {
    padding: 20px;
}

.food-title {
    font-family: 'Poppins', sans-serif;
    font-size: 1.2rem;
    margin-bottom: 10px;
    color: var(--dark);
}

.food-description {
    color: var(--gray);
    font-size: 0.9rem;
    margin-bottom: 15px;
    line-height: 1.5;
}

.food-meta {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}

.food-price {
    font-weight: 600;
    color: var(--primary);
    font-size: 1.1rem;
}

.food-original-price {
    text-decoration: line-through;
    color: var(--gray);
    font-size: 0.9rem;
    margin-left: 5px;
}

.food-distance {
    display: flex;
    align-items: center;
    color: var(--gray);
    font-size: 0.9rem;
}

.food-distance i {
    margin-right: 5px;
}

.food-actions {
    display: flex;
    gap: 10px;
}

.btn-add-cart {
    flex: 1;
    background: var(--gradient-primary);
    color: white;
    border: none;
    padding: 12px 15px;
    border-radius: 50px;
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition);
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
    text-decoration: none;
    box-shadow: 0 4px 10px rgba(46, 139, 87, 0.3);
}

.btn-add-cart:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(46, 139, 87, 0.4);
}

.btn-view {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    background: var(--light);
    color: var(--dark);
    border: none;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: var(--transition);
    border: 1px solid rgba(0, 0, 0, 0.05);
}

.btn-view:hover {
    background: var(--primary);
    color: white;
    transform: translateY(-2px);
}

/* Order History Section */
.orders-table-container {
    background: white;
    border-radius: var(--card-radius);
    overflow: hidden;
    box-shadow: var(--shadow);
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.orders-table {
    width: 100%;
    border-collapse: collapse;
}

.orders-table th {
    background: var(--light);
    padding: 15px 20px;
    text-align: left;
    font-family: 'Poppins', sans-serif;
    color: var(--dark);
    font-weight: 500;
}

.orders-table td {
    padding: 15px 20px;
    border-bottom: 1px solid var(--light-gray);
}

.orders-table tr:last-child td {
    border-bottom: none;
}

.orders-table tr {
    transition: var(--transition);
}

.orders-table tr:hover {
    background: rgba(46, 139, 87, 0.05);
}

.order-id {
    color: var(--primary);
    font-weight: 500;
}

.order-status {
    display: inline-block;
    padding: 5px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 500;
}

.status-pending {
    background: rgba(255, 193, 7, 0.2);
    color: var(--warning);
}

.status-confirmed {
    background: rgba(40, 167, 69, 0.2);
    color: var(--success);
}

.status-ready {
    background: rgba(23, 162, 184, 0.2);
    color: #17a2b8;
}

.status-completed {
    background: rgba(108, 117, 125, 0.2);
    color: var(--gray);
}

.order-action {
    color: var(--primary);
    text-decoration: none;
    font-weight: 500;
    transition: var(--transition);
}

.order-action:hover {
    color: var(--primary-light);
    text-decoration: underline;
}

/* Profile Section */
.profile-card {
    background: white;
    border-radius: var(--card-radius);
    padding: 30px;
    box-shadow: var(--shadow);
    margin-bottom: 30px;
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.profile-header {
    display: flex;
    align-items: center;
    margin-bottom: 30px;
}

.profile-avatar {
    width: 100px;
    height: 100px;
    border-radius: 50%;
    background: var(--gradient-primary);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 40px;
    color: white;
    margin-right: 25px;
    position: relative;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.avatar-edit {
    position: absolute;
    bottom: 0;
    right: 0;
    width: 35px;
    height: 35px;
    background: var(--secondary);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    cursor: pointer;
    transition: var(--transition);
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.2);
}

.avatar-edit:hover {
    transform: scale(1.1);
    background: var(--secondary-dark);
}

.profile-info h2 {
    font-family: 'Poppins', sans-serif;
    margin-bottom: 5px;
    color: var(--dark);
}

.profile-info p {
    color: var(--gray);
}

.profile-stats {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 20px;
    margin-bottom: 30px;
}

.stat-card {
    background: var(--light);
    padding: 20px;
    border-radius: var(--card-radius);
    text-align: center;
    transition: var(--transition);
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.stat-card:hover {
    transform: translateY(-5px);
    box-shadow: var(--shadow);
}

.stat-value {
    font-family: 'Poppins', sans-serif;
    font-size: 2rem;
    font-weight: 600;
    color: var(--primary);
    margin-bottom: 5px;
}

.stat-label {
    color: var(--gray);
    font-size: 0.9rem;
}

.form-row {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
    gap: 20px;
    margin-bottom: 20px;
}

.form-group {
    margin-bottom: 20px;
}

.form-label {
    display: block;
    margin-bottom: 8px;
    font-weight: 500;
    color: var(--dark);
}

.form-input {
    width: 100%;
    padding: 12px 20px;
    border: 2px solid var(--light-gray);
    border-radius: 10px;
    font-family: 'Open Sans', sans-serif;
    font-size: 14px;
    transition: var(--transition);
}

.form-input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(46, 139, 87, 0.2);
}

.btn-save {
    background: var(--gradient-primary);
    color: white;
    border: none;
    padding: 12px 25px;
    border-radius: 50px;
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition);
    box-shadow: 0 4px 10px rgba(46, 139, 87, 0.3);
}

.btn-save:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 6px 15px rgba(46, 139, 87, 0.4);
}

/* Mobile Toggle Button */
.menu-toggle {
    display: none;
    position: fixed;
    top: 20px;
    left: 20px;
    width: 45px;
    height: 45px;
    background: var(--gradient-primary);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    z-index: 99;
    cursor: pointer;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    transition: var(--transition);
}

.menu-toggle:hover {
    transform: scale(1.1);
}

/* Empty State */
.empty-state {
    grid-column: 1/-1;
    text-align: center;
    padding: 60px 20px;
    background: white;
    border-radius: var(--card-radius);
    box-shadow: var(--shadow);
}

.empty-state i {
    font-size: 64px;
    color: var(--gray);
    margin-bottom: 20px;
    opacity: 0.5;
}

.empty-state h3 {
    color: var(--gray);
    margin-bottom: 10px;
    font-family: 'Poppins', sans-serif;
}

.empty-state p {
    color: var(--gray);
    max-width: 400px;
    margin: 0 auto;
}

/* Section Title */
.section-title {
    margin-bottom: 25px;
}

.section-title h2 {
    font-family: 'Poppins', sans-serif;
    color: var(--dark);
    font-size: 1.5rem;
    margin-bottom: 5px;
}

.section-title p {
    color: var(--gray);
    font-size: 0.9rem;
}

/* Animations */
@keyframes fadeIn {
    from { opacity: 0; }
    to { opacity: 1; }
}

@keyframes slideIn {
    from { 
        transform: translateX(-20px);
        opacity: 0;
    }
    to { 
        transform: translateX(0);
        opacity: 1;
    }
}

/* Responsive Design */
@media (max-width: 1200px) {
    .sidebar {
        width: 250px;
    }
    .main-content {
        margin-left: 250px;
    }
}

@media (max-width: 992px) {
    .sidebar {
        transform: translateX(-100%);
        width: 280px;
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
    .dashboard-header {
        padding: 20px;
    }
    .search-input {
        width: 200px;
    }
}

@media (max-width: 768px) {
    .main-content {
        padding: 20px 15px;
    }
    .dashboard-header {
        flex-direction: column;
        align-items: flex-start;
        gap: 15px;
    }
    .header-actions {
        width: 100%;
        justify-content: space-between;
    }
    .search-input {
        width: 100%;
    }
    .user-btn span {
        display: none;
    }
    .filters-row {
        flex-direction: column;
    }
    .food-grid {
        grid-template-columns: 1fr;
    }
    .profile-header {
        flex-direction: column;
        text-align: center;
    }
    .profile-avatar {
        margin-right: 0;
        margin-bottom: 20px;
    }
    .profile-stats {
        grid-template-columns: 1fr;
    }
    .orders-table-container {
        overflow-x: auto;
    }
    .orders-table {
        min-width: 600px;
    }
}

@media (max-width: 480px) {
    .menu-toggle {
        top: 15px;
        left: 15px;
        width: 40px;
        height: 40px;
    }
    .main-content {
        padding: 15px 10px;
    }
    .dashboard-header {
        padding: 15px;
    }
    .profile-card {
        padding: 20px;
    }
    .food-details {
        padding: 15px;
    }
}
</style>
</head>
<body>
    <!-- Mobile Menu Toggle -->
    <div class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </div>

    <!-- Dashboard Container -->
    <div class="dashboard-container">
        <!-- Sidebar -->
        <aside class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="user-info">
                    <div class="user-avatar">CD</div>
                    <div class="user-details">
                        <h3>Customer Dashboard</h3>
                        <p>Member</p>
                    </div>
                </div>
            </div>

            <ul class="sidebar-menu">
                <li class="menu-item"><a href="#browse"
                    class="menu-link active" data-section="browse">
                        <div class="menu-icon">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <div class="menu-text">Browse Food</div>
                </a></li>
                <li class="menu-item"><a
                    href="customerOrders"
                    class="menu-link">
                        <div class="menu-icon">
                            <i class="fas fa-history"></i>
                        </div>
                        <div class="menu-text">Order History</div>
                </a></li>

                <li class="menu-item"><a href="#pickups" class="menu-link"
                    data-section="pickups">
                        <div class="menu-icon">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div class="menu-text">Pickup Schedule</div>
                </a></li>
                <li class="menu-item"><a href="index" class="menu-link">
                        <div class="menu-icon">
                            <i class="fas fa-sign-out-alt"></i>
                        </div>
                        <div class="menu-text">Logout</div>
                </a></li>
            </ul>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Header -->
            <div class="dashboard-header">
                <div class="page-title">
                    <h1>Browse Surplus Food</h1>
                    <p>Discover delicious food while reducing waste</p>
                </div>

                <div class="header-actions">
                    <div class="search-box">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" class="search-input" placeholder="Search for food...">
                    </div>

                    <a href="#" class="notification-btn">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </a>

                    <div class="user-menu">
                        <div class="user-btn">
                            <div class="user-avatar" style="width: 35px; height: 35px; font-size: 16px;">CD</div>
                            <i class="fas fa-chevron-down"></i>
                        </div>
                    </div>
                </div>
            </div>

            <%
                // Get DAO from application context (or however you have it)
                FoodItemsDao foodDao = (FoodItemsDao) session.getAttribute("foodItemsDao");
                if (foodDao == null) {
                    out.println("Food DAO not available");
                    return;
                }

                // Fetch all available food items
                List<FoodItems> foodItems = foodDao.getAvailableFoodItems();
            %>

            <!-- Browse Food Section -->
            <section id="browse-section" class="dashboard-section active">
                <div class="food-grid">
                    <%
                        if (foodItems != null && !foodItems.isEmpty()) {
                            for (FoodItems item : foodItems) {
                                String imageUrl = item.getImage() != null
                                        ? item.getImage()
                                        : "https://via.placeholder.com/500x300/4ECDC4/ffffff?text=" + item.getName();
                    %>
                    <div class="food-card">
                        <%-- Show discount percentage if original price > discounted price --%>
                        <%
                            if (item.getOriginalPrice() != null && item.getDiscountedPrice() != null
                                        && item.getOriginalPrice() > item.getDiscountedPrice()) {
                                        int discount = (int) ((item.getOriginalPrice() - item.getDiscountedPrice())
                                                / item.getOriginalPrice() * 100);
                        %>
                        <div class="food-badge"><%=discount%>% OFF</div>
                        <%
                            }
                        %>

                        <div class="food-image">
                            <img src="<%=imageUrl%>" alt="<%=item.getName()%>">
                        </div>

                        <div class="food-details">
                            <h3 class="food-title"><%=item.getName()%></h3>
                            <p class="food-description">
                                <%=item.getDescription() != null
                                ? item.getDescription()
                                : "Fresh and delicious food item ready for pickup."%>
                            </p>
                            <div class="food-meta">
                                <div class="food-price">
                                    $<%=String.format("%.2f", item.getDiscountedPrice())%>
                                    <%
                                        if (item.getOriginalPrice() != null && item.getOriginalPrice() > item.getDiscountedPrice()) {
                                    %>
                                    <span class="food-original-price">$<%=String.format("%.2f", item.getOriginalPrice())%></span>
                                    <%
                                        }
                                    %>
                                </div>
                                <div class="food-distance">
                                    <i class="fas fa-map-marker-alt"></i>
                                    <span>Available Today</span>
                                </div>
                            </div>
                            <div class="food-actions">
                                <a href="orderForm?foodItemId=<%=item.getId()%>" class="btn-add-cart">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </a>
                                <button class="btn-view">
                                    <i class="fas fa-eye"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                    <%
                        }
                    } else {
                    %>
                    <div class="empty-state">
                        <i class="fas fa-utensils"></i>
                        <h3>No Food Items Available</h3>
                        <p>Check back later for new surplus food listings!</p>
                    </div>
                    <%
                        }
                    %>
                </div>
            </section>

            <!-- Order History Section -->
            <section id="orders-section" class="dashboard-section">
                <div class="section-title">
                    <h2>Your Order History</h2>
                    <p>View your past orders and status</p>
                </div>

                <div class="orders-table-container">
                    <table class="orders-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Date</th>
                                <th>Items</th>
                                <th>Total</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="order-id">#FS-4892</td>
                                <td>Oct 12, 2023</td>
                                <td>2 items</td>
                                <td>$12.98</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><a href="#" class="order-action">View Details</a></td>
                            </tr>
                            <tr>
                                <td class="order-id">#FS-4876</td>
                                <td>Oct 10, 2023</td>
                                <td>3 items</td>
                                <td>$18.47</td>
                                <td><span class="order-status status-completed">Completed</span></td>
                                <td><a href="#" class="order-action">View Details</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Profile Section -->
            <section id="profile-section" class="dashboard-section">
                <div class="profile-card">
                    <div class="profile-header">
                        <div class="profile-avatar">
                            JS
                            <div class="avatar-edit">
                                <i class="fas fa-camera"></i>
                            </div>
                        </div>
                        <div class="profile-info">
                            <h2>John Smith</h2>
                            <p>john.smith@example.com | Member since Jan 2023</p>
                        </div>
                    </div>

                    <div class="profile-stats">
                        <div class="stat-card">
                            <div class="stat-value">24</div>
                            <div class="stat-label">Total Orders</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-value">$327.86</div>
                            <div class="stat-label">Total Saved</div>
                        </div>
                        <div class="stat-card">
                            <div class="stat-value">38</div>
                            <div class="stat-label">Meals Rescued</div>
                        </div>
                    </div>

                    <h3 style="margin-bottom: 20px; font-family: 'Poppins', sans-serif; color: var(--dark);">Account Settings</h3>

                    <form>
                        <div class="form-row">
                            <div class="form-group">
                                <label class="form-label">First Name</label>
                                <input type="text" class="form-input" value="John">
                            </div>
                            <div class="form-group">
                                <label class="form-label">Last Name</label>
                                <input type="text" class="form-input" value="Smith">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="form-label">Email Address</label>
                            <input type="email" class="form-input" value="john.smith@example.com">
                        </div>

                        <div class="form-group">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" class="form-input" value="(555) 123-4567">
                        </div>

                        <button type="button" class="btn-save">Save Changes</button>
                    </form>
                </div>
            </section>
        </main>
    </div>

    <script>
        // Mobile menu toggle
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        
        menuToggle.addEventListener('click', () => {
            sidebar.classList.toggle('active');
        });
        
        // Section switching
        const menuLinks = document.querySelectorAll('.menu-link[data-section]');
        const sections = document.querySelectorAll('.dashboard-section');
        
        menuLinks.forEach(link => {
            link.addEventListener('click', (e) => {
                if (link.getAttribute('
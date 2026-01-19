<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List, com.heramb.model.FoodItems, java.time.LocalDateTime, java.time.Duration"%>	

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Business Dashboard - FoodSave</title>
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<style>
:root {
    --primary: #4CAF50;
    --primary-light: #81C784;
    --primary-dark: #388E3C;
    --secondary: #FF9800;
    --secondary-light: #FFB74D;
    --accent: #4ECDC4;
    --light: #F5F5F5;
    --dark: #212121;
    --success: #4CAF50;
    --warning: #FFC107;
    --danger: #F44336;
    --gray: #757575;
    --light-gray: #E0E0E0;
    --sidebar-width: 280px;
    --header-height: 80px;
    --transition: all 0.3s ease;
    --shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    --card-radius: 16px;
    --gradient-primary: linear-gradient(135deg, var(--primary), var(--primary-light));
    --gradient-secondary: linear-gradient(135deg, var(--secondary), var(--secondary-light));
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Open Sans', sans-serif;
    color: #333;
    background-color: #f9f9f9;
    overflow-x: hidden;
    min-height: 100vh;
}

/* Layout */
.dashboard-container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar Styles */
.sidebar {
    width: var(--sidebar-width);
    background: white;
    color: var(--dark);
    position: fixed;
    height: 100vh;
    transition: var(--transition);
    z-index: 1000;
    box-shadow: var(--shadow);
    overflow-y: auto;
    padding-bottom: 20px;
    border-right: 1px solid var(--light-gray);
}

.sidebar-header {
    padding: 25px;
    display: flex;
    align-items: center;
    background: var(--light);
    border-bottom: 1px solid var(--light-gray);
}

.business-avatar {
    width: 60px;
    height: 60px;
    border-radius: 12px;
    background: var(--gradient-primary);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 24px;
    margin-right: 15px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.business-info {
    overflow: hidden;
}

.business-name {
    font-family: 'Poppins', sans-serif;
    font-size: 18px;
    font-weight: 600;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    color: var(--dark);
}

.business-type {
    font-size: 13px;
    color: var(--gray);
    margin-top: 5px;
}

.sidebar-menu {
    padding: 25px 0;
}

.menu-section {
    margin-bottom: 25px;
}

.menu-label {
    margin: 0 25px 15px;
    text-transform: uppercase;
    font-size: 12px;
    color: var(--gray);
    letter-spacing: 1px;
    font-weight: 600;
}

.menu-item {
    padding: 15px 25px;
    display: flex;
    align-items: center;
    color: var(--gray);
    text-decoration: none;
    transition: var(--transition);
    position: relative;
}

.menu-item:hover, .menu-item.active {
    background: rgba(76, 175, 80, 0.05);
    color: var(--primary);
}

.menu-item:hover::before, .menu-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    height: 100%;
    width: 4px;
    background: var(--primary);
    border-top-right-radius: 4px;
    border-bottom-right-radius: 4px;
}

.menu-item i {
    width: 24px;
    margin-right: 15px;
    font-size: 18px;
    transition: var(--transition);
}

.menu-item:hover i, .menu-item.active i {
    transform: scale(1.1);
    color: var(--primary);
}

.menu-badge {
    margin-left: auto;
    background: var(--primary);
    color: white;
    font-size: 12px;
    padding: 4px 10px;
    border-radius: 12px;
    min-width: 28px;
    text-align: center;
}

/* Main Content */
.main-content {
    flex: 1;
    margin-left: var(--sidebar-width);
    transition: var(--transition);
}

/* Header */
.header {
    height: var(--header-height);
    background: white;
    box-shadow: var(--shadow);
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 0 30px;
    position: sticky;
    top: 0;
    z-index: 100;
}

.page-title {
    font-family: 'Poppins', sans-serif;
    font-size: 28px;
    font-weight: 600;
    color: var(--dark);
    position: relative;
    display: inline-block;
}

.page-title::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 0;
    width: 50px;
    height: 4px;
    background: var(--primary);
    border-radius: 2px;
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
    padding: 12px 15px 12px 45px;
    border: 1px solid var(--light-gray);
    border-radius: 50px;
    font-size: 14px;
    width: 300px;
    transition: var(--transition);
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
}

.search-input:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
    width: 320px;
}

.search-icon {
    position: absolute;
    left: 18px;
    top: 50%;
    transform: translateY(-50%);
    color: var(--gray);
}

.notification-bell {
    position: relative;
    cursor: pointer;
    color: var(--gray);
    font-size: 20px;
    transition: var(--transition);
    width: 40px;
    height: 40px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.notification-bell:hover {
    background: var(--light);
    color: var(--primary);
    transform: translateY(-2px);
}

.notification-badge {
    position: absolute;
    top: 0;
    right: 0;
    background: var(--danger);
    color: white;
    font-size: 10px;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.1); }
    100% { transform: scale(1); }
}

.user-profile {
    display: flex;
    align-items: center;
    gap: 12px;
    cursor: pointer;
    padding: 8px 15px;
    border-radius: 50px;
    transition: var(--transition);
}

.user-profile:hover {
    background: var(--light);
}

.user-avatar {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    background: var(--gradient-secondary);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    box-shadow: 0 5px 15px rgba(255, 152, 0, 0.3);
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

/* Dashboard Content */
.dashboard {
    padding: 30px;
}

/* Welcome Banner */
.welcome-banner {
    background: var(--gradient-primary);
    color: white;
    border-radius: var(--card-radius);
    padding: 30px;
    margin-bottom: 30px;
    box-shadow: var(--shadow);
    position: relative;
    overflow: hidden;
}

.welcome-banner::before {
    content: '';
    position: absolute;
    top: -50px;
    right: -50px;
    width: 200px;
    height: 200px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
}

.welcome-banner::after {
    content: '';
    position: absolute;
    bottom: -80px;
    right: 30px;
    width: 150px;
    height: 150px;
    background: rgba(255, 255, 255, 0.1);
    border-radius: 50%;
}

.banner-title {
    font-family: 'Poppins', sans-serif;
    font-size: 28px;
    margin-bottom: 10px;
    position: relative;
    z-index: 1;
}

.banner-subtitle {
    opacity: 0.9;
    margin-bottom: 20px;
    max-width: 600px;
    position: relative;
    z-index: 1;
}

.banner-stats {
    display: flex;
    gap: 30px;
    position: relative;
    z-index: 1;
}

.banner-stat {
    display: flex;
    flex-direction: column;
}

.stat-value {
    font-family: 'Poppins', sans-serif;
    font-size: 32px;
    font-weight: 700;
}

.stat-label {
    font-size: 14px;
    opacity: 0.8;
}

/* Stats Grid */
.stats-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 25px;
    margin-bottom: 30px;
}

.stat-card {
    background: white;
    border-radius: var(--card-radius);
    padding: 25px;
    box-shadow: var(--shadow);
    transition: var(--transition);
    position: relative;
    overflow: hidden;
    display: flex;
    flex-direction: column;
}

.stat-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.stat-card::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: var(--gradient-primary);
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

.stat-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.stat-icon {
    width: 60px;
    height: 60px;
    background: rgba(76, 175, 80, 0.1);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--primary);
    font-size: 24px;
}

.stat-card.warning .stat-icon {
    background: rgba(255, 193, 7, 0.1);
    color: var(--warning);
}

.stat-card.danger .stat-icon {
    background: rgba(244, 67, 54, 0.1);
    color: var(--danger);
}

.stat-card.accent .stat-icon {
    background: rgba(78, 205, 196, 0.1);
    color: var(--accent);
}

.stat-trend {
    display: flex;
    align-items: center;
    font-size: 14px;
    font-weight: 600;
    color: var(--success);
}

.stat-trend.negative {
    color: var(--danger);
}

.stat-trend i {
    margin-right: 5px;
}

.stat-content {
    margin-top: auto;
}

.stat-value-lg {
    font-family: 'Poppins', sans-serif;
    font-size: 32px;
    font-weight: 700;
    margin-bottom: 5px;
}

.stat-title {
    color: var(--gray);
    font-size: 14px;
}

/* Charts and Lists Container */
.content-grid {
    display: grid;
    grid-template-columns: 2fr 1fr;
    gap: 25px;
    margin-bottom: 30px;
}

/* Chart Card */
.chart-card {
    background: white;
    border-radius: var(--card-radius);
    padding: 25px;
    box-shadow: var(--shadow);
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
}

.chart-actions {
    display: flex;
    gap: 10px;
}

.chart-action-btn {
    background: var(--light);
    border: none;
    width: 36px;
    height: 36px;
    border-radius: 10px;
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
    transform: rotate(15deg);
}

.chart-placeholder {
    height: 300px;
    background: var(--light);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: var(--gray);
    font-style: italic;
    position: relative;
    overflow: hidden;
}

.chart-placeholder::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.5), transparent);
    animation: shimmer 2s infinite;
}

@keyframes shimmer {
    0% { transform: translateX(-100%); }
    100% { transform: translateX(100%); }
}

/* Recent Orders */
.orders-card {
    background: white;
    border-radius: var(--card-radius);
    padding: 25px;
    box-shadow: var(--shadow);
}

.orders-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.orders-title {
    font-family: 'Poppins', sans-serif;
    font-size: 18px;
    font-weight: 600;
}

.view-all {
    color: var(--primary);
    text-decoration: none;
    font-size: 14px;
    font-weight: 600;
    display: flex;
    align-items: center;
    transition: var(--transition);
}

.view-all:hover {
    color: var(--secondary);
}

.view-all i {
    margin-left: 5px;
    transition: var(--transition);
}

.view-all:hover i {
    transform: translateX(3px);
}

.orders-list {
    list-style: none;
}

.order-item {
    display: flex;
    align-items: center;
    padding: 15px 0;
    border-bottom: 1px solid var(--light-gray);
    transition: var(--transition);
}

.order-item:hover {
    background: var(--light);
    border-radius: 8px;
    padding: 15px;
    transform: translateX(5px);
}

.order-item:last-child {
    border-bottom: none;
}

.order-icon {
    width: 45px;
    height: 45px;
    border-radius: 10px;
    background: var(--light);
    display: flex;
    align-items: center;
    justify-content: center;
    margin-right: 15px;
    color: var(--primary);
    font-size: 18px;
}

.order-info {
    flex: 1;
}

.order-title {
    font-weight: 600;
    margin-bottom: 5px;
}

.order-details {
    color: var(--gray);
    font-size: 13px;
    display: flex;
    align-items: center;
    gap: 15px;
}

.order-status {
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
}

.status-pending {
    background: rgba(255, 193, 7, 0.15);
    color: var(--warning);
}

.status-completed {
    background: rgba(76, 175, 80, 0.15);
    color: var(--success);
}

.status-cancelled {
    background: rgba(244, 67, 54, 0.15);
    color: var(--danger);
}

/* Inventory Section */
.inventory-section {
    background: white;
    border-radius: var(--card-radius);
    padding: 25px;
    box-shadow: var(--shadow);
    margin-bottom: 30px;
}

.section-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.section-title {
    font-family: 'Poppins', sans-serif;
    font-size: 22px;
    font-weight: 600;
}

.add-item-btn {
    background: var(--primary);
    color: white;
    border: none;
    padding: 10px 20px;
    border-radius: 50px;
    font-weight: 600;
    cursor: pointer;
    display: flex;
    align-items: center;
    gap: 8px;
    transition: var(--transition);
    box-shadow: 0 5px 15px rgba(76, 175, 80, 0.3);
}

.add-item-btn:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
    box-shadow: 0 8px 20px rgba(76, 175, 80, 0.4);
}

.inventory-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}

.inventory-item {
    background: white;
    border: 1px solid var(--light-gray);
    border-radius: 12px;
    padding: 20px;
    transition: var(--transition);
    position: relative;
    overflow: hidden;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
}

.inventory-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
    border-color: var(--primary-light);
}

.item-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.item-name {
    font-weight: 600;
    font-size: 16px;
    color: var(--dark);
}

.item-category {
    font-size: 12px;
    background: rgba(76, 175, 80, 0.1);
    padding: 4px 10px;
    border-radius: 20px;
    color: var(--primary);
}

.item-details {
    margin-bottom: 15px;
}

.item-price {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 8px;
}

.original-price {
    text-decoration: line-through;
    color: var(--gray);
    font-size: 14px;
}

.discounted-price {
    font-weight: 600;
    color: var(--primary);
    font-size: 18px;
}

.item-quantity {
    display: flex;
    align-items: center;
    gap: 8px;
    color: var(--gray);
    font-size: 14px;
}

.quantity-value {
    font-weight: 600;
    color: var(--dark);
}

.item-expiry {
    display: flex;
    align-items: center;
    gap: 8px;
    color: var(--gray);
    font-size: 14px;
    margin-bottom: 15px;
}

.expiry-value {
    font-weight: 600;
    color: var(--danger);
}

.item-actions {
    display: flex;
    gap: 10px;
}

.item-btn {
    flex: 1;
    padding: 8px;
    border: none;
    border-radius: 8px;
    font-size: 13px;
    font-weight: 600;
    cursor: pointer;
    transition: var(--transition);
}

.edit-btn {
    background: rgba(76, 175, 80, 0.1);
    color: var(--primary);
}

.edit-btn:hover {
    background: var(--primary);
    color: white;
}

.delete-btn {
    background: rgba(244, 67, 54, 0.1);
    color: var(--danger);
}

.delete-btn:hover {
    background: var(--danger);
    color: white;
}

/* Responsive Design */
@media (max-width: 1200px) {
    .content-grid {
        grid-template-columns: 1fr;
    }
    .sidebar {
        transform: translateX(-100%);
        width: 0;
    }
    .sidebar.active {
        transform: translateX(0);
        width: var(--sidebar-width);
    }
    .main-content {
        margin-left: 0;
    }
    .sidebar.active + .main-content {
        margin-left: var(--sidebar-width);
    }
    .menu-toggle {
        display: block;
    }
    .search-input {
        width: 200px;
    }
    .search-input:focus {
        width: 220px;
    }
}

@media (max-width: 992px) {
    .stats-grid {
        grid-template-columns: 1fr 1fr;
    }
    .welcome-banner {
        text-align: center;
    }
    .banner-stats {
        justify-content: center;
    }
}

@media (max-width: 768px) {
    .stats-grid {
        grid-template-columns: 1fr;
    }
    .header {
        flex-direction: column;
        height: auto;
        padding: 20px;
    }
    .header-actions {
        width: 100%;
        margin-top: 15px;
        justify-content: space-between;
    }
    .search-input {
        width: 100%;
    }
    .search-input:focus {
        width: 100%;
    }
    .banner-stats {
        flex-direction: column;
        gap: 15px;
        align-items: center;
    }
    .inventory-grid {
        grid-template-columns: 1fr;
    }
}

/* Toggle button for mobile */
.menu-toggle {
    display: none;
    background: var(--primary);
    color: white;
    border: none;
    width: 45px;
    height: 45px;
    border-radius: 10px;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    font-size: 20px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    transition: var(--transition);
}

.menu-toggle:hover {
    background: var(--primary-dark);
    transform: rotate(90deg);
}

@media (max-width: 1200px) {
    .menu-toggle {
        display: flex;
        margin-right: 15px;
    }
}

/* Animation for cards */
@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(20px); }
    to { opacity: 1; transform: translateY(0); }
}

.stat-card, .chart-card, .orders-card, .inventory-item {
    animation: fadeInUp 0.5s ease-out;
}

/* FoodSave specific styling */
.foodsave-badge {
    background: var(--primary);
    color: white;
    padding: 4px 10px;
    border-radius: 20px;
    font-size: 12px;
    font-weight: 600;
    display: inline-block;
    margin-left: 10px;
}

.waste-reduction {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-top: 10px;
    color: var(--primary);
    font-size: 14px;
    font-weight: 600;
}

.waste-reduction i {
    font-size: 16px;
}
</style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="business-avatar">RM</div>
                <div class="business-info">
                    <div class="business-name">Business Dashboard</div>
                    <div class="business-type">FoodSave Partner</div>
                </div>
            </div>

            <div class="sidebar-menu">
                <div class="menu-section">
                    <div class="menu-label">Dashboard</div>
                    <a href="#" class="menu-item active">
                        <i class="fas fa-chart-pie"></i>
                        <span>Overview</span>
                    </a>
                </div>

                <div class="menu-section">
                    <div class="menu-label">Management</div>
                    <a href="#" class="menu-item">
                        <i class="fas fa-utensils"></i>
                        <span>Food Listings</span>
                        <span class="menu-badge">3</span>
                    </a>
                    <a href="businessOrders" class="menu-item">
                        <i class="fas fa-clipboard-list"></i>
                        <span>Orders</span>
                        <span class="menu-badge">2</span>
                    </a>
                    <a href="inventory" class="menu-item">
                        <i class="fas fa-boxes"></i>
                        <span>Inventory</span>
                    </a>
                    <a href="#" class="menu-item">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Pickup Schedule</span>
                    </a>
                </div>
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
                    <h1 class="page-title">Business Dashboard</h1>
                </div>

                <div class="header-actions">
                    <div class="search-box">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" class="search-input" placeholder="Search orders, items...">
                    </div>

                    <div class="notification-bell">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </div>

                    <div class="user-profile">
                        <div class="user-avatar">BD</div>
                        <div class="user-info">
                            <div class="user-name">Restraunt Manager</div>
                            <div class="user-role">FoodSave Partner</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Content -->
            <div class="dashboard">

                <!-- Stats Grid -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-header">
                            <div class="stat-icon">
                                <i class="fas fa-utensils"></i>
                            </div>
                            <div class="stat-trend">
                                <i class="fas fa-arrow-up"></i>
                                <span>12%</span>
                            </div>
                        </div>
                        <div class="stat-content">
                            <div class="stat-value-lg">42</div>
                            <div class="stat-title">Active Food Listings</div>
                        </div>
                    </div>

                    <div class="stat-card accent">
                        <div class="stat-header">
                            <div class="stat-icon">
                                <i class="fas fa-shopping-bag"></i>
                            </div>
                            <div class="stat-trend">
                                <i class="fas fa-arrow-up"></i>
                                <span>8%</span>
                            </div>
                        </div>
                        <div class="stat-content">
                            <div class="stat-value-lg">18</div>
                            <div class="stat-title">Today's Orders</div>
                        </div>
                    </div>

                    <div class="stat-card warning">
                        <div class="stat-header">
                            <div class="stat-icon">
                                <i class="fas fa-dollar-sign"></i>
                            </div>
                            <div class="stat-trend">
                                <i class="fas fa-arrow-up"></i>
                                <span>15%</span>
                            </div>
                        </div>
                        <div class="stat-content">
                            <div class="stat-value-lg">$328</div>
                            <div class="stat-title">Today's Revenue</div>
                        </div>
                    </div>

                    <div class="stat-card danger">
                        <div class="stat-header">
                            <div class="stat-icon">
                                <i class="fas fa-weight-hanging"></i>
                            </div>
                            <div class="stat-trend negative">
                                <i class="fas fa-arrow-down"></i>
                                <span>5%</span>
                            </div>
                        </div>
                        <div class="stat-content">
                            <div class="stat-value-lg">12kg</div>
                            <div class="stat-title">Food Waste This Week</div>
                        </div>
                    </div>
                </div>

                <div class="content-grid">

                    <!-- Recent Orders -->
                    <div class="orders-card">
                        <div class="orders-header">
                            <h3 class="orders-title">Recent Orders</h3>
                            <a href="#" class="view-all">
                                View All
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </div>

                        <ul class="orders-list">
                            <li class="order-item">
                                <div class="order-icon">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="order-info">
                                    <div class="order-title">Sarah Johnson</div>
                                    <div class="order-details">
                                        <span>2 items • $24.50</span>
                                        <span class="order-status status-completed">Completed</span>
                                    </div>
                                </div>
                            </li>

                            <li class="order-item">
                                <div class="order-icon">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div class="order-info">
                                    <div class="order-title">Michael Chen</div>
                                    <div class="order-details">
                                        <span>1 item • $12.00</span>
                                        <span class="order-status status-pending">Pending</span>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>

                <!-- Inventory Section -->
                <div class="inventory-section">
                    <div class="section-header">
                        <h3 class="section-title">Current Inventory</h3>
                        <button class="add-item-btn">
                            <i class="fas fa-plus"></i> Add New Item
                        </button>
                    </div>

                    <div class="inventory-grid">
                        <%
                            List<FoodItems> foodItems = (List<FoodItems>) request.getAttribute("foodItems");
                            if (foodItems != null && !foodItems.isEmpty()) {
                                for (FoodItems item : foodItems) {
                        %>
                        <div class="inventory-item">
                            <div class="item-header">
                                <div class="item-name"><%=item.getName()%></div>
                                <div class="item-category"><%=item.getCategory()%></div>
                            </div>
                            <div class="item-details">
                                <div class="item-price">
                                    <span class="original-price">$<%=item.getOriginalPrice()%></span>
                                    <span class="discounted-price">$<%=item.getDiscountedPrice()%></span>
                                </div>
                                <div class="item-quantity">
                                    <i class="fas fa-box"></i> Quantity: <span class="quantity-value"><%=item.getQuantity()%></span>
                                </div>
                                <div class="item-expiry">
                                    <i class="fas fa-clock"></i> Expires:
                                    <%
                                        java.time.LocalDateTime now = java.time.LocalDateTime.now();
                                        java.time.LocalDateTime expiry = item.getAvailableTill();
                                        long hours = java.time.Duration.between(now, expiry).toHours();
                                        if (hours < 24) {
                                            out.print("Today");
                                        } else if (hours < 48) {
                                            out.print("Tomorrow");
                                        } else {
                                            out.print(hours / 24 + " days");
                                        }
                                    %>
                                </div>
                            </div>
                            <div class="item-actions">
                                <form action="editFoodItem" method="post" style="display: inline;">
                                    <input type="hidden" name="foodId" value="<%=item.getId()%>" />
                                    <button type="submit" class="item-btn edit-btn">Edit</button>
                                </form>
                                <form action="deleteFoodItem" method="post" style="display: inline;">
                                    <input type="hidden" name="foodId" value="<%=item.getId()%>" />
                                    <button type="submit" class="item-btn delete-btn">Remove</button>
                                </form>
                            </div>
                        </div>
                        <%
                                }
                            } else {
                        %>
                        <p style="padding: 10px; color: gray;">No items in inventory. Add new items above.</p>
                        <%
                            }
                        %>
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
            if (window.innerWidth < 1200 && 
                !sidebar.contains(e.target) && 
                !menuToggle.contains(e.target) &&
                sidebar.classList.contains('active')) {
                sidebar.classList.remove('active');
            }
        });
        
        // Simulate chart loading animation
        document.querySelectorAll('.chart-placeholder').forEach(chart => {
            setTimeout(() => {
                chart.innerHTML = 'Interactive chart loaded successfully';
            }, 1500);
        });
        
        // Add hover effect to inventory items
        const inventoryItems = document.querySelectorAll('.inventory-item');
        inventoryItems.forEach(item => {
            item.addEventListener('mouseenter', function() {
                this.style.transform = 'translateY(-8px)';
                this.style.boxShadow = '0 12px 25px rgba(0, 0, 0, 0.15)';
            });
            
            item.addEventListener('mouseleave', function() {
                this.style.transform = 'translateY(-5px)';
                this.style.boxShadow = '0 10px 20px rgba(0, 0, 0, 0.1)';
            });
        });
        
        // Notification bell animation
        const notificationBell = document.querySelector('.notification-bell');
        notificationBell.addEventListener('click', function() {
            this.style.transform = 'scale(0.9)';
            setTimeout(() => {
                this.style.transform = '';
            }, 300);
        });
    </script>
</body>
</html>
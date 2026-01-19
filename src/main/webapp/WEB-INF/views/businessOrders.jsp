<%@ page import="java.util.Map" %>
<%@ page import="com.heramb.model.FoodItems" %>
<%@ page import="com.heramb.model.Orders" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.heramb.model.Orders" %>
<%@ page import="com.heramb.model.FoodItems" %>

<%
    List<Orders> orders = (List<Orders>) request.getAttribute("orders");
    Map<Long, FoodItems> foodMap = (Map<Long, FoodItems>) request.getAttribute("foodMap");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Business Orders - FoodSave</title>
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

        /* Orders Section */
        .orders-section {
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

        .orders-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .orders-table th {
            background-color: var(--light);
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            color: var(--dark);
            border-bottom: 1px solid var(--light-gray);
        }

        .orders-table td {
            padding: 15px 12px;
            border-bottom: 1px solid var(--light-gray);
            transition: background-color 0.2s;
        }

        .orders-table tr:last-child td {
            border-bottom: none;
        }

        .orders-table tr:hover td {
            background-color: #f9f9f9;
        }

        .food-item {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .food-icon {
            width: 40px;
            height: 40px;
            background: var(--light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 18px;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
        }

        .status-pending {
            background-color: #FFF3E0;
            color: var(--warning);
        }

        .status-completed {
            background-color: #E8F5E9;
            color: var(--success);
        }

        .status-rejected {
            background-color: #FFEBEE;
            color: var(--danger);
        }

        .action-form {
            display: flex;
            gap: 8px;
        }

        .btn {
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
        }

        .btn-approve {
            background-color: var(--success);
            color: white;
        }

        .btn-approve:hover {
            background-color: var(--primary-dark);
            transform: translateY(-2px);
        }

        .btn-reject {
            background-color: var(--danger);
            color: white;
        }

        .btn-reject:hover {
            background-color: #d32f2f;
            transform: translateY(-2px);
        }

        .btn:active {
            transform: translateY(0);
        }

        .no-orders {
            text-align: center;
            padding: 40px 20px;
            color: var(--gray);
        }

        .no-orders-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: var(--light-gray);
        }

        /* Responsive Design */
        @media (max-width: 1200px) {
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
            .orders-table {
                display: block;
                overflow-x: auto;
            }
        }

        @media (max-width: 768px) {
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
            .action-form {
                flex-direction: column;
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

        footer {
            text-align: center;
            padding: 20px;
            color: var(--gray);
            font-size: 14px;
            margin-top: 40px;
            border-top: 1px solid var(--light-gray);
        }
    </style>
</head>
<body>
    <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="business-avatar">GC</div>
                <div class="business-info">
                    <div class="business-name">Green Cafe</div>
                    <div class="business-type">FoodSave Partner</div>
                </div>
            </div>

            <div class="sidebar-menu">
                <div class="menu-section">
                    <div class="menu-label">Dashboard</div>
                    <a href="businessDashboard" class="menu-item">
                        <i class="fas fa-chart-pie"></i>
                        <span>Overview</span>
                    </a>
                </div>

                <div class="menu-section">
                    <div class="menu-label">Management</div>
                    <a href="businessDashboard" class="menu-item">
                        <i class="fas fa-utensils"></i>
                        <span>Food Listings</span>
                        <span class="menu-badge">12</span>
                    </a>
                    <a href="businessOrders" class="menu-item active">
                        <i class="fas fa-clipboard-list"></i>
                        <span>Orders</span>
                        <span class="menu-badge"><%= orders != null ? orders.size() : 0 %></span>
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
                    <h1 class="page-title">Business Orders</h1>
                </div>

                <div class="header-actions">
                    <div class="search-box">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" class="search-input" placeholder="Search orders...">
                    </div>

                    <div class="notification-bell">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </div>

                    <div class="user-profile">
                        <div class="user-avatar">JM</div>
                        <div class="user-info">
                            <div class="user-name">John Manager</div>
                            <div class="user-role">FoodSave Partner</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Content -->
            <div class="dashboard">
                <div class="orders-section">
                    <div class="section-header">
                        <h3 class="section-title">Order Management</h3>
                        <div class="search-box">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" class="search-input" placeholder="Filter orders...">
                        </div>
                    </div>

                    <table class="orders-table">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Food Item</th>
                                <th>Customer ID</th>
                                <th>Quantity</th>
                                <th>Total Amount</th>
                                <th>Pickup Time</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                if(orders != null && !orders.isEmpty()) {
                                    for(Orders o : orders) {
                                        FoodItems item = foodMap.get(o.getFoodItemId());
                                        String statusClass = "";
                                        if (o.getStatus() == com.heramb.enums.OrderStatus.PENDING) {
                                            statusClass = "status-pending";
                                        } else if (o.getStatus() == com.heramb.enums.OrderStatus.COMPLETED) {
                                            statusClass = "status-completed";
                                        } else if (o.getStatus() == com.heramb.enums.OrderStatus.CANCELLED) {
                                            statusClass = "status-rejected";
                                        }
                            %>
                            <tr>
                                <td>#<%= o.getId() %></td>
                                <td>
                                    <div class="food-item">
                                        <div class="food-icon">🍴</div>
                                        <div><%= item != null ? item.getName() : "Unknown" %></div>
                                    </div>
                                </td>
                                <td><%= o.getCustomerId() %></td>
                                <td><%= o.getQuantity() %></td>
                                <td>$<%= o.getTotalAmount() %></td>
                                <td><%= o.getPickupTime() %></td>
                                <td><span class="status-badge <%= statusClass %>"><%= o.getStatus() %></span></td>
                                <td>
                                    <% if(o.getStatus() == com.heramb.enums.OrderStatus.PENDING) { %>
                                        <form action="<%=request.getContextPath()%>/updateOrderStatus" method="post" class="action-form">
                                            <input type="hidden" name="orderId" value="<%= o.getId() %>">
                                            <button type="submit" name="action" value="APPROVE" class="btn btn-approve">Approve</button>
                                            <button type="submit" name="action" value="REJECT" class="btn btn-reject">Reject</button>
                                        </form>
                                    <% } else { %>
                                        <span style="color: var(--gray);">N/A</span>
                                    <% } %>
                                </td>
                            </tr>
                            <%
                                    }
                                } else {
                            %>
                            <tr>
                                <td colspan="8">
                                    <div class="no-orders">
                                        <div class="no-orders-icon">📭</div>
                                        <h3>No orders found</h3>
                                        <p>You don't have any orders yet.</p>
                                    </div>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>

            <footer>
                <div class="container">
                    <p>© 2023 FoodSave. All rights reserved. | Reducing food waste, one order at a time.</p>
                </div>
            </footer>
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
        
        // Simple search functionality
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.search-input');
            const tableRows = document.querySelectorAll('.orders-table tbody tr');
            
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                
                tableRows.forEach(row => {
                    if (row.querySelector('.no-orders')) return;
                    
                    const textContent = row.textContent.toLowerCase();
                    if (textContent.includes(searchTerm)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>
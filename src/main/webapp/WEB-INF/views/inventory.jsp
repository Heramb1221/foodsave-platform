<%@ page import="java.util.List" %>
<%@ page import="com.heramb.model.FoodItems" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Food Items - FoodSave</title>
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

        /* Form Section */
        .form-section {
            background: white;
            border-radius: var(--card-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
        }

        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 25px;
        }

        .section-title {
            font-family: 'Poppins', sans-serif;
            font-size: 22px;
            font-weight: 600;
        }

        .form-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group.full-width {
            grid-column: 1 / -1;
        }

        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 600;
            color: var(--dark);
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--light-gray);
            border-radius: 8px;
            font-size: 16px;
            transition: var(--transition);
            background: white;
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }

        textarea.form-control {
            min-height: 100px;
            resize: vertical;
        }

        .btn {
            display: inline-block;
            padding: 14px 28px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: var(--transition);
            text-align: center;
        }

        .btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .btn:active {
            transform: translateY(0);
        }

        /* Messages */
        .alert {
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .alert-success {
            background: #E8F5E9;
            color: var(--success);
            border: 1px solid #C8E6C9;
        }

        .alert-error {
            background: #FFEBEE;
            color: var(--danger);
            border: 1px solid #FFCDD2;
        }

        /* Inventory Section */
        .inventory-section {
            background: white;
            border-radius: var(--card-radius);
            padding: 30px;
            box-shadow: var(--shadow);
            margin-bottom: 30px;
        }

        .inventory-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .inventory-table th {
            background-color: var(--light);
            padding: 15px 12px;
            text-align: left;
            font-weight: 600;
            color: var(--dark);
            border-bottom: 1px solid var(--light-gray);
        }

        .inventory-table td {
            padding: 15px 12px;
            border-bottom: 1px solid var(--light-gray);
            transition: background-color 0.2s;
        }

        .inventory-table tr:last-child td {
            border-bottom: none;
        }

        .inventory-table tr:hover td {
            background-color: #f9f9f9;
        }

        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            text-transform: uppercase;
        }

        .status-active {
            background-color: #E8F5E9;
            color: var(--success);
        }

        .status-expired {
            background-color: #FFEBEE;
            color: var(--danger);
        }

        .no-items {
            text-align: center;
            padding: 40px 20px;
            color: var(--gray);
        }

        .no-items-icon {
            font-size: 48px;
            margin-bottom: 15px;
            color: var(--light-gray);
        }

        /* Price display */
        .price-display {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .original-price {
            text-decoration: line-through;
            color: var(--gray);
            font-size: 14px;
        }

        .discounted-price {
            font-weight: 600;
            color: var(--primary);
            font-size: 16px;
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
            .form-grid {
                grid-template-columns: 1fr;
            }
            .inventory-table {
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
                <div class="business-avatar">RM</div>
                <div class="business-info">
                    <div class="business-name">Restaurant Manager</div>
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
                    <a href="businessDashboard" class="menu-item active">
                        <i class="fas fa-utensils"></i>
                        <span>Food Listings</span>
                        <span class="menu-badge">12</span>
                    </a>
                    <a href="businessOrders" class="menu-item">
                        <i class="fas fa-clipboard-list"></i>
                        <span>Orders</span>
                        <span class="menu-badge">8</span>
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


                <div class="menu-section">
                    <div class="menu-label">Account</div>
                    <a href="index" class="menu-item">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
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
                    <h1 class="page-title">Manage Food Items</h1>
                </div>

                <div class="header-actions">
                    <div class="search-box">
                        <i class="fas fa-search search-icon"></i>
                        <input type="text" class="search-input" placeholder="Search food items...">
                    </div>

                    <div class="notification-bell">
                        <i class="fas fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </div>

                    <div class="user-profile">
                        <div class="user-avatar">RM</div>
                        <div class="user-info">
                            <div class="user-name">Restaurant Manager</div>
                            <div class="user-role">FoodSave Partner</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Content -->
            <div class="dashboard">
                <!-- Success/Error Messages -->
                <% 
                    String success = (String) request.getAttribute("success");
                    String error = (String) request.getAttribute("error");
                    if (success != null) { 
                %>
                    <div class="alert alert-success">
                        <i class="fas fa-check-circle"></i> <%= success %>
                    </div>
                <% } else if (error != null) { %>
                    <div class="alert alert-error">
                        <i class="fas fa-exclamation-circle"></i> <%= error %>
                    </div>
                <% } %>

                <!-- Add Food Item Form -->
                <div class="form-section">
                    <div class="section-header">
                        <h3 class="section-title">Add Surplus Food Item</h3>
                    </div>
                    
                    <form action="addFoodItem" method="post">
                        <div class="form-grid">
                            <div class="form-group">
                                <label class="form-label" for="name">Name:</label>
                                <input type="text" id="name" name="name" class="form-control" required/>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label" for="category">Category:</label>
                                <input type="text" id="category" name="category" class="form-control"/>
                            </div>
                            
                            <div class="form-group full-width">
                                <label class="form-label" for="description">Description:</label>
                                <textarea id="description" name="description" class="form-control"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label" for="quantity">Quantity:</label>
                                <input type="number" id="quantity" name="quantity" class="form-control" required/>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label" for="originalPrice">Original Price ($):</label>
                                <input type="number" step="0.01" id="originalPrice" name="originalPrice" class="form-control" required/>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label" for="discountedPrice">Discounted Price ($):</label>
                                <input type="number" step="0.01" id="discountedPrice" name="discountedPrice" class="form-control" required/>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label" for="image">Image URL:</label>
                                <input type="text" id="image" name="image" class="form-control"/>
                            </div>
                            
                            <div class="form-group">
                                <label class="form-label" for="availableTill">Available Till:</label>
                                <input type="datetime-local" id="availableTill" name="availableTill" class="form-control" required/>
                            </div>
                            
                            <div class="form-group full-width">
                                <button type="submit" class="btn" style="width: 200px;">
                                    <i class="fas fa-plus"></i> Add Food Item
                                </button>
                            </div>
                        </div>
                    </form>
                </div>

                <!-- Existing Inventory -->
                <div class="inventory-section">
                    <div class="section-header">
                        <h3 class="section-title">Existing Inventory</h3>
                        <div class="search-box">
                            <i class="fas fa-search search-icon"></i>
                            <input type="text" class="search-input" placeholder="Search inventory...">
                        </div>
                    </div>

                    <%
                        List<FoodItems> items = (List<FoodItems>) request.getAttribute("foodItems");
                        if (items != null && !items.isEmpty()) {
                    %>
                    <table class="inventory-table">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Qty</th>
                                <th>Price</th>
                                <th>Category</th>
                                <th>Available Till</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                for (FoodItems item : items) {
                                    // Determine status based on availability
                                    java.time.LocalDateTime now = java.time.LocalDateTime.now();
                                    boolean isExpired = item.getAvailableTill().isBefore(now);
                            %>
                            <tr>
                                <td><strong><%= item.getName() %></strong></td>
                                <td><%= item.getDescription() != null ? item.getDescription() : "No description" %></td>
                                <td><%= item.getQuantity() %></td>
                                <td>
                                    <div class="price-display">
                                        <span class="original-price">$<%= item.getOriginalPrice() %></span>
                                        <span class="discounted-price">$<%= item.getDiscountedPrice() %></span>
                                    </div>
                                </td>
                                <td><%= item.getCategory() != null ? item.getCategory() : "Uncategorized" %></td>
                                <td><%= item.getAvailableTill() %></td>
                                <td>
                                    <span class="status-badge <%= isExpired ? "status-expired" : "status-active" %>">
                                        <%= isExpired ? "Expired" : "Active" %>
                                    </span>
                                </td>
                            </tr>
                            <%
                                }
                            %>
                        </tbody>
                    </table>
                    <% } else { %>
                    <div class="no-items">
                        <div class="no-items-icon">📦</div>
                        <h3>No items in your inventory yet</h3>
                        <p>Add your first surplus food item using the form above.</p>
                    </div>
                    <% } %>
                </div>
            </div>

            <footer>
                <div class="container">
                    <p>© 2025 FoodSave. All rights reserved. | Reducing food waste, one meal at a time.</p>
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
        
        // Simple search functionality for inventory
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.querySelector('.inventory-section .search-input');
            const tableRows = document.querySelectorAll('.inventory-table tbody tr');
            
            if (searchInput && tableRows.length > 0) {
                searchInput.addEventListener('input', function() {
                    const searchTerm = this.value.toLowerCase();
                    
                    tableRows.forEach(row => {
                        const textContent = row.textContent.toLowerCase();
                        if (textContent.includes(searchTerm)) {
                            row.style.display = '';
                        } else {
                            row.style.display = 'none';
                        }
                    });
                });
            }
        });
    </script>
</body>
</html>
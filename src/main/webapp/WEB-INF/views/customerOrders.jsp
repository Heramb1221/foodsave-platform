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
    <title>Order History - FoodSave</title>
    <style>
        :root {
            --primary: #4CAF50;
            --primary-dark: #388E3C;
            --secondary: #FF9800;
            --light: #F5F5F5;
            --dark: #212121;
            --gray: #757575;
            --light-gray: #E0E0E0;
            --danger: #F44336;
            --success: #4CAF50;
            --warning: #FFC107;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f9f9f9;
            color: var(--dark);
            line-height: 1.6;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        
        header {
            background: linear-gradient(135deg, var(--primary), var(--primary-dark));
            color: white;
            padding: 20px 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-radius: 0 0 10px 10px;
            margin-bottom: 30px;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .logo-icon {
            font-size: 28px;
        }
        
        .logo h1 {
            font-size: 24px;
            font-weight: 600;
        }
        
        .nav-links a {
            color: white;
            text-decoration: none;
            margin-left: 20px;
            font-weight: 500;
            transition: opacity 0.3s;
        }
        
        .nav-links a:hover {
            opacity: 0.8;
        }
        
        .page-title {
            text-align: center;
            margin-bottom: 30px;
            position: relative;
        }
        
        .page-title h2 {
            font-size: 32px;
            color: var(--dark);
            display: inline-block;
            padding-bottom: 10px;
        }
        
        .page-title h2:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 4px;
            background: var(--secondary);
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            border-radius: 2px;
        }
        
        .orders-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            margin-bottom: 30px;
        }
        
        .table-header {
            background: var(--primary);
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .table-header h3 {
            font-weight: 500;
        }
        
        .search-filter {
            display: flex;
            gap: 10px;
        }
        
        .search-filter input, .search-filter select {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
        }
        
        .orders-table {
            width: 100%;
            border-collapse: collapse;
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
        
        .status-completed {
            background-color: #E8F5E9;
            color: var(--success);
        }
        
        .status-pending {
            background-color: #FFF3E0;
            color: var(--warning);
        }
        
        .status-cancelled {
            background-color: #FFEBEE;
            color: var(--danger);
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
        
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
            display: flex;
            align-items: center;
            gap: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        
        .stat-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }
        
        .stat-icon {
            width: 50px;
            height: 50px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            color: white;
        }
        
        .stat-1 { background: linear-gradient(135deg, #4CAF50, #81C784); }
        .stat-2 { background: linear-gradient(135deg, #2196F3, #64B5F6); }
        .stat-3 { background: linear-gradient(135deg, #FF9800, #FFB74D); }
        
        .stat-info h3 {
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .stat-info p {
            color: var(--gray);
            font-size: 14px;
        }
        
        footer {
            text-align: center;
            padding: 20px;
            color: var(--gray);
            font-size: 14px;
            margin-top: 40px;
            border-top: 1px solid var(--light-gray);
        }
        
        @media (max-width: 768px) {
            .orders-table {
                display: block;
                overflow-x: auto;
            }
            
            .header-content {
                flex-direction: column;
                gap: 15px;
            }
            
            .nav-links {
                text-align: center;
            }
            
            .search-filter {
                flex-direction: column;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container header-content">
            <div class="logo">
                <div class="logo-icon">🍽️</div>
                <h1>FoodSave</h1>
            </div>
            <div class="nav-links">
                <a href="customerDashboard">Dashboard</a>
            </div>
        </div>
    </header>
    
    <div class="container">
        <div class="page-title">
            <h2>Order History</h2>
        </div>
        
        <div class="stats-cards">
            <div class="stat-card">
                <div class="stat-icon stat-1">📦</div>
                <div class="stat-info">
                    <h3><%= orders != null ? orders.size() : 0 %></h3>
                    <p>Total Orders</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon stat-2">💰</div>
                <div class="stat-info">
                    <%
                        double totalAmount = 0;
                        if (orders != null) {
                            for (Orders o : orders) {
                                totalAmount += o.getTotalAmount();
                            }
                        }
                    %>
                    <h3>$<%= String.format("%.2f", totalAmount) %></h3>
                    <p>Total Spent</p>
                </div>
            </div>
            <div class="stat-card">
                <div class="stat-icon stat-3">✅</div>
                <div class="stat-info">
                    <%
                        int completedOrders = 0;
                        if (orders != null) {
                            for (Orders o : orders) {
                                if ("Completed".equalsIgnoreCase(o.getStatus().toString())) {
                                    completedOrders++;
                                }
                            }
                        }
                    %>
                    <h3><%= completedOrders %></h3>
                    <p>Completed Orders</p>
                </div>
            </div>
        </div>
        
        <div class="orders-container">
            <div class="table-header">
                <h3>Your Orders</h3>
                <div class="search-filter">
                    <input type="text" placeholder="Search orders..." id="searchInput">
                    <select id="statusFilter">
                        <option value="all">All Status</option>
                        <option value="completed">Completed</option>
                        <option value="pending">Pending</option>
                        <option value="cancelled">Cancelled</option>
                    </select>
                </div>
            </div>
            
            <table class="orders-table">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Food Item</th>
                        <th>Quantity</th>
                        <th>Total Amount</th>
                        <th>Order Date</th>
                        <th>Pickup Time</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (orders != null && !orders.isEmpty()) {
                            for (Orders o : orders) {
                                FoodItems item = foodMap.get(o.getFoodItemId());
                                String statusClass = "";
                                if ("Completed".equalsIgnoreCase(o.getStatus().toString())) {
                                    statusClass = "status-completed";
                                } else if ("Pending".equalsIgnoreCase(o.getStatus().toString())) {
                                    statusClass = "status-pending";
                                } else if ("Cancelled".equalsIgnoreCase(o.getStatus().toString())) {
                                    statusClass = "status-cancelled";
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
                        <td><%= o.getQuantity() %></td>
                        <td>$<%= o.getTotalAmount() %></td>
                        <td><%= o.getOrderDate() %></td>
                        <td><%= o.getPickupTime() %></td>
                        <td><span class="status-badge <%= statusClass %>"><%= o.getStatus() %></span></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7">
                            <div class="no-orders">
                                <div class="no-orders-icon">📭</div>
                                <h3>No orders found</h3>
                                <p>You haven't placed any orders yet.</p>
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

    <script>
        // Simple search and filter functionality
        document.addEventListener('DOMContentLoaded', function() {
            const searchInput = document.getElementById('searchInput');
            const statusFilter = document.getElementById('statusFilter');
            const tableRows = document.querySelectorAll('.orders-table tbody tr');
            
            function filterOrders() {
                const searchTerm = searchInput.value.toLowerCase();
                const statusValue = statusFilter.value;
                
                tableRows.forEach(row => {
                    if (row.querySelector('.no-orders')) return;
                    
                    const foodItem = row.cells[1].textContent.toLowerCase();
                    const status = row.cells[6].textContent.toLowerCase();
                    
                    const matchesSearch = foodItem.includes(searchTerm);
                    const matchesStatus = statusValue === 'all' || status.includes(statusValue);
                    
                    if (matchesSearch && matchesStatus) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                });
            }
            
            searchInput.addEventListener('input', filterOrders);
            statusFilter.addEventListener('change', filterOrders);
        });
    </script>
</body>
</html>
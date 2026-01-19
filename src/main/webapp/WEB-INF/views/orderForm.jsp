<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.heramb.model.FoodItems" %>
<%
    FoodItems item = (FoodItems) session.getAttribute("foodItem");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order <%= item.getName() %> - FoodSave</title>
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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            flex: 1;
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
        
        .back-link {
            display: inline-flex;
            align-items: center;
            gap: 5px;
            color: var(--primary);
            text-decoration: none;
            margin-bottom: 20px;
            font-weight: 500;
            transition: color 0.3s;
        }
        
        .back-link:hover {
            color: var(--primary-dark);
        }
        
        .order-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 40px;
            margin-bottom: 40px;
        }
        
        @media (max-width: 768px) {
            .order-container {
                grid-template-columns: 1fr;
            }
        }
        
        .food-details {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
        }
        
        .food-image {
            width: 200px;
            height: 200px;
            border-radius: 10px;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 80px;
            margin-bottom: 20px;
            color: var(--primary);
        }
        
        .food-name {
            font-size: 28px;
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .food-description {
            color: var(--gray);
            margin-bottom: 20px;
            max-width: 300px;
        }
        
        .food-stats {
            display: flex;
            gap: 20px;
            margin-top: 20px;
        }
        
        .stat {
            text-align: center;
        }
        
        .stat-value {
            font-size: 24px;
            font-weight: 600;
            color: var(--primary);
        }
        
        .stat-label {
            font-size: 14px;
            color: var(--gray);
        }
        
        .order-form-container {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        
        .form-title {
            font-size: 24px;
            font-weight: 600;
            margin-bottom: 20px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--light-gray);
            color: var(--dark);
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
        }
        
        .form-control {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid var(--light-gray);
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        
        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(76, 175, 80, 0.1);
        }
        
        .quantity-controls {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .quantity-btn {
            width: 40px;
            height: 40px;
            border: 1px solid var(--light-gray);
            background: white;
            border-radius: 5px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .quantity-btn:hover {
            background: var(--light);
        }
        
        .quantity-input {
            width: 80px;
            text-align: center;
            padding: 10px;
        }
        
        .availability-info {
            margin-top: 5px;
            font-size: 14px;
            color: var(--gray);
        }
        
        .highlight {
            color: var(--primary);
            font-weight: 600;
        }
        
        .warning {
            color: var(--warning);
            font-weight: 500;
        }
        
        .btn {
            display: inline-block;
            padding: 14px 28px;
            background: var(--primary);
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
            text-align: center;
            width: 100%;
            margin-top: 10px;
        }
        
        .btn:hover {
            background: var(--primary-dark);
            transform: translateY(-2px);
        }
        
        .btn:active {
            transform: translateY(0);
        }
        
        .benefits {
            background: white;
            border-radius: 10px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            padding: 30px;
            margin-top: 30px;
        }
        
        .benefits-title {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: var(--dark);
        }
        
        .benefits-list {
            list-style: none;
        }
        
        .benefits-list li {
            padding: 10px 0;
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .benefit-icon {
            width: 24px;
            height: 24px;
            background: var(--primary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 12px;
        }
        
        footer {
            text-align: center;
            padding: 20px;
            color: var(--gray);
            font-size: 14px;
            margin-top: 40px;
            border-top: 1px solid var(--light-gray);
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 15px;
            }
            
            .nav-links {
                text-align: center;
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
                <a href="<%= request.getContextPath() %>/dashboard">Dashboard</a>
                <a href="<%= request.getContextPath() %>/foodItems">Available Food</a>
                <a href="<%= request.getContextPath() %>/orderHistory">Order History</a>
                <a href="<%= request.getContextPath() %>/profile">Profile</a>
            </div>
        </div>
    </header>
    
    <div class="container">
        <a href="customerDashboard" class="back-link">← Back to Available Food</a>
        
        <div class="order-container">
            <div class="food-details">
                <div class="food-image">
                    <% 
                        // Simple icon selection based on food category
                        String foodIcon = "🍕";
                        if (item.getName().toLowerCase().contains("salad") || item.getName().toLowerCase().contains("vegetable")) {
                            foodIcon = "🥗";
                        } else if (item.getName().toLowerCase().contains("burger") || item.getName().toLowerCase().contains("sandwich")) {
                            foodIcon = "🍔";
                        } else if (item.getName().toLowerCase().contains("pasta") || item.getName().toLowerCase().contains("noodle")) {
                            foodIcon = "🍝";
                        } else if (item.getName().toLowerCase().contains("sushi")) {
                            foodIcon = "🍣";
                        } else if (item.getName().toLowerCase().contains("dessert") || item.getName().toLowerCase().contains("cake")) {
                            foodIcon = "🍰";
                        }
                    %>
                    <%= foodIcon %>
                </div>
                <h1 class="food-name"><%= item.getName() %></h1>
                <p class="food-description">Freshly prepared and ready for pickup. Help reduce food waste by ordering this item.</p>
                
                <div class="food-stats">
                    <div class="stat">
                        <div class="stat-value"><%= item.getQuantity() %></div>
                        <div class="stat-label">Available</div>
                    </div>
                </div>
            </div>
            
            <div class="order-form-container">
                <h2 class="form-title">Place Your Order</h2>
                <form action="<%= request.getContextPath() %>/placeOrder" method="post" id="orderForm">
                    <input type="hidden" name="foodItemId" value="<%= item.getId() %>">
                    
                    <div class="form-group">
                        <label for="quantity">Quantity</label>
                        <div class="quantity-controls">
                            <button type="button" class="quantity-btn" id="decreaseQty">-</button>
                            <input type="number" id="quantity" name="quantity" class="form-control quantity-input" 
                                   min="1" max="<%= item.getQuantity() %>" value="1" required>
                            <button type="button" class="quantity-btn" id="increaseQty">+</button>
                        </div>
                        <div class="availability-info">
                            <span class="highlight"><%= item.getQuantity() %></span> items available
                            <% if (item.getQuantity() < 10) { %>
                                <span class="warning"> - Limited availability!</span>
                            <% } %>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <label for="pickupTime">Pickup Time</label>
                        <input type="datetime-local" id="pickupTime" name="pickupTime" class="form-control" required>
                        <div class="availability-info">Please select a time within the next 24 hours</div>
                    </div>
                    
                    <button type="submit" class="btn">Place Order</button>
                </form>
            </div>
        </div>
        
        <div class="benefits">
            <h3 class="benefits-title">Why order with FoodSave?</h3>
            <ul class="benefits-list">
                <li>
                    <div class="benefit-icon">✓</div>
                    <div>Help reduce food waste in your community</div>
                </li>
                <li>
                    <div class="benefit-icon">✓</div>
                    <div>Get quality food at great prices</div>
                </li>
                <li>
                    <div class="benefit-icon">✓</div>
                    <div>Support local businesses and sustainability</div>
                </li>
                <li>
                    <div class="benefit-icon">✓</div>
                    <div>Convenient pickup at your chosen time</div>
                </li>
            </ul>
        </div>
    </div>
    
    <footer>
        <div class="container">
            <p>© 2023 FoodSave. All rights reserved. | Reducing food waste, one order at a time.</p>
        </div>
    </footer>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const quantityInput = document.getElementById('quantity');
            const decreaseBtn = document.getElementById('decreaseQty');
            const increaseBtn = document.getElementById('increaseQty');
            const totalAmount = document.getElementById('totalAmount');
            
            // Set minimum pickup time to current time
            const now = new Date();
            const minDate = now.toISOString().slice(0, 16);
            document.getElementById('pickupTime').min = minDate;
            
            // Set default pickup time to 1 hour from now
            const defaultTime = new Date(now.getTime() + 60 * 60 * 1000);
            document.getElementById('pickupTime').value = defaultTime.toISOString().slice(0, 16);
            
            // Update total amount when quantity changes
            function updateTotal() {
                const quantity = parseInt(quantityInput.value);
                const total = (pricePerItem * quantity).toFixed(2);
                totalAmount.textContent = '$' + total;
            }
            
            // Quantity controls
            decreaseBtn.addEventListener('click', function() {
                let currentValue = parseInt(quantityInput.value);
                if (currentValue > 1) {
                    quantityInput.value = currentValue - 1;
                    updateTotal();
                }
            });
            
            increaseBtn.addEventListener('click', function() {
                let currentValue = parseInt(quantityInput.value);
                const maxValue = parseInt(quantityInput.max);
                if (currentValue < maxValue) {
                    quantityInput.value = currentValue + 1;
                    updateTotal();
                }
            });
            
            quantityInput.addEventListener('input', updateTotal);
            
            // Form validation
            document.getElementById('orderForm').addEventListener('submit', function(e) {
                const quantity = parseInt(quantityInput.value);
                const maxQuantity = parseInt(quantityInput.max);
                const pickupTime = new Date(document.getElementById('pickupTime').value);
                const now = new Date();
                
                if (quantity < 1 || quantity > maxQuantity) {
                    e.preventDefault();
                    alert('Please enter a valid quantity between 1 and ' + maxQuantity);
                    return;
                }
                
                if (pickupTime <= now) {
                    e.preventDefault();
                    alert('Please select a future pickup time');
                    return;
                }
            });
        });
    </script>
</body>
</html>
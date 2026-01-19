<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Waiting for Approval - FoodSave</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
            --shadow: 0 5px 15px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }
        
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Open Sans', sans-serif;
            color: #333;
            line-height: 1.6;
            background-color: var(--light);
            overflow-x: hidden;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        
        .container {
            width: 100%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 15px;
        }
        
        /* Header & Navigation */
        header {
            background-color: rgba(255, 255, 255, 0.95);
            box-shadow: var(--shadow);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
            transition: var(--transition);
        }
        
        header.scrolled {
            padding: 10px 0;
            background-color: rgba(255, 255, 255, 0.98);
        }
        
        .header-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
        }
        
        .logo {
            display: flex;
            align-items: center;
            text-decoration: none;
        }
        
        .logo-icon {
            width: 45px;
            height: 45px;
            background: var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: bold;
            font-size: 20px;
            margin-right: 10px;
            transition: var(--transition);
        }
        
        .logo:hover .logo-icon {
            transform: rotate(15deg) scale(1.1);
            background: var(--secondary);
        }
        
        .logo-text {
            font-family: 'Poppins', sans-serif;
            font-size: 24px;
            font-weight: 700;
            color: var(--dark);
        }
        
        .logo-text span {
            color: var(--primary);
        }
        
        .nav-menu {
            display: flex;
            list-style: none;
        }
        
        .nav-item {
            margin-left: 30px;
            position: relative;
        }
        
        .nav-link {
            text-decoration: none;
            color: var(--dark);
            font-weight: 500;
            font-size: 16px;
            transition: var(--transition);
            padding: 5px 0;
            position: relative;
        }
        
        .nav-link:after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: 0;
            left: 0;
            background-color: var(--primary);
            transition: var(--transition);
        }
        
        .nav-link:hover {
            color: var(--primary);
        }
        
        .nav-link:hover:after {
            width: 100%;
        }
        
        .auth-buttons {
            display: flex;
            align-items: center;
        }
        
        .btn {
            padding: 10px 20px;
            border-radius: 50px;
            font-weight: 500;
            text-decoration: none;
            transition: var(--transition);
            display: inline-block;
            cursor: pointer;
            border: none;
            font-family: 'Open Sans', sans-serif;
        }
        
        .btn-login {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
            margin-right: 15px;
        }
        
        .btn-login:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.2);
        }
        
        .btn-signup {
            background: var(--secondary);
            color: white;
            box-shadow: 0 4px 10px rgba(255, 107, 53, 0.25);
        }
        
        .btn-signup:hover {
            background: #e55a2b;
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(255, 107, 53, 0.35);
        }
        
        .hamburger {
            display: none;
            cursor: pointer;
        }
        
        .bar {
            display: block;
            width: 25px;
            height: 3px;
            margin: 5px auto;
            transition: var(--transition);
            background-color: var(--dark);
        }
        
        /* Waiting Section */
        .waiting-section {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 160px 0 100px;
            text-align: center;
        }
        
        .waiting-content {
            max-width: 700px;
            margin: 0 auto;
            padding: 40px;
            background: white;
            border-radius: 20px;
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }
        
        .waiting-content:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--warning);
        }
        
        .waiting-icon {
            font-size: 6rem;
            color: var(--warning);
            margin-bottom: 30px;
            animation: pulse 2s infinite;
        }
        
        .waiting-title {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            color: var(--dark);
            margin-bottom: 20px;
        }
        
        .waiting-subtitle {
            font-size: 1.3rem;
            color: var(--gray);
            margin-bottom: 30px;
        }
        
        .waiting-description {
            color: var(--gray);
            margin-bottom: 40px;
            line-height: 1.8;
            text-align: left;
        }
        
        .progress-container {
            margin: 40px 0;
            background: var(--light-gray);
            border-radius: 10px;
            height: 10px;
            overflow: hidden;
        }
        
        .progress-bar {
            height: 100%;
            background: var(--warning);
            width: 70%;
            border-radius: 10px;
            animation: progress-pulse 3s infinite;
        }
        
        .status-info {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
            color: var(--gray);
            font-size: 0.9rem;
        }
        
        .next-steps {
            background: rgba(255, 193, 7, 0.1);
            border-radius: 10px;
            padding: 20px;
            margin: 30px 0;
            text-align: left;
        }
        
        .next-steps h3 {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        
        .next-steps h3 i {
            margin-right: 10px;
            color: var(--warning);
        }
        
        .next-steps ul {
            list-style: none;
            padding-left: 0;
        }
        
        .next-steps li {
            margin-bottom: 10px;
            padding-left: 25px;
            position: relative;
        }
        
        .next-steps li:before {
            content: '✓';
            position: absolute;
            left: 0;
            color: var(--warning);
            font-weight: bold;
        }
        
        .waiting-actions {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: 30px;
        }
        
        .btn-waiting-primary {
            background: var(--primary);
            color: white;
            padding: 12px 30px;
            font-size: 1.1rem;
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.2);
        }
        
        .btn-waiting-primary:hover {
            background: #24704a;
            transform: translateY(-3px);
            box-shadow: 0 8px 20px rgba(46, 139, 87, 0.3);
        }
        
        .btn-waiting-secondary {
            background: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
            padding: 12px 30px;
            font-size: 1.1rem;
        }
        
        .btn-waiting-secondary:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-3px);
        }
        
        .application-details {
            margin-top: 30px;
            padding: 20px;
            background: var(--light);
            border-radius: 10px;
            text-align: left;
        }
        
        .application-details h3 {
            font-family: 'Poppins', sans-serif;
            color: var(--dark);
            margin-bottom: 15px;
            display: flex;
            align-items: center;
        }
        
        .application-details h3 i {
            margin-right: 10px;
            color: var(--primary);
        }
        
        .detail-item {
            display: flex;
            margin-bottom: 10px;
        }
        
        .detail-label {
            font-weight: 600;
            width: 150px;
            color: var(--dark);
        }
        
        .detail-value {
            color: var(--gray);
            flex: 1;
        }
        
        /* Footer */
        footer {
            background: var(--dark);
            color: white;
            padding: 70px 0 20px;
            margin-top: auto;
        }
        
        .footer-content {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 40px;
            margin-bottom: 50px;
        }
        
        .footer-column {
            flex: 1;
            min-width: 250px;
        }
        
        .footer-logo {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .footer-logo .logo-icon {
            background: white;
            color: var(--primary);
        }
        
        .footer-logo-text {
            font-family: 'Poppins', sans-serif;
            font-size: 24px;
            font-weight: 700;
            color: white;
            margin-left: 10px;
        }
        
        .footer-logo-text span {
            color: var(--accent);
        }
        
        .footer-description {
            margin-bottom: 20px;
            opacity: 0.8;
            line-height: 1.6;
        }
        
        .social-icons {
            display: flex;
            gap: 15px;
        }
        
        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-decoration: none;
            transition: var(--transition);
        }
        
        .social-icon:hover {
            background: var(--primary);
            transform: translateY(-3px);
        }
        
        .footer-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.2rem;
            margin-bottom: 20px;
            position: relative;
            padding-bottom: 10px;
        }
        
        .footer-title:after {
            content: '';
            position: absolute;
            width: 40px;
            height: 2px;
            background: var(--accent);
            bottom: 0;
            left: 0;
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-link {
            margin-bottom: 12px;
        }
        
        .footer-link a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: var(--transition);
            display: inline-block;
        }
        
        .footer-link a:hover {
            color: var(--accent);
            transform: translateX(5px);
        }
        
        .footer-newsletter p {
            margin-bottom: 20px;
            opacity: 0.8;
        }
        
        .newsletter-form {
            display: flex;
            gap: 10px;
        }
        
        .newsletter-input {
            flex: 1;
            padding: 12px 15px;
            border: none;
            border-radius: 50px;
            font-family: 'Open Sans', sans-serif;
        }
        
        .newsletter-btn {
            padding: 12px 20px;
            background: var(--accent);
            color: white;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .newsletter-btn:hover {
            background: #3bbfb7;
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 20px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            opacity: 0.7;
        }
        
        /* Animations */
        @keyframes pulse {
            0% {
                transform: scale(1);
                opacity: 1;
            }
            50% {
                transform: scale(1.05);
                opacity: 0.8;
            }
            100% {
                transform: scale(1);
                opacity: 1;
            }
        }
        
        @keyframes progress-pulse {
            0% {
                opacity: 1;
            }
            50% {
                opacity: 0.7;
            }
            100% {
                opacity: 1;
            }
        }
        
        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
        
        /* Responsive Design */
        @media (max-width: 992px) {
            .nav-menu {
                position: fixed;
                left: -100%;
                top: 80px;
                flex-direction: column;
                background-color: white;
                width: 100%;
                text-align: center;
                transition: 0.3s;
                box-shadow: 0 10px 27px rgba(0, 0, 0, 0.05);
                padding: 20px 0;
            }
            
            .nav-menu.active {
                left: 0;
            }
            
            .nav-item {
                margin: 20px 0;
            }
            
            .hamburger {
                display: block;
            }
            
            .hamburger.active .bar:nth-child(2) {
                opacity: 0;
            }
            
            .hamburger.active .bar:nth-child(1) {
                transform: translateY(8px) rotate(45deg);
            }
            
            .hamburger.active .bar:nth-child(3) {
                transform: translateY(-8px) rotate(-45deg);
            }
            
            .auth-buttons {
                display: none;
            }
            
            .waiting-title {
                font-size: 2.2rem;
            }
            
            .waiting-subtitle {
                font-size: 1.2rem;
            }
        }
        
        @media (max-width: 768px) {
            .waiting-section {
                padding: 140px 0 80px;
            }
            
            .waiting-content {
                padding: 30px 20px;
            }
            
            .waiting-icon {
                font-size: 4rem;
            }
            
            .waiting-title {
                font-size: 2rem;
            }
            
            .waiting-subtitle {
                font-size: 1.1rem;
            }
            
            .waiting-actions {
                flex-direction: column;
                align-items: center;
            }
            
            .detail-item {
                flex-direction: column;
                margin-bottom: 15px;
            }
            
            .detail-label {
                width: 100%;
                margin-bottom: 5px;
            }
            
            .footer-column {
                min-width: 100%;
            }
            
            .newsletter-form {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <!-- Header & Navigation -->
    <header id="header">
        <div class="container header-container">
            <a href="index" class="logo">
                <div class="logo-icon">FW</div>
                <div class="logo-text">Food<span>Save</span></div>
            </a>
            
            <ul class="nav-menu">
                <li class="nav-item"><a href="index" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="hbusiness" class="nav-link">Businesses</a></li>
                <li class="nav-item"><a href="working" class="nav-link">How It Works</a></li>
                <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
            </ul>
            
            <div class="hamburger" id="hamburger">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
        </div>
    </header>

    <!-- Waiting Section -->
    <section class="waiting-section">
        <div class="container">
            <div class="waiting-content">
                <div class="waiting-icon">
                    <i class="fas fa-hourglass-half"></i>
                </div>
                <h1 class="waiting-title">Application Under Review</h1>
                <h2 class="waiting-subtitle">Thank you for your submission!</h2>
                
                <p class="waiting-description">
                    Your application to join FoodSave is currently being reviewed by our team. 
                    We're carefully evaluating your information to ensure the best experience 
                    for both our business partners and customers. This process typically takes 
                    1-3 business days.
                </p>
                
                <div class="progress-container">
                    <div class="progress-bar"></div>
                </div>
                
                <div class="status-info">
                    <span>Submitted</span>
                    <span>Under Review</span>
                    <span>Approved</span>
                </div>
                
                <div class="next-steps">
                    <h3><i class="fas fa-list-check"></i> What Happens Next?</h3>
                    <ul>
                        <li>Our team will verify your business information</li>
                        <li>We'll review your food safety practices</li>
                        <li>You'll receive an email notification once approved</li>
                        <li>After approval, you can start listing surplus food</li>
                    </ul>
                </div>
                
                <div class="application-details">
                    <h3><i class="fas fa-file-lines"></i> Application Details</h3>
                    <div class="detail-item">
                        <div class="detail-label">Application ID:</div>
                        <div class="detail-value">FS-APP-<%= request.getParameter("appId") != null ? request.getParameter("appId") : "2023001" %></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Submitted On:</div>
                        <div class="detail-value"><%= new java.text.SimpleDateFormat("MMMM dd, yyyy").format(new java.util.Date()) %></div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Estimated Review:</div>
                        <div class="detail-value">2-3 business days</div>
                    </div>
                    <div class="detail-item">
                        <div class="detail-label">Contact Email:</div>
                        <div class="detail-value"><%= request.getParameter("email") != null ? request.getParameter("email") : "your-email@example.com" %></div>
                    </div>
                </div>
                
                <div class="waiting-actions">
                    <a href="contact" class="btn btn-waiting-primary">
                        <i class="fas fa-question-circle"></i> Contact Support
                    </a>
                    <a href="index" class="btn btn-waiting-secondary">
                        <i class="fas fa-home"></i> Back to Homepage
                    </a>
                    <button onclick="location.reload()" class="btn btn-waiting-secondary">
                        <i class="fas fa-redo"></i> Check Status
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <div class="footer-logo">
                        <div class="logo-icon">FW</div>
                        <div class="footer-logo-text">Food<span>Save</span></div>
                    </div>
                    <p class="footer-description">Reducing food waste by connecting surplus food from businesses with customers at discounted prices.</p>
                    <div class="social-icons">
                        <a href="#" class="social-icon"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Quick Links</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="index">Home</a></li>
                        <li class="footer-link"><a href="about">About Us</a></li>
                        <li class="footer-link"><a href="working">How It Works</a></li>
                        <li class="footer-link"><a href="hbusiness">For Businesses</a></li>
                        <li class="footer-link"><a href="contact">Contact Us</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Support</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="#">FAQ</a></li>
                        <li class="footer-link"><a href="#">Privacy Policy</a></li>
                        <li class="footer-link"><a href="#">Terms of Service</a></li>
                        <li class="footer-link"><a href="#">Help Center</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Get In Touch</h3>
                    <p>Have questions about your application? Our support team is here to help.</p>
                    <div class="contact-info" style="margin-top: 15px;">
                        <p><i class="fas fa-envelope"></i> support@foodsave.com</p>
                        <p><i class="fas fa-phone"></i> +1 (555) 123-FOOD</p>
                        <p><i class="fas fa-clock"></i> Mon-Fri, 9am-5pm EST</p>
                    </div>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2025 FoodSave. All rights reserved. | Together we can reduce food waste.</p>
            </div>
        </div>
    </footer>

    <script>
        // Toggle Mobile Menu
        const hamburger = document.getElementById("hamburger");
        const navMenu = document.querySelector(".nav-menu");
        const header = document.getElementById("header");
        
        hamburger.addEventListener("click", () => {
            hamburger.classList.toggle("active");
            navMenu.classList.toggle("active");
        });
        
        document.querySelectorAll(".nav-link").forEach(n => n.addEventListener("click", () => {
            hamburger.classList.remove("active");
            navMenu.classList.remove("active");
        }));
        
        // Header scroll effect
        window.addEventListener("scroll", () => {
            if (window.scrollY > 50) {
                header.classList.add("scrolled");
            } else {
                header.classList.remove("scrolled");
            }
        });
        
        // Simulate progress bar movement
        const progressBar = document.querySelector('.progress-bar');
        let progress = 70;
        
        function animateProgress() {
            progress = progress < 85 ? progress + 1 : 70;
            progressBar.style.width = progress + '%';
        }
        
        setInterval(animateProgress, 2000);
        
        // Add some interactive elements
        const waitingIcon = document.querySelector('.waiting-icon');
        waitingIcon.addEventListener('mouseover', function() {
            this.style.transform = 'scale(1.1)';
            this.style.transition = 'transform 0.3s ease';
        });
        
        waitingIcon.addEventListener('mouseout', function() {
            this.style.transform = 'scale(1)';
        });
        
        // Auto-check status after 30 seconds (simulation)
        setTimeout(() => {
            console.log("Status check simulated - application still under review");
        }, 30000);
    </script>
</body>
</html>
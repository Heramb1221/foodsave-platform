<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - FoodSave</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2E8B57;
            --primary-light: #4daa72;
            --secondary: #FF6B35;
            --secondary-light: #ff8c5d;
            --accent: #4ECDC4;
            --light: #F7F9FC;
            --dark: #2D3A3A;
            --success: #28a745;
            --warning: #ffc107;
            --danger: #dc3545;
            --gray: #6c757d;
            --light-gray: #e9ecef;
            --transition: all 0.4s ease;
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
            background-color: #f5f7f9;
            overflow-x: hidden;
            min-height: 100vh;
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
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
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
        
        /* Hero Section */
        .contact-hero {
            padding: 180px 0 100px;
            background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%, rgba(78, 205, 196, 0.8) 100%);
            color: white;
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        
        .contact-hero:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,128L48,117.3C96,107,192,85,288,112C384,139,480,213,576,218.7C672,224,768,160,864,138.7C960,117,1056,139,1152,149.3C1248,160,1344,160,1392,160L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-size: cover;
            background-position: center;
        }
        
        .hero-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .hero-title {
            font-family: 'Poppins', sans-serif;
            font-size: 3.5rem;
            font-weight: 700;
            margin-bottom: 20px;
            line-height: 1.2;
            animation: fadeInUp 1s ease;
        }
        
        .hero-subtitle {
            font-size: 1.25rem;
            margin-bottom: 40px;
            opacity: 0.9;
            animation: fadeInUp 1s ease 0.2s;
            animation-fill-mode: both;
        }
        
        /* Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
        /* Section Title */
        .section-title {
            text-align: center;
            margin-bottom: 60px;
        }
        
        .section-title h2 {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            color: var(--dark);
            margin-bottom: 20px;
            position: relative;
            display: inline-block;
        }
        
        .section-title h2:after {
            content: '';
            position: absolute;
            width: 80px;
            height: 3px;
            background: var(--primary);
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
        }
        
        .section-title p {
            color: var(--gray);
            max-width: 600px;
            margin: 0 auto;
        }
        
        /* Contact Section */
        .contact-section {
            padding: 100px 0;
            background: white;
        }
        
        .contact-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 50px;
            position: relative;
        }
        
        .contact-info {
            padding-right: 30px;
        }
        
        .contact-info-title {
            font-family: 'Poppins', sans-serif;
            font-size: 2rem;
            margin-bottom: 30px;
            color: var(--dark);
        }
        
        .contact-info-text {
            color: var(--gray);
            line-height: 1.8;
            margin-bottom: 40px;
        }
        
        .contact-methods {
            margin-bottom: 40px;
        }
        
        .contact-method {
            display: flex;
            align-items: flex-start;
            margin-bottom: 25px;
            transition: var(--transition);
            padding: 15px;
            border-radius: var(--card-radius);
        }
        
        .contact-method:hover {
            background: rgba(46, 139, 87, 0.05);
            transform: translateX(10px);
        }
        
        .contact-icon {
            width: 60px;
            height: 60px;
            background: var(--light);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 24px;
            margin-right: 20px;
            flex-shrink: 0;
            transition: var(--transition);
        }
        
        .contact-method:hover .contact-icon {
            background: var(--primary);
            color: white;
            transform: scale(1.1) rotate(5deg);
        }
        
        .contact-details h4 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.2rem;
            margin-bottom: 8px;
            color: var(--dark);
        }
        
        .contact-details p {
            color: var(--gray);
            line-height: 1.6;
        }
        
        .contact-details a {
            color: var(--gray);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .contact-details a:hover {
            color: var(--primary);
        }
        
        .social-links {
            display: flex;
            gap: 15px;
        }
        
        .social-link {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            text-decoration: none;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }
        
        .social-link:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient-primary);
            opacity: 0;
            transition: var(--transition);
        }
        
        .social-link:hover:before {
            opacity: 1;
        }
        
        .social-link i {
            position: relative;
            z-index: 1;
        }
        
        .social-link:hover {
            color: white;
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(46, 139, 87, 0.3);
        }
        
        /* Contact Form */
        .contact-form-container {
            background: var(--light);
            padding: 40px;
            border-radius: var(--card-radius);
            box-shadow: var(--shadow);
            position: relative;
            overflow: hidden;
        }
        
        .contact-form-container:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient-primary);
        }
        
        .form-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.8rem;
            margin-bottom: 30px;
            color: var(--dark);
            text-align: center;
        }
        
        .contact-form {
            position: relative;
        }
        
        .form-group {
            margin-bottom: 25px;
            position: relative;
        }
        
        .form-label {
            display: block;
            margin-bottom: 8px;
            font-weight: 500;
            color: var(--dark);
            transition: var(--transition);
        }
        
        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid var(--light-gray);
            border-radius: 50px;
            font-family: 'Open Sans', sans-serif;
            font-size: 16px;
            transition: var(--transition);
            background: white;
        }
        
        .form-input:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(46, 139, 87, 0.2);
        }
        
        textarea.form-input {
            border-radius: 20px;
            min-height: 150px;
            resize: vertical;
        }
        
        .form-input:focus + .input-icon {
            color: var(--primary);
        }
        
        .input-icon {
            position: absolute;
            right: 20px;
            top: 45px;
            color: var(--gray);
            transition: var(--transition);
        }
        
        .btn-submit {
            background: var(--gradient-primary);
            color: white;
            padding: 15px 30px;
            font-size: 1.1rem;
            font-weight: 600;
            width: 100%;
            border: none;
            border-radius: 50px;
            cursor: pointer;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            z-index: 1;
        }
        
        .btn-submit:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: var(--gradient-secondary);
            opacity: 0;
            transition: var(--transition);
            z-index: -1;
        }
        
        .btn-submit:hover:before {
            opacity: 1;
        }
        
        .btn-submit:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(46, 139, 87, 0.3);
        }
        
        .btn-submit:active {
            transform: translateY(0);
        }
        
        /* Map Section */
        .map-section {
            padding: 0 0 100px;
        }
        
        .map-container {
            height: 450px;
            border-radius: var(--card-radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            position: relative;
        }
        
        .map-overlay {
            position: absolute;
            top: 20px;
            left: 20px;
            background: white;
            padding: 20px;
            border-radius: var(--card-radius);
            box-shadow: var(--shadow);
            max-width: 300px;
            z-index: 10;
            animation: pulse 2s infinite;
        }
        
        .map-overlay h3 {
            font-family: 'Poppins', sans-serif;
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .map-overlay p {
            color: var(--gray);
            margin-bottom: 5px;
            font-size: 0.9rem;
        }
        
        .map-frame {
            width: 100%;
            height: 100%;
            border: none;
        }
        
        /* FAQ Section */
        .faq-section {
            padding: 100px 0;
            background: var(--light);
        }
        
        .faq-container {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .faq-item {
            background: white;
            border-radius: var(--card-radius);
            margin-bottom: 20px;
            box-shadow: var(--shadow);
            overflow: hidden;
            transition: var(--transition);
        }
        
        .faq-item:hover {
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
        }
        
        .faq-question {
            padding: 25px;
            cursor: pointer;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-family: 'Poppins', sans-serif;
            font-size: 1.2rem;
            font-weight: 500;
            color: var(--dark);
            transition: var(--transition);
        }
        
        .faq-question:hover {
            color: var(--primary);
        }
        
        .faq-icon {
            transition: var(--transition);
        }
        
        .faq-item.active .faq-icon {
            transform: rotate(180deg);
            color: var(--primary);
        }
        
        .faq-answer {
            padding: 0 25px;
            max-height: 0;
            overflow: hidden;
            transition: max-height 0.5s ease, padding 0.5s ease;
            color: var(--gray);
            line-height: 1.6;
        }
        
        .faq-item.active .faq-answer {
            max-height: 300px;
            padding: 0 25px 25px;
        }
        
        /* CTA Section */
        .cta-section {
            padding: 100px 0;
            background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%, rgba(78, 205, 196, 0.8) 100%);
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        
        .cta-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,128L48,117.3C96,107,192,85,288,112C384,139,480,213,576,218.7C672,224,768,160,864,138.7C960,117,1056,139,1152,149.3C1248,160,1344,160,1392,160L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-size: cover;
            background-position: center;
        }
        
        .cta-content {
            position: relative;
            z-index: 1;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .cta-title {
            font-family: 'Poppins', sans-serif;
            font-size: 2.5rem;
            margin-bottom: 20px;
        }
        
        .cta-text {
            font-size: 1.1rem;
            margin-bottom: 40px;
            opacity: 0.9;
        }
        
        .cta-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        
        .btn-cta-primary {
            background: white;
            color: var(--primary);
            padding: 15px 30px;
            font-size: 1.1rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }
        
        .btn-cta-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        
        .btn-cta-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
            padding: 15px 30px;
            font-size: 1.1rem;
        }
        
        .btn-cta-secondary:hover {
            background: white;
            color: var(--primary);
            transform: translateY(-3px);
        }
        
        /* Footer */
        footer {
            background: var(--dark);
            color: white;
            padding: 70px 0 20px;
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
        
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        
        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(46, 139, 87, 0.4);
            }
            70% {
                box-shadow: 0 0 0 10px rgba(46, 139, 87, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(46, 139, 87, 0);
            }
        }
        
        @keyframes float {
            0% {
                transform: translateY(0px);
            }
            50% {
                transform: translateY(-10px);
            }
            100% {
                transform: translateY(0px);
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
            
            .contact-container {
                grid-template-columns: 1fr;
            }
            
            .contact-info {
                padding-right: 0;
            }
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .contact-form-container {
                padding: 30px 20px;
            }
            
            .map-overlay {
                position: relative;
                top: 0;
                left: 0;
                margin-bottom: 20px;
                max-width: 100%;
            }
            
            .cta-buttons {
                flex-direction: column;
                align-items: center;
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
        <div class="header-container">
            <a href="#" class="logo">
                <div class="logo-icon">FW</div>
                <div class="logo-text">Food<span>Save</span></div>
            </a>
            
            <ul class="nav-menu">
                <li class="nav-item"><a href="index" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="working" class="nav-link">How It Works</a></li>
                <li class="nav-item"><a href="hbusiness" class="nav-link">Businesses</a></li>
                <li class="nav-item"><a href="contact" class="nav-link active">Contact</a></li>
            </ul>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="contact-hero">
        <div class="container hero-content">
            <h1 class="hero-title">Get in Touch With FoodSave</h1>
            <p class="hero-subtitle">We'd love to hear from you. Reach out to us with questions, feedback, or partnership opportunities.</p>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact-section">
        <div class="container">
            <div class="contact-container">
                <div class="contact-info">
                    <h2 class="contact-info-title">Let's Start a Conversation</h2>
                    <p class="contact-info-text">Whether you're a business looking to reduce food waste or a customer with questions about our service, our team is here to help. We typically respond within 24 hours.</p>
                    
                    <div class="contact-methods">
                        <div class="contact-method">
                            <div class="contact-icon">
                                <i class="fas fa-map-marker-alt"></i>
                            </div>
                            <div class="contact-details">
                                <h4>Our Headquarters</h4>
                                <p>123 Sustainability Way<br>Eco City, EC 12345</p>
                            </div>
                        </div>
                        
                        <div class="contact-method">
                            <div class="contact-icon">
                                <i class="fas fa-phone"></i>
                            </div>
                            <div class="contact-details">
                                <h4>Phone</h4>
                                <p><a href="tel:+11234567890">+1 (123) 456-7890</a><br>Mon-Fri, 9am-5pm EST</p>
                            </div>
                        </div>
                        
                        <div class="contact-method">
                            <div class="contact-icon">
                                <i class="fas fa-envelope"></i>
                            </div>
                            <div class="contact-details">
                                <h4>Email</h4>
                                <p><a href="mailto:info@foodsave.com">info@foodsave.com</a><br>For general inquiries</p>
                            </div>
                        </div>
                    </div>
                    
                    <h4>Follow Us</h4>
                    <div class="social-links">
                        <a href="#" class="social-link"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-twitter"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="social-link"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                
                <div class="contact-form-container">
                    <h3 class="form-title">Send Us a Message</h3>
                    <form class="contact-form" id="contactForm">
                        <div class="form-group">
                            <label for="name" class="form-label">Full Name</label>
                            <input type="text" id="name" class="form-input" placeholder="Your name" required>
                            <i class="fas fa-user input-icon"></i>
                        </div>
                        
                        <div class="form-group">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" id="email" class="form-input" placeholder="Your email address" required>
                            <i class="fas fa-envelope input-icon"></i>
                        </div>
                        
                        <div class="form-group">
                            <label for="subject" class="form-label">Subject</label>
                            <input type="text" id="subject" class="form-input" placeholder="What is this regarding?" required>
                            <i class="fas fa-tag input-icon"></i>
                        </div>
                        
                        <div class="form-group">
                            <label for="message" class="form-label">Message</label>
                            <textarea id="message" class="form-input" placeholder="How can we help you?" required></textarea>
                            <i class="fas fa-comment input-icon"></i>
                        </div>
                        
                        <button type="submit" class="btn-submit">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Map Section -->
    <section class="map-section">
        <div class="container">
            <div class="map-container">
                <div class="map-overlay">
                    <h3>Visit Our Office</h3>
                    <p>123 Sustainability Way</p>
                    <p>Eco City, EC 12345</p>
                    <p>Open: Mon-Fri, 9am-5pm</p>
                </div>
                <iframe class="map-frame" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3023.621465758463!2d-74.00594938459418!3d40.712782679327256!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x89c25a1e1c2c0aab%3A0x47dc2d4e39b4b0b5!2sStatue%20of%20Liberty!5e0!3m2!1sen!2sus!4v1620233277125!5m2!1sen!2sus" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq-section">
        <div class="container">
            <div class="section-title">
                <h2>Frequently Asked Questions</h2>
                <p>Quick answers to common questions about FoodSave</p>
            </div>
            
            <div class="faq-container">
                <div class="faq-item">
                    <div class="faq-question">
                        How quickly do you respond to inquiries?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">
                        We typically respond to all inquiries within 24 hours during business days. For urgent matters, please call our customer service line.
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        What information should I include in my message?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">
                        Please include your name, contact information, and as many details as possible about your inquiry. If you're a business interested in partnering with us, include your business name and type.
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        Do you offer support for technical issues?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">
                        Yes, our technical support team is available to help with any app or website issues. Please describe the problem in detail and include screenshots if possible.
                    </div>
                </div>
                
                <div class="faq-item">
                    <div class="faq-question">
                        Can I schedule a meeting with your team?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">
                        Absolutely! After you submit your inquiry, our team will contact you to schedule a meeting at your convenience, either in person or virtually.
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2 class="cta-title">Join the FoodSave Movement Today</h2>
                <p class="cta-text">Be part of the solution to reduce food waste and create sustainable communities</p>
                <div class="cta-buttons">
                    <a href="index" class="btn btn-cta-primary">Sign Up as Business</a>
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
                    <p class="footer-description">Reducing food waste one meal at a time. Connecting businesses with customers to create sustainable communities.</p>
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
                        <li class="footer-link"><a href="business">For Businesses</a></li>
                        <li class="footer-link"><a href="contact">Contact</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Resources</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="#">Blog</a></li>
                        <li class="footer-link"><a href="#">Success Stories</a></li>
                        <li class="footer-link"><a href="#">Food Waste Facts</a></li>
                        <li class="footer-link"><a href="#">FAQ</a></li>
                        <li class="footer-link"><a href="#">Support Center</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Newsletter</h3>
                    <p>Subscribe to our newsletter to receive updates and tips on reducing food waste.</p>
                    <form class="newsletter-form">
                        <input type="email" class="newsletter-input" placeholder="Your email address">
                        <button type="submit" class="newsletter-btn">Subscribe</button>
                    </form>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2023 FoodSave. All rights reserved. | <a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a></p>
            </div>
        </div>
    </footer>

    <script>
        // Mobile Navigation
        const hamburger = document.getElementById('hamburger');
        const navMenu = document.querySelector('.nav-menu');
        
        hamburger.addEventListener('click', () => {
            hamburger.classList.toggle('active');
            navMenu.classList.toggle('active');
        });
        
        document.querySelectorAll('.nav-link').forEach(n => n.addEventListener('click', () => {
            hamburger.classList.remove('active');
            navMenu.classList.remove('active');
        }));
        
        // Header scroll effect
        const header = document.getElementById('header');
        window.addEventListener('scroll', () => {
            if (window.scrollY > 50) {
                header.classList.add('scrolled');
            } else {
                header.classList.remove('scrolled');
            }
        });
        
        // Form validation and submission
        const contactForm = document.getElementById('contactForm');
        
        contactForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            // Basic validation
            const nameInput = document.getElementById('name');
            const emailInput = document.getElementById('email');
            const subjectInput = document.getElementById('subject');
            const messageInput = document.getElementById('message');
            
            let isValid = true;
            
            if (!nameInput.value.trim()) {
                highlightError(nameInput);
                isValid = false;
            }
            
            if (!emailInput.value.trim() || !isValidEmail(emailInput.value)) {
                highlightError(emailInput);
                isValid = false;
            }
            
            if (!subjectInput.value.trim()) {
                highlightError(subjectInput);
                isValid = false;
            }
            
            if (!messageInput.value.trim()) {
                highlightError(messageInput);
                isValid = false;
            }
            
            if (isValid) {
                // Simulate form submission
                const submitBtn = contactForm.querySelector('.btn-submit');
                const originalText = submitBtn.textContent;
                
                submitBtn.textContent = 'Sending...';
                submitBtn.disabled = true;
                
                setTimeout(() => {
                    submitBtn.textContent = 'Message Sent!';
                    submitBtn.style.background = 'var(--success)';
                    
                    setTimeout(() => {
                        submitBtn.textContent = originalText;
                        submitBtn.disabled = false;
                        contactForm.reset();
                    }, 2000);
                }, 1500);
            }
        });
        
        function highlightError(input) {
            input.style.borderColor = 'var(--danger)';
            input.focus();
            
            setTimeout(() => {
                input.style.borderColor = '';
            }, 3000);
        }
        
        function isValidEmail(email) {
            const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            return re.test(email);
        }
        
        // FAQ accordion
        const faqItems = document.querySelectorAll('.faq-item');
        
        faqItems.forEach(item => {
            const question = item.querySelector('.faq-question');
            
            question.addEventListener('click', () => {
                // Close other open items
                faqItems.forEach(otherItem => {
                    if (otherItem !== item && otherItem.classList.contains('active')) {
                        otherItem.classList.remove('active');
                    }
                });
                
                // Toggle current item
                item.classList.toggle('active');
            });
        });
        
        // Animate contact methods on scroll
        const contactMethods = document.querySelectorAll('.contact-method');
        
        function animateOnScroll() {
            contactMethods.forEach((method, index) => {
                const methodTop = method.getBoundingClientRect().top;
                const windowHeight = window.innerHeight;
                
                if (methodTop < windowHeight * 0.85) {
                    setTimeout(() => {
                        method.style.opacity = '1';
                        method.style.transform = 'translateX(0)';
                    }, index * 200);
                }
            });
        }
        
        // Initialize styles for animation
        contactMethods.forEach(method => {
            method.style.opacity = '0';
            method.style.transform = 'translateX(-20px)';
            method.style.transition = 'opacity 0.5s ease, transform 0.5s ease';
        });
        
        window.addEventListener('scroll', animateOnScroll);
        window.addEventListener('load', animateOnScroll);
    </script>
</body>
</html>
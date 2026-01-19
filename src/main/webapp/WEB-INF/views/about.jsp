<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - FoodSave</title>
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
        
        .nav-link.active {
            color: var(--primary);
            font-weight: 600;
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
        
        .nav-link:hover:after,
        .nav-link.active:after {
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
        .about-hero {
            padding: 180px 0 100px;
            background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%, rgba(78, 205, 196, 0.8) 100%);
            color: white;
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        
        .about-hero:before {
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
        
        /* Mission Section */
        .mission-section {
            padding: 100px 0;
            background: white;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }
        
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
        
        .mission-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .mission-card {
            background: var(--light);
            border-radius: var(--card-radius);
            padding: 40px 30px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }
        
        .mission-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .mission-card:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient-primary);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.5s ease;
        }
        
        .mission-card:hover:before {
            transform: scaleX(1);
        }
        
        .mission-icon {
            width: 80px;
            height: 80px;
            background: rgba(46, 139, 87, 0.1);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 25px;
            color: var(--primary);
            font-size: 32px;
            transition: var(--transition);
        }
        
        .mission-card:hover .mission-icon {
            background: var(--primary);
            color: white;
            transform: scale(1.1) rotate(5deg);
        }
        
        .mission-card h3 {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--dark);
        }
        
        .mission-card p {
            color: var(--gray);
            line-height: 1.6;
        }
        
        /* Impact Section */
        .impact-section {
            padding: 100px 0;
            background: linear-gradient(to right, var(--primary-light), var(--accent));
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .impact-section:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,288L48,272C96,256,192,224,288,197.3C384,171,480,149,576,165.3C672,181,768,235,864,250.7C960,267,1056,245,1152,224C1248,203,1344,181,1392,170.7L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
            background-size: cover;
            background-position: center;
        }
        
        .impact-content {
            position: relative;
            z-index: 1;
        }
        
        .stats-container {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 30px;
            margin-top: 50px;
        }
        
        .stat-item {
            text-align: center;
            padding: 30px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: var(--card-radius);
            backdrop-filter: blur(10px);
            transition: var(--transition);
            flex: 1;
            min-width: 200px;
            position: relative;
            overflow: hidden;
        }
        
        .stat-item:hover {
            transform: translateY(-5px);
            background: rgba(255, 255, 255, 0.15);
        }
        
        .stat-item:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: var(--gradient-secondary);
            transform: scaleX(0);
            transform-origin: left;
            transition: transform 0.5s ease;
        }
        
        .stat-item:hover:after {
            transform: scaleX(1);
        }
        
        .stat-icon {
            font-size: 2.5rem;
            margin-bottom: 15px;
            color: white;
        }
        
        .stat-number {
            font-size: 2.5rem;
            font-weight: 700;
            margin-bottom: 10px;
            font-family: 'Poppins', sans-serif;
        }
        
        .stat-text {
            font-weight: 500;
            opacity: 0.9;
        }
        
        /* Team Section */
        .team-section {
            padding: 100px 0;
            background: white;
        }
        
        .team-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .team-card {
            background: white;
            border-radius: var(--card-radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: var(--transition);
            position: relative;
        }
        
        .team-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .team-image {
            height: 250px;
            background-color: var(--light-gray);
            background-position: center;
            background-size: cover;
            position: relative;
            overflow: hidden;
        }
        
        .team-image:after {
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
        
        .team-card:hover .team-image:after {
            opacity: 0.7;
        }
        
        .team-social {
            position: absolute;
            bottom: 20px;
            left: 0;
            width: 100%;
            display: flex;
            justify-content: center;
            gap: 15px;
            z-index: 2;
            opacity: 0;
            transform: translateY(20px);
            transition: var(--transition);
        }
        
        .team-card:hover .team-social {
            opacity: 1;
            transform: translateY(0);
        }
        
        .social-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background: white;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            text-decoration: none;
            transition: var(--transition);
        }
        
        .social-icon:hover {
            background: var(--primary);
            color: white;
            transform: translateY(-5px);
        }
        
        .team-info {
            padding: 25px;
            text-align: center;
        }
        
        .team-name {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            margin-bottom: 5px;
            color: var(--dark);
        }
        
        .team-role {
            color: var(--primary);
            margin-bottom: 15px;
            font-weight: 500;
        }
        
        .team-desc {
            color: var(--gray);
            line-height: 1.6;
        }
        
        /* Timeline Section */
        .timeline-section {
            padding: 100px 0;
            background: var(--light);
        }
        
        .timeline {
            position: relative;
            max-width: 800px;
            margin: 0 auto;
        }
        
        .timeline:before {
            content: '';
            position: absolute;
            left: 50%;
            top: 0;
            transform: translateX(-50%);
            width: 4px;
            height: 100%;
            background: var(--primary);
        }
        
        .timeline-item {
            position: relative;
            margin-bottom: 50px;
            width: 50%;
            padding: 20px 40px;
        }
        
        .timeline-item:nth-child(odd) {
            left: 0;
            padding-right: 0;
        }
        
        .timeline-item:nth-child(even) {
            left: 50%;
            padding-left: 0;
        }
        
        .timeline-content {
            background: white;
            border-radius: var(--card-radius);
            padding: 25px;
            box-shadow: var(--shadow);
            transition: var(--transition);
            position: relative;
        }
        
        .timeline-content:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
        }
        
        .timeline-date {
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 10px;
            display: block;
        }
        
        .timeline-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.25rem;
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .timeline-desc {
            color: var(--gray);
            line-height: 1.6;
        }
        
        .timeline-dot {
            position: absolute;
            top: 32px;
            width: 20px;
            height: 20px;
            border-radius: 50%;
            background: var(--primary);
            border: 4px solid white;
            box-shadow: 0 0 0 3px var(--primary);
        }
        
        .timeline-item:nth-child(odd) .timeline-dot {
            right: -10px;
        }
        
        .timeline-item:nth-child(even) .timeline-dot {
            left: -10px;
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
            
            .timeline:before {
                left: 30px;
            }
            
            .timeline-item {
                width: 100%;
                padding-left: 70px;
                padding-right: 0;
            }
            
            .timeline-item:nth-child(odd),
            .timeline-item:nth-child(even) {
                left: 0;
            }
            
            .timeline-item:nth-child(odd) .timeline-dot,
            .timeline-item:nth-child(even) .timeline-dot {
                left: 20px;
            }
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .mission-grid {
                grid-template-columns: 1fr;
            }
            
            .stats-container {
                flex-direction: column;
            }
            
            .team-grid {
                grid-template-columns: 1fr;
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
                <li class="nav-item"><a href="about" class="nav-link active">About</a></li>
                <li class="nav-item"><a href="hbusiness" class="nav-link">Businesses</a></li>
                <li class="nav-item"><a href="working" class="nav-link">How It Works</a></li>
                <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
            </ul>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="about-hero">
        <div class="container hero-content">
            <h1 class="hero-title">Our Mission to Reduce Food Waste</h1>
            <p class="hero-subtitle">We're connecting communities, businesses, and individuals to create a sustainable future by rescuing surplus food.</p>
        </div>
    </section>

    <!-- Mission Section -->
    <section class="mission-section">
        <div class="container">
            <div class="section-title">
                <h2>Our Mission & Vision</h2>
                <p>We're dedicated to creating a sustainable food ecosystem that benefits businesses, communities, and our planet</p>
            </div>
            
            <div class="mission-grid">
                <div class="mission-card">
                    <div class="mission-icon">
                        <i class="fas fa-recycle"></i>
                    </div>
                    <h3>Reduce Waste</h3>
                    <p>We help businesses minimize food waste by connecting them with customers who want to purchase surplus food at discounted prices.</p>
                </div>
                
                <div class="mission-card">
                    <div class="mission-icon">
                        <i class="fas fa-hand-holding-heart"></i>
                    </div>
                    <h3>Support Communities</h3>
                    <p>By making quality food more affordable, we're helping to address food insecurity and support local communities.</p>
                </div>
                
                <div class="mission-card">
                    <div class="mission-icon">
                        <i class="fas fa-leaf"></i>
                    </div>
                    <h3>Sustain Our Planet</h3>
                    <p>Reducing food waste means reducing greenhouse gas emissions and conserving resources used in food production.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Impact Section -->
    <section class="impact-section">
        <div class="container impact-content">
            <div class="section-title">
                <h2>Our Impact</h2>
                <p>Join us in making a difference—one meal at a time</p>
            </div>
            
            <div class="stats-container">
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-utensils"></i>
                    </div>
                    <div class="stat-number" id="meals-saved">0</div>
                    <div class="stat-text">Meals Saved</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-weight-hanging"></i>
                    </div>
                    <div class="stat-number" id="waste-reduced">0</div>
                    <div class="stat-text">Tons of Waste Reduced</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <div class="stat-number" id="businesses-joined">0</div>
                    <div class="stat-text">Businesses Joined</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-smile"></i>
                    </div>
                    <div class="stat-number" id="happy-customers">0</div>
                    <div class="stat-text">Happy Customers</div>
                </div>
            </div>
        </div>
    </section>

    <!-- Team Section -->
    <section class="team-section">
        <div class="container">
            <div class="section-title">
                <h2>Our Team</h2>
                <p>Meet the passionate individuals driving our mission forward</p>
            </div>
            
            <div class="team-grid">
                <div class="team-card">
                    <div class="team-image" style="background-image: url('https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZmlsZSUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="team-social">
                            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <div class="team-info">
                        <h3 class="team-name">Sarah Johnson</h3>
                        <div class="team-role">CEO & Founder</div>
                        <p class="team-desc">Former restaurant owner with a passion for sustainability and food justice.</p>
                    </div>
                </div>
                
                <div class="team-card">
                    <div class="team-image" style="background-image: url('https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cHJofmlsZSUyMHBvcnRyYWl0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="team-social">
                            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <div class="team-info">
                        <h3 class="team-name">Michael Chen</h3>
                        <div class="team-role">CTO</div>
                        <p class="team-desc">Tech innovator with expertise in building scalable platforms for social impact.</p>
                    </div>
                </div>
                
                <div class="team-card">
                    <div class="team-image" style="background-image: url('https://images.unsplash.com/photo-1580489944761-15a19d654956?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="team-social">
                            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <div class="team-info">
                        <h3 class="team-name">Emma Rodriguez</h3>
                        <div class="team-role">Head of Partnerships</div>
                        <p class="team-desc">Relationship builder with extensive experience in the food industry.</p>
                    </div>
                </div>
                
                <div class="team-card">
                    <div class="team-image" style="background-image: url('https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHByb2ZpbGUlMjBwb3J0cmFpdHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="team-social">
                            <a href="#" class="social-icon"><i class="fab fa-linkedin-in"></i></a>
                            <a href="#" class="social-icon"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="social-icon"><i class="fas fa-envelope"></i></a>
                        </div>
                    </div>
                    <div class="team-info">
                        <h3 class="team-name">David Kim</h3>
                        <div class="team-role">Sustainability Lead</div>
                        <p class="team-desc">Environmental scientist dedicated to creating sustainable food systems.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Timeline Section -->
    <section class="timeline-section">
        <div class="container">
            <div class="section-title">
                <h2>Our Journey</h2>
                <p>From idea to impact—how FoodSave came to be</p>
            </div>
            
            <div class="timeline">
                <div class="timeline-item">
                    <div class="timeline-content">
                        <span class="timeline-date">January 2020</span>
                        <h3 class="timeline-title">The Idea Was Born</h3>
                        <p class="timeline-desc">After witnessing massive food waste at local restaurants, our founder Sarah conceptualized a platform to connect businesses with customers.</p>
                    </div>
                    <div class="timeline-dot"></div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-content">
                        <span class="timeline-date">June 2020</span>
                        <h3 class="timeline-title">First Prototype</h3>
                        <p class="timeline-desc">We built our first MVP and partnered with 5 local restaurants to test the concept of surplus food redistribution.</p>
                    </div>
                    <div class="timeline-dot"></div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-content">
                        <span class="timeline-date">March 2021</span>
                        <h3 class="timeline-title">Official Launch</h3>
                        <p class="timeline-desc">FoodSave officially launched with 25 business partners and over 500 registered users in our first month.</p>
                    </div>
                    <div class="timeline-dot"></div>
                </div>
                
                <div class="timeline-item">
                    <div class="timeline-content">
                        <span class="timeline-date">Present Day</span>
                        <h3 class="timeline-title">Growing Impact</h3>
                        <p class="timeline-desc">We've expanded to 3 cities, partnered with over 200 businesses, and saved more than 50,000 meals from going to waste.</p>
                    </div>
                    <div class="timeline-dot"></div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container cta-content">
            <h2 class="cta-title">Join Us in the Fight Against Food Waste</h2>
            <p class="cta-text">Whether you're a business with surplus food or a customer looking for great deals, you can make a difference today.</p>
            <div class="cta-buttons">
                <a href="index" class="btn btn-cta-primary">Sign Up as Business</a>
                <a href="index" class="btn btn-cta-secondary">Become a Customer</a>
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
                        <li class="footer-link"><a href="business">For Businesses</a></li>
                        <li class="footer-link"><a href="contact">Testimonials</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Support</h3>
                    <ul class="footer-links">
                        <li class="footer-link"><a href="#">FAQ</a></li>
                        <li class="footer-link"><a href="#">Privacy Policy</a></li>
                        <li class="footer-link"><a href="#">Terms of Service</a></li>
                        <li class="footer-link"><a href="#">Contact Us</a></li>
                        <li class="footer-link"><a href="#">Help Center</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3 class="footer-title">Newsletter</h3>
                    <p>Subscribe to our newsletter to get updates on new features and food savings near you.</p>
                    <form class="newsletter-form">
                        <input type="email" class="newsletter-input" placeholder="Your Email Address">
                        <button type="submit" class="newsletter-btn">Subscribe</button>
                    </form>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2025 FoodSave. All rights reserved.</p>
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
        
        // Animate stats counting
        const stats = [
            { element: document.getElementById("meals-saved"), target: 52470, duration: 2000 },
            { element: document.getElementById("waste-reduced"), target: 124, duration: 2000 },
            { element: document.getElementById("businesses-joined"), target: 243, duration: 2000 },
            { element: document.getElementById("happy-customers"), target: 38510, duration: 2000 }
        ];
        
        let counted = false;
        
        function animateStats() {
            if (!counted && window.scrollY > document.querySelector(".impact-section").offsetTop - 500) {
                stats.forEach(stat => {
                    let count = 0;
                    const increment = stat.target / (stat.duration / 20);
                    
                    const timer = setInterval(() => {
                        count += increment;
                        if (count >= stat.target) {
                            stat.element.innerText = stat.target.toLocaleString();
                            clearInterval(timer);
                        } else {
                            stat.element.innerText = Math.round(count).toLocaleString();
                        }
                    }, 20);
                });
                counted = true;
            }
        }
        
        window.addEventListener("scroll", animateStats);
        
        // Team card animation
        const teamCards = document.querySelectorAll('.team-card');
        teamCards.forEach((card, index) => {
            card.style.animationDelay = `${index * 0.2}s`;
        });
        
        // Timeline animation
        const timelineItems = document.querySelectorAll('.timeline-content');
        
        function animateTimeline() {
            timelineItems.forEach((item, index) => {
                const position = item.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;
                
                if (position < screenPosition) {
                    item.style.animation = `fadeInUp 0.5s ease-out ${index * 0.2}s forwards`;
                    item.style.opacity = '0';
                }
            });
        }
        
        window.addEventListener('scroll', animateTimeline);
        
        // Initialize animations
        animateTimeline();
    </script>
</body>
</html>
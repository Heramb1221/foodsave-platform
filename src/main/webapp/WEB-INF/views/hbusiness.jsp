<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Businesses - FoodSave</title>
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
        .businesses-hero {
            padding: 180px 0 100px;
            background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%, rgba(78, 205, 196, 0.8) 100%);
            color: white;
            position: relative;
            overflow: hidden;
            text-align: center;
        }
        
        .businesses-hero:before {
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
        
        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            animation: fadeInUp 1s ease 0.4s;
            animation-fill-mode: both;
        }
        
        .btn-hero-primary {
            background: white;
            color: var(--primary);
            padding: 12px 30px;
            font-size: 1.1rem;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.15);
        }
        
        .btn-hero-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.2);
        }
        
        .btn-hero-secondary {
            background: transparent;
            color: white;
            border: 2px solid white;
            padding: 12px 30px;
            font-size: 1.1rem;
        }
        
        .btn-hero-secondary:hover {
            background: white;
            color: var(--primary);
            transform: translateY(-3px);
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
        
        /* Benefits Section */
        .benefits-section {
            padding: 100px 0;
            background: white;
        }
        
        .benefits-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }
        
        .benefit-card {
            background: var(--light);
            border-radius: var(--card-radius);
            padding: 40px 30px;
            text-align: center;
            box-shadow: var(--shadow);
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }
        
        .benefit-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .benefit-card:before {
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
        
        .benefit-card:hover:before {
            transform: scaleX(1);
        }
        
        .benefit-icon {
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
        
        .benefit-card:hover .benefit-icon {
            background: var(--primary);
            color: white;
            transform: scale(1.1) rotate(5deg);
        }
        
        .benefit-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--dark);
        }
        
        .benefit-description {
            color: var(--gray);
            line-height: 1.6;
        }
        
        /* Stats Section */
        .stats-section {
            padding: 100px 0;
            background: linear-gradient(to right, var(--primary-light), var(--accent));
            color: white;
            position: relative;
            overflow: hidden;
        }
        
        .stats-section:before {
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
        
        .stats-content {
            position: relative;
            z-index: 1;
        }
        
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .stat-item {
            text-align: center;
            padding: 30px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: var(--card-radius);
            backdrop-filter: blur(10px);
            transition: var(--transition);
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
        
        /* How It Works Section */
        .how-it-works-section {
            padding: 100px 0;
            background: white;
        }
        
        .process-steps {
            display: flex;
            justify-content: space-between;
            position: relative;
        }
        
        .process-step {
            text-align: center;
            width: 22%;
            position: relative;
            opacity: 0;
            transform: translateY(30px);
            transition: all 0.8s ease;
        }
        
        .process-step.visible {
            opacity: 1;
            transform: translateY(0);
        }
        
        .step-icon-container {
            width: 100px;
            height: 100px;
            background: white;
            border: 4px solid var(--primary);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 30px;
            position: relative;
            transition: var(--transition);
            box-shadow: 0 5px 15px rgba(46, 139, 87, 0.2);
        }
        
        .step-icon-container:hover {
            transform: scale(1.1) rotate(5deg);
            background: var(--primary);
        }
        
        .step-icon-container:hover .step-icon {
            color: white;
        }
        
        .step-icon {
            font-size: 40px;
            color: var(--primary);
            transition: var(--transition);
        }
        
        .step-number {
            position: absolute;
            top: -15px;
            right: -15px;
            width: 40px;
            height: 40px;
            background: var(--secondary);
            color: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
            font-size: 18px;
            box-shadow: 0 5px 15px rgba(255, 107, 53, 0.3);
        }
        
        .step-title {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            margin-bottom: 15px;
            color: var(--dark);
        }
        
        .step-description {
            color: var(--gray);
            line-height: 1.6;
        }
        
        /* Business Categories */
        .categories-section {
            padding: 100px 0;
            background: var(--light);
        }
        
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 30px;
        }
        
        .category-card {
            background: white;
            border-radius: var(--card-radius);
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: var(--transition);
            position: relative;
            text-align: center;
        }
        
        .category-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .category-image {
            height: 180px;
            background-color: var(--light-gray);
            background-position: center;
            background-size: cover;
            position: relative;
            overflow: hidden;
        }
        
        .category-image:after {
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
        
        .category-card:hover .category-image:after {
            opacity: 0.7;
        }
        
        .category-icon {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 60px;
            height: 60px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary);
            font-size: 24px;
            z-index: 2;
            transition: var(--transition);
        }
        
        .category-card:hover .category-icon {
            background: var(--secondary);
            color: white;
            transform: translate(-50%, -50%) scale(1.1);
        }
        
        .category-info {
            padding: 25px;
        }
        
        .category-name {
            font-family: 'Poppins', sans-serif;
            font-size: 1.5rem;
            margin-bottom: 10px;
            color: var(--dark);
        }
        
        .category-count {
            color: var(--primary);
            font-weight: 500;
            margin-bottom: 15px;
            display: block;
        }
        
        .view-businesses {
            display: inline-block;
            padding: 8px 20px;
            background: var(--primary);
            color: white;
            border-radius: 50px;
            text-decoration: none;
            font-weight: 500;
            transition: var(--transition);
        }
        
        .view-businesses:hover {
            background: var(--secondary);
            transform: translateY(-2px);
        }
        
        /* Testimonials Section */
        .testimonials-section {
            padding: 100px 0;
            background: white;
        }
        
        .testimonials-container {
            max-width: 1000px;
            margin: 0 auto;
            position: relative;
        }
        
        .testimonials-slider {
            display: flex;
            overflow-x: hidden;
            scroll-behavior: smooth;
            border-radius: var(--card-radius);
            box-shadow: var(--shadow);
        }
        
        .testimonial {
            min-width: 100%;
            padding: 40px;
            background: var(--light);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        
        .testimonial-content {
            max-width: 700px;
            margin: 0 auto;
        }
        
        .testimonial-text {
            font-size: 1.2rem;
            line-height: 1.6;
            color: var(--dark);
            margin-bottom: 30px;
            position: relative;
        }
        
        .testimonial-text:before,
        .testimonial-text:after {
            content: '"';
            font-size: 4rem;
            color: var(--primary);
            opacity: 0.2;
            position: absolute;
            font-family: Georgia, serif;
        }
        
        .testimonial-text:before {
            top: -20px;
            left: -30px;
        }
        
        .testimonial-text:after {
            bottom: -40px;
            right: -30px;
        }
        
        .testimonial-author {
            display: flex;
            align-items: center;
            margin-top: 20px;
        }
        
        .author-avatar {
            width: 60px;
            height: 60px;
            border-radius: 50%;
            background: var(--gradient-primary);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-weight: 600;
            margin-right: 15px;
        }
        
        .author-info {
            text-align: left;
        }
        
        .author-name {
            font-family: 'Poppins', sans-serif;
            font-weight: 600;
            color: var(--dark);
        }
        
        .author-role {
            color: var(--gray);
            font-size: 14px;
        }
        
        .testimonial-controls {
            display: flex;
            justify-content: center;
            margin-top: 30px;
            gap: 15px;
        }
        
        .testimonial-btn {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            background: var(--light);
            border: 2px solid var(--primary);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: var(--transition);
        }
        
        .testimonial-btn:hover {
            background: var(--primary);
            color: white;
            transform: scale(1.1);
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
            
            .process-steps {
                flex-direction: column;
                align-items: center;
                gap: 60px;
            }
            
            .process-step {
                width: 100%;
                max-width: 400px;
            }
        }
        
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.2rem;
            }
            
            .hero-subtitle {
                font-size: 1.1rem;
            }
            
            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .benefits-grid {
                grid-template-columns: 1fr;
            }
            
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .categories-grid {
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
                <li class="nav-item"><a href="about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="working" class="nav-link">How It Works</a></li>
                <li class="nav-item"><a href="hbusiness" class="nav-link active">Businesses</a></li>
                <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
            </ul>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="businesses-hero">
        <div class="container hero-content">
            <h1 class="hero-title">For Businesses</h1>
            <p class="hero-subtitle">Join the movement to reduce food waste, generate revenue, and build a sustainable future for your business</p>
            <div class="hero-buttons">
                <a href="index" class="btn btn-hero-primary">Register Your Business</a>
                <a href="index" class="btn btn-hero-secondary">Learn More</a>
            </div>
        </div>
    </section>

    <!-- Benefits Section -->
    <section class="benefits-section">
        <div class="container">
            <div class="section-title">
                <h2>Benefits for Your Business</h2>
                <p>Join hundreds of businesses already making a difference with FoodSave</p>
            </div>
            
            <div class="benefits-grid">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <h3 class="benefit-title">Generate Revenue</h3>
                    <p class="benefit-description">Turn surplus food that would be wasted into additional income for your business. Recoup costs and increase profitability.</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-trash-alt"></i>
                    </div>
                    <h3 class="benefit-title">Reduce Waste Costs</h3>
                    <p class="benefit-description">Lower disposal costs and minimize your environmental impact by reducing food waste sent to landfills.</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="benefit-title">Attract New Customers</h3>
                    <p class="benefit-description">Reach environmentally-conscious consumers who want to support businesses with sustainable practices.</p>
                </div>
                
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3 class="benefit-title">Gain Insights</h3>
                    <p class="benefit-description">Access analytics and reports to understand your waste patterns and make more informed business decisions.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="stats-section">
        <div class="container stats-content">
            <div class="section-title">
                <h2>Impact By Numbers</h2>
                <p>See how businesses are making a difference with FoodSave</p>
            </div>
            
            <div class="stats-grid">
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-store"></i>
                    </div>
                    <div class="stat-number" id="businesses-count">0</div>
                    <div class="stat-text">Businesses Joined</div>
                </div>
                
                <div class="stat-item">
                    <div class="stat-icon">
                        <i class="fas fa-dollar-sign"></i>
                    </div>
                    <div class="stat-number">$2.4M+</div>
                    <div class="stat-text">Revenue Generated</div>
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
                        <i class="fas fa-utensils"></i>
                    </div>
                    <div class="stat-number" id="meals-saved">0</div>
                    <div class="stat-text">Meals Saved</div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="how-it-works-section">
        <div class="container">
            <div class="section-title">
                <h2>How It Works For Businesses</h2>
                <p>Getting started with FoodSave is simple and straightforward</p>
            </div>
            
            <div class="process-steps">
                <div class="process-step">
                    <div class="step-icon-container">
                        <i class="fas fa-user-plus step-icon"></i>
                        <div class="step-number">1</div>
                    </div>
                    <h3 class="step-title">Create Account</h3>
                    <p class="step-description">Register your business and complete your profile with details about your establishment.</p>
                </div>
                
                <div class="process-step">
                    <div class="step-icon-container">
                        <i class="fas fa-utensils step-icon"></i>
                        <div class="step-number">2</div>
                    </div>
                    <h3 class="step-title">List Surplus Food</h3>
                    <p class="step-description">Add your surplus food items with descriptions, photos, and set discounted prices.</p>
                </div>
                
                <div class="process-step">
                    <div class="step-icon-container">
                        <i class="fas fa-bell step-icon"></i>
                        <div class="step-number">3</div>
                    </div>
                    <h3 class="step-title">Receive Orders</h3>
                    <p class="step-description">Get notified when customers place orders and confirm pickup times.</p>
                </div>
                
                <div class="process-step">
                    <div class="step-icon-container">
                        <i class="fas fa-money-bill-wave step-icon"></i>
                        <div class="step-number">4</div>
                    </div>
                    <h3 class="step-title">Get Paid</h3>
                    <p class="step-description">Receive payments securely through the platform and track your earnings.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Categories Section -->
    <section class="categories-section">
        <div class="container">
            <div class="section-title">
                <h2>Business Categories</h2>
                <p>FoodSave works with various types of food businesses</p>
            </div>
            
            <div class="categories-grid">
                <div class="category-card">
                    <div class="category-image" style="background-image: url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudHxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="category-icon">
                            <i class="fas fa-utensils"></i>
                        </div>
                    </div>
                    <div class="category-info">
                        <h3 class="category-name">Restaurants</h3>
                        <span class="category-count">84 Businesses</span>
                        <a href="#" class="view-businesses">View Restaurants</a>
                    </div>
                </div>
                
                <div class="category-card">
                    <div class="category-image" style="background-image: url('https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2FmZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="category-icon">
                            <i class="fas fa-coffee"></i>
                        </div>
                    </div>
                    <div class="category-info">
                        <h3 class="category-name">Cafes</h3>
                        <span class="category-count">56 Businesses</span>
                        <a href="#" class="view-businesses">View Cafes</a>
                    </div>
                </div>
                
                <div class="category-card">
                    <div class="category-image" style="background-image: url('https://images.unsplash.com/photo-1603532648955-039310d9ed75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');">
                        <div class="category-icon">
                            <i class="fas fa-bread-slice"></i>
                        </div>
                    </div>
                    <div class="category-info">
                        <h3 class="category-name">Bakeries</h3>
                        <span class="category-count">42 Businesses</span>
                        <a href="#" class="view-businesses">View Bakeries</a>
                    </div>
                </div>
                
                <div class="category-card">
                                            <div class="category-icon">
                            <i class="fas fa-shopping-basket"></i>
                        </div>
                    </div>
                    <div class="category-info">
                        <h3 class="category-name">Grocery Stores</h3>
                        <span class="category-count">38 Businesses</span>
                        <a href="#" class="view-businesses">View Groceries</a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials-section">
        <div class="container">
            <div class="section-title">
                <h2>Success Stories</h2>
                <p>Hear from businesses that have transformed their operations with FoodSave</p>
            </div>
            
            <div class="testimonials-container">
                <div class="testimonials-slider">
                    <div class="testimonial">
                        <div class="testimonial-content">
                            <p class="testimonial-text">FoodSave has completely changed how we manage our surplus food. We're not only reducing waste but also connecting with new customers who appreciate our sustainability efforts. The additional revenue has been a welcome bonus to our bottom line.</p>
                            <div class="testimonial-author">
                                <div class="author-avatar">MR</div>
                                <div class="author-info">
                                    <div class="author-name">Maria Rodriguez</div>
                                    <div class="author-role">Owner, Fresh Bites Cafe</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="testimonial">
                        <div class="testimonial-content">
                            <p class="testimonial-text">As a bakery, we often had leftover pastries at the end of the day. FoodSave provided the perfect solution to reduce our waste while generating additional income. The platform is easy to use, and the support team is always helpful.</p>
                            <div class="testimonial-author">
                                <div class="author-avatar">JK</div>
                                <div class="author-info">
                                    <div class="author-name">James Kim</div>
                                    <div class="author-role">Manager, Sweet Delights Bakery</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="testimonial">
                        <div class="testimonial-content">
                            <p class="testimonial-text">We've tried other food waste solutions, but FoodSave stands out for its simplicity and effectiveness. The analytics dashboard helps us understand our patterns better, and we've reduced our food waste by 65% in just three months.</p>
                            <div class="testimonial-author">
                                <div class="author-avatar">SP</div>
                                <div class="author-info">
                                    <div class="author-name">Sarah Peterson</div>
                                    <div class="author-role">Operations Director, Urban Eatery</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="testimonial-controls">
                    <button class="testimonial-btn prev-btn">
                        <i class="fas fa-chevron-left"></i>
                    </button>
                    <button class="testimonial-btn next-btn">
                        <i class="fas fa-chevron-right"></i>
                    </button>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container cta-content">
            <h2 class="cta-title">Ready to Transform Your Business?</h2>
            <p class="cta-text">Join hundreds of food businesses already reducing waste, saving money, and building sustainable practices with FoodSave</p>
            <div class="cta-buttons">
                <a href="index" class="btn btn-cta-primary">Register Your Business</a>
                <a href="index" class="btn btn-cta-secondary">Schedule a Demo</a>
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
                <p>&copy; 2023 FoodSave. All rights reserved.</p>
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
            { element: document.getElementById("businesses-count"), target: 243, duration: 2000 },
            { element: document.getElementById("waste-reduced"), target: 124, duration: 2000 },
            { element: document.getElementById("meals-saved"), target: 52470, duration: 2000 }
        ];
        
        let counted = false;
        
        function animateStats() {
            if (!counted && window.scrollY > document.querySelector(".stats-section").offsetTop - 500) {
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
        
        // Animate process steps
        const processSteps = document.querySelectorAll('.process-step');
        
        function animateSteps() {
            processSteps.forEach((step, index) => {
                const position = step.getBoundingClientRect().top;
                const screenPosition = window.innerHeight / 1.3;
                
                if (position < screenPosition) {
                    setTimeout(() => {
                        step.classList.add('visible');
                    }, index * 200);
                }
            });
        }
        
        window.addEventListener('scroll', animateSteps);
        
        // Testimonial slider
        const slider = document.querySelector('.testimonials-slider');
        const prevBtn = document.querySelector('.prev-btn');
        const nextBtn = document.querySelector('.next-btn');
        const testimonials = document.querySelectorAll('.testimonial');
        let currentIndex = 0;
        
        function showTestimonial(index) {
            slider.scrollLeft = testimonials[index].offsetLeft;
        }
        
        nextBtn.addEventListener('click', () => {
            currentIndex = (currentIndex + 1) % testimonials.length;
            showTestimonial(currentIndex);
        });
        
        prevBtn.addEventListener('click', () => {
            currentIndex = (currentIndex - 1 + testimonials.length) % testimonials.length;
            showTestimonial(currentIndex);
        });
        
        // Auto-advance testimonials
        setInterval(() => {
            currentIndex = (currentIndex + 1) % testimonials.length;
            showTestimonial(currentIndex);
        }, 5000);
        
        // Initialize animations
        animateSteps();
    </script>
</body>
</html>
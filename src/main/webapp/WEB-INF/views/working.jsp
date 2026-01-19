<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>How It Works - FoodSave</title>
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

/* Header & Navigation */
header {
    background-color: rgba(255, 255, 255, 0.98);
    box-shadow: var(--shadow);
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
    transition: var(--transition);
    backdrop-filter: blur(10px);
}

header.scrolled {
    padding: 5px 0;
    background-color: rgba(255, 255, 255, 0.95);
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
    transition: var(--transition);
}

.logo:hover {
    transform: translateY(-2px);
}

.logo-icon {
    width: 45px;
    height: 45px;
    background: var(--gradient-primary);
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: bold;
    font-size: 20px;
    margin-right: 12px;
    transition: var(--transition);
    box-shadow: 0 4px 10px rgba(46, 139, 87, 0.3);
}

.logo:hover .logo-icon {
    transform: rotate(15deg) scale(1.1);
    background: var(--gradient-secondary);
}

.logo-text {
    font-family: 'Poppins', sans-serif;
    font-size: 26px;
    font-weight: 700;
    color: var(--dark);
    letter-spacing: -0.5px;
}

.logo-text span {
    color: var(--primary);
    background: var(--gradient-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
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
    padding: 8px 0;
    position: relative;
}

.nav-link:after {
    content: '';
    position: absolute;
    width: 0;
    height: 3px;
    bottom: 0;
    left: 0;
    background: var(--gradient-primary);
    transition: var(--transition);
    border-radius: 3px;
}

.nav-link:hover {
    color: var(--primary);
}

.nav-link:hover:after, .nav-link.active:after {
    width: 100%;
}

.nav-link.active {
    color: var(--primary);
    font-weight: 600;
}

.auth-buttons {
    display: flex;
    align-items: center;
}

.btn {
    padding: 10px 24px;
    border-radius: 50px;
    font-weight: 600;
    text-decoration: none;
    transition: var(--transition);
    display: inline-block;
    cursor: pointer;
    border: none;
    font-family: 'Open Sans', sans-serif;
    font-size: 15px;
    letter-spacing: 0.3px;
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
    box-shadow: 0 8px 20px rgba(46, 139, 87, 0.25);
}

.btn-signup {
    background: var(--gradient-secondary);
    color: white;
    box-shadow: 0 6px 15px rgba(255, 107, 53, 0.3);
}

.btn-signup:hover {
    background: var(--secondary-dark);
    transform: translateY(-2px);
    box-shadow: 0 10px 20px rgba(255, 107, 53, 0.4);
}

.hamburger {
    display: none;
    cursor: pointer;
    background: var(--light);
    width: 44px;
    height: 44px;
    border-radius: 12px;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    transition: var(--transition);
}

.hamburger:hover {
    background: var(--primary-light);
}

.hamburger:hover .bar {
    background: white;
}

.bar {
    display: block;
    width: 22px;
    height: 2px;
    margin: 3px 0;
    transition: var(--transition);
    background-color: var(--dark);
    border-radius: 2px;
}

/* Hero Section */
.how-it-works-hero {
    padding: 180px 0 100px;
    background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%, rgba(78, 205, 196, 0.85) 100%), url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,128L48,117.3C96,107,192,85,288,112C384,139,480,213,576,218.7C672,224,768,160,864,138.7C960,117,1056,139,1152,149.3C1248,160,1344,160,1392,160L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
    color: white;
    position: relative;
    overflow: hidden;
    text-align: center;
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
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.hero-subtitle {
    font-size: 1.25rem;
    margin-bottom: 40px;
    opacity: 0.9;
    animation: fadeInUp 1s ease 0.2s;
    animation-fill-mode: both;
    font-weight: 400;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
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
    margin-bottom: 70px;
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
    height: 4px;
    background: var(--gradient-primary);
    bottom: -15px;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 4px;
}

.section-title p {
    color: var(--gray);
    max-width: 600px;
    margin: 30px auto 0;
    font-size: 1.1rem;
}

/* Process Section */
.process-section {
    padding: 100px 0;
    background: white;
}

.process-container {
    position: relative;
}

.process-line {
    position: absolute;
    top: 100px;
    left: 50%;
    transform: translateX(-50%);
    width: 70%;
    height: 4px;
    background: var(--gradient-primary);
    z-index: 1;
    border-radius: 4px;
}

.process-steps {
    display: flex;
    justify-content: space-between;
    position: relative;
    z-index: 2;
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
    width: 120px;
    height: 120px;
    background: white;
    border: 4px solid transparent;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 30px;
    position: relative;
    transition: var(--transition);
    box-shadow: var(--shadow);
    background: linear-gradient(white, white) padding-box, var(--gradient-primary) border-box;
}

.step-icon-container:hover {
    transform: scale(1.1) rotate(5deg);
    box-shadow: var(--shadow-hover);
}

.step-icon-container:hover .step-icon {
    color: var(--primary);
    transform: scale(1.1);
}

.step-icon {
    font-size: 42px;
    color: var(--primary);
    transition: var(--transition);
}

.step-number {
    position: absolute;
    top: -10px;
    right: -10px;
    width: 40px;
    height: 40px;
    background: var(--gradient-secondary);
    color: white;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 18px;
    box-shadow: 0 5px 15px rgba(255, 107, 53, 0.4);
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
    font-size: 1.05rem;
}

/* For Whom Section */
.for-whom-section {
    padding: 100px 0;
    background: var(--light);
}

.audience-tabs {
    display: flex;
    justify-content: center;
    margin-bottom: 50px;
    border-radius: 50px;
    background: white;
    padding: 8px;
    box-shadow: var(--shadow);
    max-width: 600px;
    margin: 0 auto 50px;
    border: 1px solid var(--light-gray);
}

.audience-tab {
    padding: 15px 30px;
    cursor: pointer;
    text-align: center;
    flex: 1;
    transition: var(--transition);
    border-radius: 50px;
    font-weight: 500;
    position: relative;
    z-index: 1;
}

.audience-tab.active {
    background: var(--gradient-primary);
    color: white;
    box-shadow: 0 5px 15px rgba(46, 139, 87, 0.3);
}

.audience-content {
    display: none;
    animation: fadeIn 0.5s ease;
}

.audience-content.active {
    display: block;
}

.audience-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 30px;
}

.audience-card {
    background: white;
    border-radius: var(--card-radius);
    padding: 35px 30px;
    box-shadow: var(--shadow);
    transition: var(--transition);
    text-align: center;
    position: relative;
    overflow: hidden;
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.audience-card:hover {
    transform: translateY(-10px);
    box-shadow: var(--shadow-hover);
}

.audience-card:before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 5px;
    background: var(--gradient-primary);
}

.audience-icon {
    width: 90px;
    height: 90px;
    background: rgba(46, 139, 87, 0.08);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 25px;
    color: var(--primary);
    font-size: 36px;
    transition: var(--transition);
}

.audience-card:hover .audience-icon {
    background: var(--gradient-primary);
    color: white;
    transform: scale(1.1) rotate(5deg);
}

.audience-title {
    font-family: 'Poppins', sans-serif;
    font-size: 1.5rem;
    margin-bottom: 15px;
    color: var(--dark);
}

.audience-list {
    list-style: none;
    text-align: left;
    margin-top: 25px;
}

.audience-list li {
    margin-bottom: 12px;
    padding-left: 30px;
    position: relative;
    color: var(--gray);
    transition: var(--transition);
}

.audience-list li:hover {
    color: var(--dark);
    transform: translateX(5px);
}

.audience-list li:before {
    content: '✓';
    position: absolute;
    left: 0;
    color: var(--primary);
    font-weight: bold;
    font-size: 1.1rem;
}

/* Benefits Section */
.benefits-section {
    padding: 100px 0;
    background: white;
}

.benefits-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
    gap: 30px;
}

.benefit-card {
    background: var(--light);
    border-radius: var(--card-radius);
    padding: 35px 30px;
    box-shadow: var(--shadow);
    transition: var(--transition);
    position: relative;
    overflow: hidden;
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.benefit-card:hover {
    transform: translateY(-10px);
    box-shadow: var(--shadow-hover);
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
    background: rgba(46, 139, 87, 0.08);
    border-radius: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 25px;
    color: var(--primary);
    font-size: 32px;
    transition: var(--transition);
}

.benefit-card:hover .benefit-icon {
    background: var(--gradient-primary);
    color: white;
    transform: rotate(10deg) scale(1.1);
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
    font-size: 1.05rem;
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
    border: 1px solid rgba(0, 0, 0, 0.03);
}

.faq-item:hover {
    box-shadow: var(--shadow-hover);
}

.faq-question {
    padding: 25px 30px;
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
    color: var(--gray);
}

.faq-item.active .faq-icon {
    transform: rotate(180deg);
    color: var(--primary);
}

.faq-answer {
    padding: 0 30px;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.5s ease, padding 0.5s ease;
    color: var(--gray);
    line-height: 1.6;
}

.faq-item.active .faq-answer {
    max-height: 300px;
    padding: 0 30px 25px;
}

/* CTA Section */
.cta-section {
    padding: 100px 0;
    background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%, rgba(78, 205, 196, 0.85) 100%), url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,128L48,117.3C96,107,192,85,288,112C384,139,480,213,576,218.7C672,224,768,160,864,138.7C960,117,1056,139,1152,149.3C1248,160,1344,160,1392,160L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
    color: white;
    text-align: center;
    position: relative;
    overflow: hidden;
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
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.cta-text {
    font-size: 1.1rem;
    margin-bottom: 40px;
    opacity: 0.9;
    max-width: 600px;
    margin-left: auto;
    margin-right: auto;
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
    padding: 15px 35px;
    font-size: 1.1rem;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
    font-weight: 600;
}

.btn-cta-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
}

.btn-cta-secondary {
    background: transparent;
    color: white;
    border: 2px solid white;
    padding: 15px 35px;
    font-size: 1.1rem;
    font-weight: 600;
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
    background: var(--gradient-primary);
    color: white;
}

.footer-logo-text {
    font-family: 'Poppins', sans-serif;
    font-size: 24px;
    font-weight: 700;
    color: white;
    margin-left: 10px;
}

.footer-logo-text span {
    background: var(--gradient-primary);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
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
    width: 44px;
    height: 44px;
    border-radius: 12px;
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
    border-radius: 2px;
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
    padding: 12px 20px;
    border: none;
    border-radius: 50px;
    font-family: 'Open Sans', sans-serif;
    background: rgba(255, 255, 255, 0.1);
    color: white;
    transition: var(--transition);
}

.newsletter-input:focus {
    outline: none;
    background: rgba(255, 255, 255, 0.15);
}

.newsletter-input::placeholder {
    color: rgba(255, 255, 255, 0.7);
}

.newsletter-btn {
    padding: 12px 25px;
    background: var(--gradient-primary);
    color: white;
    border: none;
    border-radius: 50px;
    cursor: pointer;
    transition: var(--transition);
    font-weight: 600;
}

.newsletter-btn:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
}

.footer-bottom {
    text-align: center;
    padding-top: 20px;
    border-top: 1px solid rgba(255, 255, 255, 0.1);
    opacity: 0.7;
    font-size: 0.9rem;
}

.footer-bottom a {
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: var(--transition);
}

.footer-bottom a:hover {
    color: var(--accent);
}

/* Animations */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
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
        z-index: 999;
    }
    .nav-menu.active {
        left: 0;
    }
    .nav-item {
        margin: 20px 0;
    }
    .hamburger {
        display: flex;
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
    .process-line {
        display: none;
    }
    .hero-title {
        font-size: 2.8rem;
    }
}

@media (max-width: 768px) {
    .hero-title {
        font-size: 2.2rem;
    }
    .hero-subtitle {
        font-size: 1.1rem;
    }
    .section-title h2 {
        font-size: 2rem;
    }
    .audience-tabs {
        flex-direction: column;
        border-radius: var(--card-radius);
        max-width: 400px;
    }
    .audience-tab {
        border-radius: 0;
        padding: 15px;
    }
    .audience-tab:first-child {
        border-top-left-radius: var(--card-radius);
        border-top-right-radius: var(--card-radius);
    }
    .audience-tab:last-child {
        border-bottom-left-radius: var(--card-radius);
        border-bottom-right-radius: var(--card-radius);
    }
    .benefits-container, .audience-grid {
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
    .btn-cta-primary, .btn-cta-secondary {
        width: 100%;
        max-width: 300px;
        text-align: center;
    }
}

@media (max-width: 480px) {
    .header-container {
        padding: 0 15px;
    }
    .logo-text {
        font-size: 22px;
    }
    .hero-title {
        font-size: 1.8rem;
    }
    .section-title h2 {
        font-size: 1.8rem;
    }
    .step-icon-container {
        width: 100px;
        height: 100px;
    }
    .step-icon {
        font-size: 36px;
    }
    .audience-card, .benefit-card {
        padding: 25px 20px;
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
                <div class="logo-text">
                    Food<span>Save</span>
                </div>
            </a>

            <ul class="nav-menu">
                <li class="nav-item"><a href="index" class="nav-link">Home</a></li>
                <li class="nav-item"><a href="about" class="nav-link">About</a></li>
                <li class="nav-item"><a href="working" class="nav-link active">How It Works</a></li>
                <li class="nav-item"><a href="hbusiness" class="nav-link">Businesses</a></li>
                <li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
            </ul>

            <div class="auth-buttons">
                <a href="#" class="btn btn-login">Login</a>
                <a href="#" class="btn btn-signup">Sign Up</a>
            </div>

            <div class="hamburger" id="hamburger">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="how-it-works-hero">
        <div class="container hero-content">
            <h1 class="hero-title">How FoodSave Works</h1>
            <p class="hero-subtitle">Discover how our platform connects businesses with customers to reduce food waste and create sustainable communities</p>
        </div>
    </section>

    <!-- Process Section -->
    <section class="process-section">
        <div class="container">
            <div class="section-title">
                <h2>Simple 4-Step Process</h2>
                <p>From surplus food to happy customers—here's how it works</p>
            </div>

            <div class="process-container">
                <div class="process-line"></div>
                <div class="process-steps">
                    <div class="process-step">
                        <div class="step-icon-container">
                            <i class="fas fa-utensils step-icon"></i>
                            <div class="step-number">1</div>
                        </div>
                        <h3 class="step-title">List Surplus Food</h3>
                        <p class="step-description">Businesses add their surplus food items to the platform with descriptions, photos, and discounted prices.</p>
                    </div>

                    <div class="process-step">
                        <div class="step-icon-container">
                            <i class="fas fa-search step-icon"></i>
                            <div class="step-number">2</div>
                        </div>
                        <h3 class="step-title">Browse & Discover</h3>
                        <p class="step-description">Customers browse available food offers nearby, filter by category, and find great deals.</p>
                    </div>

                    <div class="process-step">
                        <div class="step-icon-container">
                            <i class="fas fa-shopping-cart step-icon"></i>
                            <div class="step-number">3</div>
                        </div>
                        <h3 class="step-title">Place Order</h3>
                        <p class="step-description">Customers place orders and pay securely through the platform, selecting pickup times.</p>
                    </div>

                    <div class="process-step">
                        <div class="step-icon-container">
                            <i class="fas fa-utensils step-icon"></i>
                            <div class="step-number">4</div>
                        </div>
                        <h3 class="step-title">Pickup & Enjoy</h3>
                        <p class="step-description">Customers pick up their orders at the scheduled time and enjoy quality food while reducing waste.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- For Whom Section -->
    <section class="for-whom-section">
        <div class="container">
            <div class="section-title">
                <h2>For Businesses & Customers</h2>
                <p>FoodSave creates value for everyone in the food ecosystem</p>
            </div>

            <div class="audience-tabs">
                <div class="audience-tab active" data-target="businesses">For Businesses</div>
                <div class="audience-tab" data-target="customers">For Customers</div>
            </div>

            <div class="audience-content active" id="businesses-content">
                <div class="audience-grid">
                    <div class="audience-card">
                        <div class="audience-icon">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <h3 class="audience-title">Generate Revenue</h3>
                        <p>Turn food that would be wasted into additional income for your business.</p>
                        <ul class="audience-list">
                            <li>Recoup costs on surplus inventory</li>
                            <li>Attract new customers to your business</li>
                            <li>Increase overall profitability</li>
                        </ul>
                    </div>

                    <div class="audience-card">
                        <div class="audience-icon">
                            <i class="fas fa-trash-alt"></i>
                        </div>
                        <h3 class="audience-title">Reduce Waste Costs</h3>
                        <p>Lower disposal costs and environmental impact of food waste.</p>
                        <ul class="audience-list">
                            <li>Reduce waste management expenses</li>
                            <li>Lower your carbon footprint</li>
                            <li>Minimize environmental impact</li>
                        </ul>
                    </div>

                    <div class="audience-card">
                        <div class="audience-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <h3 class="audience-title">Build Community</h3>
                        <p>Connect with environmentally-conscious customers and build brand loyalty.</p>
                        <ul class="audience-list">
                            <li>Attract eco-conscious customers</li>
                            <li>Enhance your brand reputation</li>
                            <li>Build customer loyalty</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="audience-content" id="customers-content">
                <div class="audience-grid">
                    <div class="audience-card">
                        <div class="audience-icon">
                            <i class="fas fa-piggy-bank"></i>
                        </div>
                        <h3 class="audience-title">Save Money</h3>
                        <p>Enjoy delicious food from quality establishments at significant discounts.</p>
                        <ul class="audience-list">
                            <li>Save 50% or more on quality food</li>
                            <li>Discover new local businesses</li>
                            <li>Enjoy restaurant-quality meals for less</li>
                        </ul>
                    </div>

                    <div class="audience-card">
                        <div class="audience-icon">
                            <i class="fas fa-leaf"></i>
                        </div>
                        <h3 class="audience-title">Support Sustainability</h3>
                        <p>Make a positive environmental impact by reducing food waste in your community.</p>
                        <ul class="audience-list">
                            <li>Help reduce food waste emissions</li>
                            <li>Support the circular economy</li>
                            <li>Contribute to sustainable practices</li>
                        </ul>
                    </div>

                    <div class="audience-card">
                        <div class="audience-icon">
                            <i class="fas fa-utensils"></i>
                        </div>
                        <h3 class="audience-title">Discover Variety</h3>
                        <p>Explore diverse food options from different cuisines and establishments.</p>
                        <ul class="audience-list">
                            <li>Try new foods and restaurants</li>
                            <li>Enjoy surprise meals at great value</li>
                            <li>Experience local food diversity</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Benefits Section -->
    <section class="benefits-section">
        <div class="container">
            <div class="section-title">
                <h2>Benefits of Using FoodSave</h2>
                <p>Join the movement that's transforming food waste into opportunities</p>
            </div>

            <div class="benefits-container">
                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-globe-americas"></i>
                    </div>
                    <h3 class="benefit-title">Environmental Impact</h3>
                    <p class="benefit-description">Each saved meal reduces CO2 emissions equivalent to charging your smartphone 422 times. Join us in making a real difference for our planet.</p>
                </div>

                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-hand-holding-heart"></i>
                    </div>
                    <h3 class="benefit-title">Community Building</h3>
                    <p class="benefit-description">Connect with like-minded individuals and businesses who care about sustainability and creating a better food system for everyone.</p>
                </div>

                <div class="benefit-card">
                    <div class="benefit-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h3 class="benefit-title">Economic Efficiency</h3>
                    <p class="benefit-description">Businesses increase revenue while customers enjoy quality food at affordable prices—a win-win economic model that benefits all parties.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq-section">
        <div class="container">
            <div class="section-title">
                <h2>Frequently Asked Questions</h2>
                <p>Find answers to common questions about FoodSave</p>
            </div>

            <div class="faq-container">
                <div class="faq-item">
                    <div class="faq-question">
                        How do businesses add their surplus food?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">Businesses can easily create an account, then use our simple dashboard to add food items with descriptions, photos, quantities, and set pickup times. Our system guides you through the entire process.</div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        What types of food can be listed?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">Most prepared foods, baked goods, produce, and packaged items that are still safe for consumption can be listed. We provide detailed food safety guidelines to all our partner businesses.</div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        How does payment work?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">Customers pay securely through our platform using credit/debit cards or digital wallets. Businesses receive payments regularly, with transparent reporting and minimal processing fees.</div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        Is there a minimum order requirement?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">No, there's no minimum order requirement. However, some businesses may set their own minimums based on the value of the surplus food they're offering.</div>
                </div>

                <div class="faq-item">
                    <div class="faq-question">
                        How do I know the food is safe to eat?
                        <i class="fas fa-chevron-down faq-icon"></i>
                    </div>
                    <div class="faq-answer">All partner businesses agree to follow food safety guidelines and only list food that is fresh and safe for consumption. We also include user ratings and reviews for transparency.</div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="cta-section">
        <div class="container">
            <div class="cta-content">
                <h2 class="cta-title">Ready to Make a Difference?</h2>
                <p class="cta-text">Join thousands of businesses and customers already reducing food waste with FoodSave</p>
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
                        <div class="footer-logo-text">
                            Food<span>Save</span>
                        </div>
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
                        <li class="footer-link"><a href="hbusiness">For Businesses</a></li>
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
        
        // Process steps animation
        const processSteps = document.querySelectorAll('.process-step');
        
        function checkScroll() {
            processSteps.forEach(step => {
                const stepTop = step.getBoundingClientRect().top;
                const windowHeight = window.innerHeight;
                
                if (stepTop < windowHeight * 0.85) {
                    step.classList.add('visible');
                }
            });
        }
        
        window.addEventListener('scroll', checkScroll);
        window.addEventListener('load', checkScroll);
        
        // Audience tabs
        const audienceTabs = document.querySelectorAll('.audience-tab');
        
        audienceTabs.forEach(tab => {
            tab.addEventListener('click', () => {
                const target = tab.getAttribute('data-target');
                
                // Remove active class from all tabs
                audienceTabs.forEach(t => t.classList.remove('active'));
                
                // Add active class to clicked tab
                tab.classList.add('active');
                
                // Hide all content
                document.querySelectorAll('.audience-content').forEach(content => {
                    content.classList.remove('active');
                });
                
                // Show target content
                document.getElementById(`${target}-content`).classList.add('active');
            });
        });
        
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
    </script>
</body>
</html>
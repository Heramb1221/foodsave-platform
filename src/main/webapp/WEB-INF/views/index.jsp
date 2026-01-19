<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FoodSave - Reduce Food Waste, Save Money</title>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Open+Sans:wght@300;400;600&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

/* Hero Section */
.hero {
	padding: 160px 0 100px;
	background: linear-gradient(135deg, rgba(46, 139, 87, 0.9) 0%,
		rgba(78, 205, 196, 0.8) 100%);
	color: white;
	position: relative;
	overflow: hidden;
}

.hero:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background:
		url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="%23ffffff" fill-opacity="0.1" d="M0,128L48,117.3C96,107,192,85,288,112C384,139,480,213,576,218.7C672,224,768,160,864,138.7C960,117,1056,139,1152,149.3C1248,160,1344,160,1392,160L1440,160L1440,320L1392,320C1344,320,1248,320,1152,320C1056,320,960,320,864,320C768,320,672,320,576,320C480,320,384,320,288,320C192,320,96,320,48,320L0,320Z"></path></svg>');
	background-size: cover;
	background-position: center;
}

.hero-content {
	position: relative;
	z-index: 1;
	text-align: center;
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

/* Stats Section */
.stats {
	padding: 80px 0;
	background: white;
}

.stats-container {
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	gap: 30px;
}

.stat-item {
	text-align: center;
	padding: 30px;
	border-radius: 15px;
	background: var(--light);
	box-shadow: var(--shadow);
	transition: var(--transition);
	flex: 1;
	min-width: 200px;
}

.stat-item:hover {
	transform: translateY(-5px);
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

.stat-icon {
	font-size: 2.5rem;
	color: var(--primary);
	margin-bottom: 15px;
}

.stat-number {
	font-size: 2.5rem;
	font-weight: 700;
	color: var(--dark);
	margin-bottom: 10px;
	font-family: 'Poppins', sans-serif;
}

.stat-text {
	color: var(--gray);
	font-weight: 500;
}

/* How It Works */
.how-it-works {
	padding: 100px 0;
	background: var(--light-gray);
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

.steps {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
	gap: 30px;
}

.step {
	flex: 1;
	min-width: 250px;
	text-align: center;
	padding: 40px 30px;
	background: white;
	border-radius: 15px;
	box-shadow: var(--shadow);
	transition: var(--transition);
	position: relative;
}

.step:hover {
	transform: translateY(-10px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.step-number {
	position: absolute;
	top: -20px;
	left: 50%;
	transform: translateX(-50%);
	width: 40px;
	height: 40px;
	background: var(--primary);
	color: white;
	border-radius: 50%;
	display: flex;
	align-items: center;
	justify-content: center;
	font-weight: bold;
	font-size: 1.2rem;
}

.step-icon {
	font-size: 3rem;
	color: var(--primary);
	margin-bottom: 20px;
}

.step-title {
	font-family: 'Poppins', sans-serif;
	font-size: 1.5rem;
	margin-bottom: 15px;
	color: var(--dark);
}

.step-description {
	color: var(--gray);
}

/* Featured Businesses */
.featured-businesses {
	padding: 100px 0;
	background: white;
}

.businesses-grid {
	display: grid;
	grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
	gap: 30px;
}

.business-card {
	background: white;
	border-radius: 15px;
	overflow: hidden;
	box-shadow: var(--shadow);
	transition: var(--transition);
}

.business-card:hover {
	transform: translateY(-5px);
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
}

.business-image {
	height: 200px;
	background-color: var(--light-gray);
	background-position: center;
	background-size: cover;
	position: relative;
}

.business-type {
	position: absolute;
	top: 20px;
	right: 20px;
	background: var(--primary);
	color: white;
	padding: 5px 15px;
	border-radius: 20px;
	font-size: 0.8rem;
	font-weight: 500;
}

.business-info {
	padding: 25px;
}

.business-name {
	font-family: 'Poppins', sans-serif;
	font-size: 1.5rem;
	margin-bottom: 10px;
	color: var(--dark);
}

.business-location {
	color: var(--gray);
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.business-location i {
	margin-right: 8px;
	color: var(--primary);
}

.business-description {
	color: var(--gray);
	margin-bottom: 20px;
	line-height: 1.6;
}

.view-food-btn {
	display: inline-block;
	padding: 8px 20px;
	background: var(--primary);
	color: white;
	border-radius: 50px;
	text-decoration: none;
	font-weight: 500;
	transition: var(--transition);
}

.view-food-btn:hover {
	background: var(--secondary);
	transform: translateY(-2px);
}

/* Login Modal */
.modal {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.6);
	z-index: 1001;
	align-items: center;
	justify-content: center;
}

.modal-content {
	background: white;
	border-radius: 15px;
	width: 100%;
	max-width: 500px;
	padding: 40px;
	position: relative;
	box-shadow: 0 5px 30px rgba(0, 0, 0, 0.2);
	transform: translateY(50px);
	opacity: 0;
	transition: all 0.4s ease;
}

.modal.show .modal-content {
	transform: translateY(0);
	opacity: 1;
}

.close-modal {
	position: absolute;
	top: 20px;
	right: 20px;
	font-size: 1.5rem;
	cursor: pointer;
	color: var(--gray);
	transition: var(--transition);
}

.close-modal:hover {
	color: var(--danger);
	transform: rotate(90deg);
}

.modal-title {
	font-family: 'Poppins', sans-serif;
	font-size: 2rem;
	margin-bottom: 10px;
	color: var(--dark);
	text-align: center;
}

.modal-subtitle {
	color: var(--gray);
	text-align: center;
	margin-bottom: 30px;
}

.login-options {
	display: flex;
	justify-content: center;
	margin-bottom: 30px;
	border-radius: 50px;
	overflow: hidden;
	background: var(--light-gray);
	padding: 5px;
}

.login-option {
	padding: 10px 20px;
	cursor: pointer;
	text-align: center;
	flex: 1;
	transition: var(--transition);
	border-radius: 50px;
}

.login-option.active {
	background: var(--primary);
	color: white;
}

.login-form {
	display: none;
}

.login-form.active {
	display: block;
	animation: fadeIn 0.5s ease;
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
	border: 1px solid #ddd;
	border-radius: 8px;
	font-family: 'Open Sans', sans-serif;
	font-size: 16px;
	transition: var(--transition);
}

.form-control:focus {
	outline: none;
	border-color: var(--primary);
	box-shadow: 0 0 0 3px rgba(46, 139, 87, 0.2);
}

.btn-login-modal {
	width: 100%;
	padding: 12px;
	background: var(--primary);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 1.1rem;
	font-weight: 500;
	cursor: pointer;
	transition: var(--transition);
}

.btn-login-modal:hover {
	background: #24704a;
}

/* Signup modal styles */
.signup-options {
	display: flex;
	justify-content: space-between;
	margin: 15px 0;
	border-radius: 50px;
	overflow: hidden;
	background: var(--light-gray);
	padding: 5px;
}

.signup-option {
	padding: 10px 20px;
	cursor: pointer;
	text-align: center;
	flex: 1;
	transition: var(--transition);
	border-radius: 50px;
}

.signup-option.active {
	background: var(--primary);
	color: white;
}

.btn-signup-modal {
	width: 100%;
	padding: 12px;
	background: var(--primary);
	color: white;
	border: none;
	border-radius: 8px;
	font-size: 1.1rem;
	font-weight: 500;
	cursor: pointer;
	transition: var(--transition);
}

.btn-signup-modal:hover {
	background: #24704a;
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
	.hero-title {
		font-size: 2.8rem;
	}
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
	.hero-buttons {
		flex-direction: column;
		align-items: center;
	}
}

@media (max-width: 768px) {
	.hero-title {
		font-size: 2.2rem;
	}
	.hero-subtitle {
		font-size: 1.1rem;
	}
	.stat-item {
		min-width: 100%;
	}
	.step {
		min-width: 100%;
		margin-bottom: 40px;
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
			<a href="#" class="logo">
				<div class="logo-icon">FW</div>
				<div class="logo-text">
					Food<span>Save</span>
				</div>
			</a>

			<ul class="nav-menu">
				<li class="nav-item"><a href="index" class="nav-link">Home</a></li>
				<li class="nav-item"><a href="about" class="nav-link">About</a></li>
				<li class="nav-item"><a href="hbusiness" class="nav-link">Businesses</a></li>
				<li class="nav-item"><a href="working" class="nav-link">How
						It Works</a></li>
				<li class="nav-item"><a href="contact" class="nav-link">Contact</a></li>
			</ul>

			<div class="auth-buttons">
				<a href="#" class="btn btn-login" id="loginBtn">Login</a> 
				<a href="#" class="btn btn-signup" id="signupBtn">Sign Up</a>
			</div>

			<div class="hamburger" id="hamburger">
				<span class="bar"></span> <span class="bar"></span> <span
					class="bar"></span>
			</div>
		</div>
	</header>

	<!-- Hero Section -->
	<section class="hero">
		<div class="container hero-content">
			<h1 class="hero-title">Reduce Food Waste, Save Money &amp; Our
				Planet</h1>
			<p class="hero-subtitle">Connect with local businesses to rescue
				surplus food at discounted prices. Join the movement against food
				waste today!</p>
			<div class="hero-buttons">
				<a href="#" class="btn btn-hero-primary">Find Food Near Me</a> <a
					href="#" class="btn btn-hero-secondary">For Businesses</a>
			</div>
		</div>
	</section>

	<!-- Stats Section -->
	<section class="stats">
		<div class="container stats-container">
			<div class="stat-item">
				<div class="stat-icon">
					<i class="fas fa-utensils"></i>
				</div>
				<div class="stat-number">5,247</div>
				<div class="stat-text">Meals Saved</div>
			</div>

			<div class="stat-item">
				<div class="stat-icon">
					<i class="fas fa-store"></i>
				</div>
				<div class="stat-number">128</div>
				<div class="stat-text">Partner Businesses</div>
			</div>

			<div class="stat-item">
				<div class="stat-icon">
					<i class="fas fa-users"></i>
				</div>
				<div class="stat-number">3,851</div>
				<div class="stat-text">Happy Customers</div>
			</div>

			<div class="stat-item">
				<div class="stat-icon">
					<i class="fas fa-weight-hanging"></i>
				</div>
				<div class="stat-number">2.4T</div>
				<div class="stat-text">Food Waste Reduced</div>
			</div>
		</div>
	</section>

	<!-- How It Works Section -->
	<section class="how-it-works">
		<div class="container">
			<div class="section-title">
				<h2>How It Works</h2>
				<p>Join the movement in three simple steps to reduce food waste
					and enjoy great food at discounted prices</p>
			</div>

			<div class="steps">
				<div class="step">
					<div class="step-number">1</div>
					<div class="step-icon">
						<i class="fas fa-search"></i>
					</div>
					<h3 class="step-title">Browse Listings</h3>
					<p class="step-description">Explore surplus food offers from
						local restaurants, cafes, and bakeries near you.</p>
				</div>

				<div class="step">
					<div class="step-number">2</div>
					<div class="step-icon">
						<i class="fas fa-shopping-cart"></i>
					</div>
					<h3 class="step-title">Place Order</h3>
					<p class="step-description">Reserve your meal with a few clicks
						and pay online for a seamless experience.</p>
				</div>

				<div class="step">
					<div class="step-number">3</div>
					<div class="step-icon">
						<i class="fas fa-utensils"></i>
					</div>
					<h3 class="step-title">Enjoy & Save</h3>
					<p class="step-description">Pick up your order at the scheduled
						time and enjoy quality food while saving the planet.</p>
				</div>
			</div>
		</div>
	</section>

	<!-- Featured Businesses Section -->
	<section class="featured-businesses">
		<div class="container">
			<div class="section-title">
				<h2>Featured Businesses</h2>
				<p>Discover local establishments fighting food waste with
					delicious surplus offerings</p>
			</div>

			<div class="businesses-grid">
				<div class="business-card">
					<div class="business-image"
						style="background-image: url('https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8restaurantfDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');">
						<div class="business-type">Restaurant</div>
					</div>
					<div class="business-info">
						<h3 class="business-name">La Bella Vita</h3>
						<div class="business-location">
							<i class="fas fa-map-marker-alt"></i> <span>1.2 miles away</span>
						</div>
						<p class="business-description">Italian cuisine with daily
							surplus pasta, pizza, and desserts at 50% off.</p>
						<a href="#" class="view-food-btn">View Food</a>
					</div>
				</div>

				<div class="business-card">
					<div class="business-image"
						style="background-image: url('https://images.unsplash.com/photo-1554118811-1e0d58224f24?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8Y2FmZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60');">
						<div class="business-type">Cafe</div>
					</div>
					<div class="business-info">
						<h3 class="business-name">Morning Brew</h3>
						<div class="business-location">
							<i class="fas fa-map-marker-alt"></i> <span>0.8 miles away</span>
						</div>
						<p class="business-description">Artisan pastries, sandwiches,
							and coffee available before closing time.</p>
						<a href="#" class="view-food-btn">View Food</a>
					</div>
				</div>

				<div class="business-card">
					<div class="business-image"
						style="background-image: url('https://images.unsplash.com/photo-1603532648955-039310d9ed75?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8YmFrZXJ5fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60');">
						<div class="business-type">Bakery</div>
					</div>
					<div class="business-info">
						<h3 class="business-name">Sweet Delights</h3>
						<div class="business-location">
							<i class="fas fa-map-marker-alt"></i> <span>1.5 miles away</span>
						</div>
						<p class="business-description">Fresh bread, cakes, and
							pastries at discounted prices in the evening.</p>
						<a href="#" class="view-food-btn">View Food</a>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Login Modal -->
	<div class="modal" id="loginModal">
		<div class="modal-content">
			<span class="close-modal" id="closeModal">&times;</span>
			<h2 class="modal-title">Welcome Back</h2>
			<p class="modal-subtitle">Sign in to your account to continue</p>

			<div class="login-options">
				<div class="login-option active" data-target="customer">Customer</div>
				<div class="login-option" data-target="business">Business</div>
				<div class="login-option" data-target="admin">Admin</div>
			</div>

			<form class="login-form active" id="customerForm" action="customerLogin" method="POST">
				<div class="form-group">
					<label for="customerEmail">Email Address</label> <input
						type="email" class="form-control" id="customerEmail" name="customerEmail"
						placeholder="Enter your email">
				</div>
				<div class="form-group">
					<label for="customerPassword">Password</label> <input
						type="password" class="form-control" id="customerPassword" name="customerPassword"
						placeholder="Enter your password">
				</div>
				<button type="submit" class="btn-login-modal">Login as
					Customer</button>
			</form>

			<form class="login-form" id="businessForm" action="BusinessLogin" method="POST">
				<div class="form-group">
					<label for="businessEmail">Business Email</label> <input
						type="email" class="form-control" id="businessEmail" name="businessEmail"
						placeholder="Enter your business email">
				</div>
				<div class="form-group">
					<label for="businessPassword">Password</label> <input
						type="password" class="form-control" id="businessPassword" name="businessPassword"
						placeholder="Enter your password">
				</div>
				<button type="submit" class="btn-login-modal">Login as
					Business</button>
			</form>

			<form class="login-form" id="adminForm" action="AdminLogin"
				method="POST">
				<div class="form-group">
					<label for="adminEmail">Admin Email</label> <input type="email"
						class="form-control" id="adminEmail"
						placeholder="Enter your admin email" name="email">
				</div>
				<div class="form-group">
					<label for="adminPassword">Password</label> <input type="password"
						class="form-control" id="adminPassword"
						placeholder="Enter your password" name="password">
				</div>
				<button type="submit" class="btn-login-modal">Login as
					Admin</button>
			</form>
		</div>
	</div>

	<!-- Sign Up Modal -->
	<div class="modal" id="signupModal">
		<div class="modal-content">
			<span class="close-modal" id="closeSignupModal">&times;</span>
			<h2 class="modal-title">Create Your Account</h2>
			<p class="modal-subtitle">Join FoodSave today and start your
				journey</p>

			<div class="signup-options">
				<div class="signup-option active" data-target="signup-customer">Customer</div>
				<div class="signup-option" data-target="signup-business">Business</div>
			</div>

			<!-- Customer Signup Form -->
			<form class="login-form active" id="signup-customerForm" action="registerNewCustomer" method="POST">
				<div class="form-group">
					<label for="signupCustomerName">Name</label> <input type="text"
						class="form-control" id="signupCustomerName"
						placeholder="Enter your name" name="name">
				</div>
				<div class="form-group">
					<label for="signupCustomerEmail">Email</label> <input type="email"
						class="form-control" id="signupCustomerEmail"
						placeholder="Enter your email" name="email">
				</div>
				<div class="form-group">
					<label for="signupCustomerPhone">Phone</label> <input type="text"
						class="form-control" id="signupCustomerPhone"
						placeholder="Enter your phone" name="phone">
				</div>
				<div class="form-group">
					<label for="signupCustomerPassword">Password</label> <input
						type="password" class="form-control" id="signupCustomerPassword"
						placeholder="Enter your password" name="password">
				</div>
				<input type="hidden" name="role" value="CUSTOMER">
				<button type="submit" class="btn-signup-modal">Sign Up as
					Customer</button>
			</form>

			<!-- Business Signup Form -->
			<form class="login-form" id="signup-businessForm" action="registerBusiness" method="POST">
				<div class="form-group">
					<label for="signupBusinessName">Business Name</label> <input
						type="text" class="form-control" id="signupBusinessName"
						placeholder="Enter business name" name="name">
				</div>
				<div class="form-group">
					<label for="signupBusinessEmail">Business Email</label> <input
						type="email" class="form-control" id="signupBusinessEmail"
						placeholder="Enter business email" name="email">
				</div>
				<div class="form-group">
					<label for="signupBusinessPhone">Phone</label> <input type="text"
						class="form-control" id="signupBusinessPhone"
						placeholder="Enter business phone" name="phone">
				</div>
				<div class="form-group">
					<label for="signupBusinessPassword">Password</label> <input
						type="password" class="form-control" id="signupBusinessPassword"
						placeholder="Enter password" name="password">
				</div>
				<input type="hidden" name="role" value="BUSINESS">
				<button type="submit" class="btn-signup-modal">Sign Up as
					Business</button>
			</form>
		</div>
	</div>

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
					<p class="footer-description">Reducing food waste by connecting
						surplus food from businesses with customers at discounted prices.</p>
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
					<p>Subscribe to our newsletter to get updates on new features
						and food savings near you.</p>
					<form class="newsletter-form">
						<input type="email" class="newsletter-input"
							placeholder="Your Email Address">
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
        
        // Login Modal
        const loginBtn = document.getElementById("loginBtn");
        const loginModal = document.getElementById("loginModal");
        const closeModal = document.getElementById("closeModal");
        const loginOptions = document.querySelectorAll(".login-option");
        const loginForms = document.querySelectorAll(".login-form");
        
        loginBtn.addEventListener("click", (e) => {
            e.preventDefault();
            loginModal.style.display = "flex";
            setTimeout(() => {
                loginModal.classList.add("show");
            }, 10);
        });
        
        closeModal.addEventListener("click", () => {
            loginModal.classList.remove("show");
            setTimeout(() => {
                loginModal.style.display = "none";
            }, 400);
        });
        
        window.addEventListener("click", (e) => {
            if (e.target === loginModal) {
                loginModal.classList.remove("show");
                setTimeout(() => {
                    loginModal.style.display = "none";
                }, 400);
            }
        });
        
        // Switch between login forms
        loginOptions.forEach(option => {
            option.addEventListener("click", () => {
                const target = option.getAttribute("data-target");
                
                // Update active option
                loginOptions.forEach(opt => opt.classList.remove("active"));
                option.classList.add("active");
                
                // Show corresponding form
                loginForms.forEach(form => {
                    form.classList.remove("active");
                    if (form.id === target + "Form") {
                        form.classList.add("active");
                    }
                });
            });
        });
        
        // Signup Modal
        const signupBtn = document.getElementById("signupBtn");
        const signupModal = document.getElementById("signupModal");
        const closeSignupModal = document.getElementById("closeSignupModal");
        const signupOptions = document.querySelectorAll(".signup-option");
        const signupForms = document.querySelectorAll("#signup-customerForm, #signup-businessForm");
        
        signupBtn.addEventListener("click", (e) => {
            e.preventDefault();
            signupModal.style.display = "flex";
            setTimeout(() => {
                signupModal.classList.add("show");
            }, 10);
        });
        
        closeSignupModal.addEventListener("click", () => {
            signupModal.classList.remove("show");
            setTimeout(() => {
                signupModal.style.display = "none";
            }, 400);
        });
        
        window.addEventListener("click", (e) => {
            if (e.target === signupModal) {
                signupModal.classList.remove("show");
                setTimeout(() => {
                    signupModal.style.display = "none";
                }, 400);
            }
        });
        
        // Switch between signup forms
        signupOptions.forEach(option => {
            option.addEventListener("click", () => {
                const target = option.getAttribute("data-target");
                
                // Update active option
                signupOptions.forEach(opt => opt.classList.remove("active"));
                option.classList.add("active");
                
                // Show corresponding form
                signupForms.forEach(form => {
                    form.classList.remove("active");
                    if (form.id === target + "Form") {
                        form.classList.add("active");
                    }
                });
            });
        });
        
        window.addEventListener("scroll", animateStats);
        
        // Hero buttons
        const customerBtn = document.querySelector(".btn-hero-primary");
        const businessBtn = document.querySelector(".btn-hero-secondary");

        function openLogin(targetForm) {
            // Show modal
            loginModal.style.display = "flex";
            setTimeout(() => {
                loginModal.classList.add("show");
            }, 10);

            // Reset all options & forms
            loginOptions.forEach(opt => opt.classList.remove("active"));
            loginForms.forEach(form => form.classList.remove("active"));

            // Activate correct option + form
            const activeOption = document.querySelector('.login-option[data-target="' + targetForm + '"]');
            const activeForm = document.getElementById(targetForm + "Form");
            
            if (activeOption && activeForm) {
                activeOption.classList.add("active");
                activeForm.classList.add("active");
            }
        }

        // Attach listeners
        customerBtn.addEventListener("click", (e) => {
            e.preventDefault();
            openLogin("customer");
        });

        businessBtn.addEventListener("click", (e) => {
            e.preventDefault();
            openLogin("business");
        });
    </script>
</body>
</html>
# FoodSave

> Turning food surplus into community value.

A role-based web platform where food businesses list near-expiry surplus at discounts and customers rescue it before it's wasted — built on classical Java enterprise architecture.

![Java](https://img.shields.io/badge/Java-8-007396?style=flat-square&logo=java&logoColor=white)

![Spring](https://img.shields.io/badge/Spring_MVC-5.2-6DB33F?style=flat-square&logo=spring&logoColor=white)

![Hibernate](https://img.shields.io/badge/Hibernate-5.4-59666C?style=flat-square&logo=hibernate&logoColor=white)

![MySQL](https://img.shields.io/badge/MySQL-8.0-4479A1?style=flat-square&logo=mysql&logoColor=white)

![Maven](https://img.shields.io/badge/Maven-C71A36?style=flat-square&logo=apache-maven&logoColor=white)

![License](https://img.shields.io/badge/License-MIT-22bb33?style=flat-square)

![Status](https://img.shields.io/badge/Status-Prototype-f39c12?style=flat-square)

---

# Screenshots

| Preview | Description |
|---|---|
| <img width="1902" height="866" alt="image" src="https://github.com/user-attachments/assets/b0e7b386-84b7-4735-b350-59cf70017630" /> | Landing Page |
| <img width="1901" height="869" alt="image" src="https://github.com/user-attachments/assets/f4c51113-e7f7-4aa4-8899-3270ddfac72c" /> | Admin Dashboard |
| <img width="1898" height="870" alt="image" src="https://github.com/user-attachments/assets/8d28db40-de13-4f2c-a1b6-73107cab9fde" /> | Business Dashboard |
| <img width="1901" height="868" alt="image" src="https://github.com/user-attachments/assets/4c58d925-1407-4c15-b983-56ce322d74c7" /> | Inventory Management |
| <img width="1919" height="868" alt="image" src="https://github.com/user-attachments/assets/56e88484-8cb3-4597-9c5f-dd3f2d924fc2" /> | Business Orders View |

---

# About The Project

FoodSave is a full-stack Java web application that models a three-actor marketplace for food waste reduction.

Businesses register and list surplus food items with discounted pricing and expiry windows. Customers browse available listings and place pickup orders. Admins govern the platform by approving or rejecting business registrations before they can list food.

The project is built around the classical Java enterprise stack:

- Spring MVC for request handling
- Hibernate ORM for persistence
- MySQL as the relational database
- JSP for server-side rendering

The domain model uses enum-driven state machines to manage:

- Food lifecycle (`AVAILABLE → SOLD / EXPIRED`)
- Order lifecycle (`PENDING → COMPLETED / CANCELLED`)
- User approval states (`PENDING → APPROVED / REJECTED`)

---

# Project Type

**Full-Stack Monolithic Web Application**

- Spring MVC
- Hibernate ORM
- MySQL
- JSP Server-Side Rendering
- Apache Tomcat Deployment

---

# Project Status

## Experimental Prototype / Learning-Oriented Build

The core workflows are functional end-to-end:

- Business registration & approval
- Food listing creation
- Customer ordering
- Inventory adjustment
- Order status management

The project is not production-hardened. Known limitations and scalability concerns are documented transparently below.

---

# Why I Built This

Food waste introduces real business complexity:

- Multi-role systems
- Inventory management
- Lifecycle state transitions
- Access control
- Relational schema design

The project was intentionally built **without Spring Boot** to better understand:

- DispatcherServlet configuration
- SessionFactory setup
- HibernateTemplate integration
- XML-based Spring configuration
- Session-based authentication mechanics

---

# Features

## Core Features

- Three-role system:
  - Admin
  - Business
  - Customer

- Business onboarding workflow
- Food item lifecycle management
- Customer marketplace browsing
- Pickup order scheduling
- Inventory adjustment logic
- Admin approval system

---

## Engineering Features

- Enum-driven domain state machines
- Paginated HQL queries
- Parameterized HQL statements
- Automatic schema generation
- Inventory audit logs
- Analytics entity modeling
- Feedback system
- Payment entity modeling

---

## Architecture Features

- DAO pattern implementation
- Controller separation by role
- Redirect-after-POST workflow
- Centralized JSP view resolution

---

# Tech Stack

| Layer | Technology | Purpose |
|---|---|---|
| Language | Java 8 | Enterprise backend |
| Framework | Spring MVC 5.2 | MVC architecture |
| ORM | Hibernate 5.4 | Persistence layer |
| ORM Integration | spring-orm 5.2 | Transaction integration |
| Database | MySQL 8.0 | Relational database |
| Build Tool | Maven | Dependency management |
| Server | Apache Tomcat 9 | WAR deployment |
| View Layer | JSP | Server-side rendering |
| Styling | CSS + Font Awesome | UI styling |

---

# Architecture

```text
Browser
   ↓
Apache Tomcat
   ↓
DispatcherServlet
   ↓
Controllers
   ↓
DAO Layer
   ↓
Hibernate ORM
   ↓
MySQL Database
```

---

# Request Lifecycle

```text
Browser Request
    ↓
DispatcherServlet
    ↓
@Controller Handler
    ↓
DAO Layer
    ↓
HibernateTemplate
    ↓
MySQL
    ↓
JSP Rendering
    ↓
HTML Response
```

---

# Database Schema

## Users Table

```sql
users (
    id PK,
    name,
    email UNIQUE,
    phone UNIQUE,
    password,
    role ENUM,
    status ENUM
)
```

---

## Food Items Table

```sql
food_items (
    id PK,
    businessId FK,
    name,
    description,
    quantity,
    originalPrice,
    discountedPrice,
    category,
    image,
    availableTill,
    status ENUM
)
```

---

## Orders Table

```sql
orders (
    id PK,
    foodItemId FK,
    customerId FK,
    orderDate,
    pickupTime,
    quantity,
    totalAmount,
    status ENUM
)
```

---

# Folder Structure

```text
foodWaste/
├── pom.xml
├── src/
│   └── main/
│       ├── java/
│       │   ├── controller/
│       │   ├── dao/
│       │   ├── model/
│       │   └── enums/
│       └── webapp/
│           └── WEB-INF/
│               └── views/
└── target/
```

---

# Installation

## Prerequisites

- Java 8+
- Maven 3.6+
- MySQL 8.0
- Apache Tomcat 9

---

## 1. Clone Repository

```bash
git clone https://github.com/Heramb1221/foodsave-platform

cd foodsave-platform
```

---

## 2. Create Database

```sql
CREATE DATABASE foodsave;
```

---

## 3. Configure Database Credentials

Edit:

```text
src/main/java/config.xml
```

```xml
<property name="url" value="jdbc:mysql://localhost:3306/foodsave" />
<property name="username" value="your_mysql_username" />
<property name="password" value="your_mysql_password" />
```

---

## 4. Build WAR

```bash
mvn clean package
```

---

## 5. Deploy to Tomcat

Copy:

```text
target/foodWaste.war
```

to:

```text
TOMCAT_HOME/webapps/
```

Then start Tomcat.

---

## 6. Access Application

```text
http://localhost:8080/foodWaste
```

---

# Default Admin Credentials

```text
Email: admin@gmail.com
Password: admin
```

> Change these credentials before deployment.

---

# Usage

## Admin Flow

1. Login as admin
2. Review pending business approvals
3. Approve/reject registrations
4. Monitor platform statistics

---

## Business Flow

1. Register as business
2. Await admin approval
3. Add inventory items
4. Manage orders
5. Update inventory

---

## Customer Flow

1. Register account
2. Browse discounted food
3. Place pickup orders
4. View order history

---

# API Documentation

## Authentication

| Method | Endpoint | Description |
|---|---|---|
| POST | /AdminLogin | Admin authentication |
| POST | /BusinessLogin | Business authentication |
| POST | /customerLogin | Customer authentication |
| POST | /customerLogout | Session logout |

---

## Business Operations

| Method | Endpoint | Description |
|---|---|---|
| POST | /registerBusiness | Business registration |
| GET | /businessDashboard | Dashboard |
| GET | /inventory | Inventory page |
| POST | /addFoodItem | Create listing |
| GET | /businessOrders | Orders page |
| POST | /updateOrderStatus | Approve/cancel order |

---

## Customer Operations

| Method | Endpoint | Description |
|---|---|---|
| POST | /registerNewCustomer | Customer registration |
| GET | /customerDashboard | Browse listings |
| GET | /orderForm | Order form |
| POST | /placeOrder | Place order |
| GET | /customerOrders | Order history |

---

## Admin Operations

| Method | Endpoint | Description |
|---|---|---|
| GET | /admin | Admin dashboard |
| POST | /approveUser | Approve business |
| POST | /rejectUser | Reject business |

---

# Performance Considerations

## Implemented

- Paginated HQL queries
- O(1) lookup optimization using HashMaps
- Parameterized HQL statements

---

## Known Bottlenecks

- No database connection pooling
- N+1 query patterns
- `hibernate.show_sql=true` enabled
- Sequential dashboard queries

---

# Tradeoffs & Limitations

| Decision | Tradeoff |
|---|---|
| No Spring Boot | More educational but verbose |
| HibernateTemplate | Simpler but deprecated |
| JSP Scriptlets | Easy setup but poor separation |
| Session Auth | Simpler but not horizontally scalable |
| XML Config | Explicit but hard to maintain |

---

# Known Issues

- Race condition during inventory decrement
- Hardcoded admin login
- Missing business logout endpoint
- Package naming inconsistency
- DAOs stored in HTTP session
- Payments & feedback not wired to UI

---

# What I Learned

- Spring MVC internals
- DispatcherServlet lifecycle
- Hibernate SessionFactory behavior
- Relational schema normalization
- Domain state machine modeling
- Importance of service layers
- Session authentication pitfalls
- Enterprise Java architecture patterns

---

# Future Scope

- Spring Boot migration
- Spring Security integration
- Service layer implementation
- Bean validation
- Analytics dashboard
- Thymeleaf migration
- Docker containerization
- JUnit + Mockito testing
- REST API layer
- React/Vue frontend

---

# Contributing

```bash
# Fork repository
# Create feature branch
git checkout -b feature/your-feature

# Commit changes
git commit -m "Add: feature description"

# Push branch
git push origin feature/your-feature
```

Open a Pull Request describing the change and rationale.

---

# License

Distributed under the MIT License.

---

# Contact

**Heramb Chaudhari**

[![GitHub](https://img.shields.io/badge/GitHub-Heramb1221-black?style=for-the-badge&logo=github)](https://github.com/Heramb1221)

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Heramb%20Chaudhari-blue?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/heramb-chaudhari)

[![Email](https://img.shields.io/badge/Email-hchaudhari1221%40gmail.com-red?style=for-the-badge&logo=gmail)](mailto:hchaudhari1221@gmail.com)

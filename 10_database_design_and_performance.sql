-- DAY 10 - DATABASE DESIGN & PERFORMANCE
-- Database: database_design_db

CREATE DATABASE database_design_db;

USE database_design_db;


-- Departments table

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50) DEFAULT 'Delhi'
);

INSERT INTO Departments
(
    department_id,
    department_name,
    location
)
VALUES
    (1, 'IT', 'Delhi'),
    (2, 'HR', 'Noida'),
    (3, 'Finance', 'Mumbai'),
    (4, 'Sales', 'Bangalore'),
    (5, 'Marketing', 'Pune');


-- Employees table
-- One department can have many employees

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary DECIMAL(10,2) NOT NULL,
    department_id INT,
    joining_date DATE DEFAULT (CURRENT_DATE),

    CHECK (salary > 0),

    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

INSERT INTO Employees
(
    employee_id,
    employee_name,
    email,
    salary,
    department_id,
    joining_date
)
VALUES
    (101, 'Ranjeet Kumar', 'ranjeet@company.com', 55000, 1, '2023-01-15'),
    (102, 'Amit Sharma', 'amit@company.com', 72000, 1, '2022-06-10'),
    (103, 'Priya Singh', 'priya@company.com', 45000, 2, '2023-03-20'),
    (104, 'Rahul Verma', 'rahul@company.com', 78000, 2, '2021-08-12'),
    (105, 'Neha Gupta', 'neha@company.com', 52000, 3, '2022-01-25'),
    (106, 'Vikas Mehra', 'vikas@company.com', 90000, 3, '2020-11-05'),
    (107, 'Anjali Mehta', 'anjali@company.com', 42000, 4, '2023-05-18'),
    (108, 'Karan Malhotra', 'karan@company.com', 48000, 4, '2023-07-22'),
    (109, 'Pooja Agarwal', 'pooja@company.com', 85000, 4, '2021-04-14'),
    (110, 'Suresh Yadav', 'suresh@company.com', 47000, 5, '2022-09-30'),
    (111, 'Kavita Joshi', 'kavita@company.com', 50000, 5, '2023-02-11'),
    (112, 'Arjun Kapoor', 'arjun@company.com', 80000, 5, '2020-05-16');


-- Employee_Details table
-- One-to-One relationship with Employees

CREATE TABLE Employee_Details (
    employee_id INT PRIMARY KEY,
    phone VARCHAR(15) UNIQUE,
    address VARCHAR(200),
    city VARCHAR(50),
    emergency_contact VARCHAR(100),

    FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
);

INSERT INTO Employee_Details
(
    employee_id,
    phone,
    address,
    city,
    emergency_contact
)
VALUES
    (101, '9876500001', 'Delhi Address 1', 'Delhi', 'Family Contact 1'),
    (102, '9876500002', 'Delhi Address 2', 'Delhi', 'Family Contact 2'),
    (103, '9876500003', 'Noida Address 1', 'Noida', 'Family Contact 3'),
    (104, '9876500004', 'Noida Address 2', 'Noida', 'Family Contact 4'),
    (105, '9876500005', 'Mumbai Address 1', 'Mumbai', 'Family Contact 5'),
    (106, '9876500006', 'Mumbai Address 2', 'Mumbai', 'Family Contact 6'),
    (107, '9876500007', 'Bangalore Address 1', 'Bangalore', 'Family Contact 7'),
    (108, '9876500008', 'Bangalore Address 2', 'Bangalore', 'Family Contact 8'),
    (109, '9876500009', 'Pune Address 1', 'Pune', 'Family Contact 9'),
    (110, '9876500010', 'Pune Address 2', 'Pune', 'Family Contact 10'),
    (111, '9876500011', 'Delhi Address 3', 'Delhi', 'Family Contact 11'),
    (112, '9876500012', 'Delhi Address 4', 'Delhi', 'Family Contact 12');


-- Customers table

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    status VARCHAR(20) DEFAULT 'Active',

    CHECK (status IN ('Active', 'Inactive'))
);

INSERT INTO Customers
(
    customer_id,
    customer_name,
    email,
    city,
    status
)
VALUES
    (1, 'Aman Gupta', 'aman@gmail.com', 'Delhi', 'Active'),
    (2, 'Sneha Sharma', 'sneha@gmail.com', 'Noida', 'Active'),
    (3, 'Rohit Singh', 'rohit@gmail.com', 'Lucknow', 'Active'),
    (4, 'Kavita Verma', 'kavita@gmail.com', 'Mumbai', 'Inactive'),
    (5, 'Mohit Agarwal', 'mohit@gmail.com', 'Pune', 'Active'),
    (6, 'Anjali Gupta', 'anjali@gmail.com', 'Delhi', 'Active'),
    (7, 'Vivek Sharma', 'vivek@gmail.com', 'Jaipur', 'Inactive'),
    (8, 'Pooja Singh', 'pooja@gmail.com', 'Noida', 'Active');


-- Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT DEFAULT 0,

    CHECK (price > 0),
    CHECK (stock_quantity >= 0)
);

INSERT INTO Products
(
    product_id,
    product_name,
    category,
    price,
    stock_quantity
)
VALUES
    (201, 'Laptop', 'Electronics', 65000, 20),
    (202, 'Mouse', 'Accessories', 800, 100),
    (203, 'Keyboard', 'Accessories', 1500, 75),
    (204, 'Monitor', 'Electronics', 18000, 40),
    (205, 'Printer', 'Office', 12000, 25),
    (206, 'Headphones', 'Accessories', 2500, 60),
    (207, 'Tablet', 'Electronics', 28000, 30),
    (208, 'Webcam', 'Electronics', 4500, 50);


-- Orders table
-- One customer can have many orders

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE DEFAULT (CURRENT_DATE),
    order_status VARCHAR(30) DEFAULT 'Pending',

    CHECK (
        order_status IN
        (
            'Pending',
            'Completed',
            'Cancelled'
        )
    ),

    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id)
);

INSERT INTO Orders
(
    order_id,
    customer_id,
    order_date,
    order_status
)
VALUES
    (1001, 1, '2024-01-05', 'Completed'),
    (1002, 2, '2024-01-10', 'Completed'),
    (1003, 3, '2024-01-15', 'Completed'),
    (1004, 1, '2024-02-05', 'Completed'),
    (1005, 4, '2024-02-12', 'Cancelled'),
    (1006, 5, '2024-02-20', 'Pending'),
    (1007, 6, '2024-03-01', 'Completed'),
    (1008, 2, '2024-03-10', 'Completed'),
    (1009, 7, '2024-03-15', 'Completed'),
    (1010, 8, '2024-04-05', 'Completed'),
    (1011, 1, '2024-04-20', 'Completed'),
    (1012, 5, '2024-05-01', 'Completed');


-- Order_Details table
-- Junction between Orders and Products

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,

    CHECK (quantity > 0),
    CHECK (unit_price > 0),

    FOREIGN KEY (order_id)
        REFERENCES Orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

INSERT INTO Order_Details
(
    order_detail_id,
    order_id,
    product_id,
    quantity,
    unit_price
)
VALUES
    (1, 1001, 201, 1, 65000),
    (2, 1001, 202, 2, 800),

    (3, 1002, 204, 1, 18000),
    (4, 1002, 206, 2, 2500),

    (5, 1003, 207, 1, 28000),
    (6, 1003, 203, 2, 1500),

    (7, 1004, 205, 1, 12000),
    (8, 1004, 202, 5, 800),

    (9, 1005, 201, 1, 65000),

    (10, 1006, 208, 2, 4500),

    (11, 1007, 204, 2, 18000),
    (12, 1007, 206, 1, 2500),

    (13, 1008, 201, 1, 65000),
    (14, 1008, 203, 1, 1500),

    (15, 1009, 202, 10, 800),
    (16, 1009, 206, 2, 2500),

    (17, 1010, 207, 1, 28000),
    (18, 1010, 208, 1, 4500),

    (19, 1011, 201, 1, 65000),
    (20, 1011, 204, 1, 18000),

    (21, 1012, 205, 2, 12000),
    (22, 1012, 202, 5, 800);


-- Students table
-- Used for Many-to-Many relationship

CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Students
(
    student_id,
    student_name,
    email
)
VALUES
    (1, 'Ranjeet Kumar', 'ranjeet@student.com'),
    (2, 'Amit Sharma', 'amit@student.com'),
    (3, 'Priya Singh', 'priya@student.com'),
    (4, 'Rahul Verma', 'rahul@student.com'),
    (5, 'Neha Gupta', 'neha@student.com');


-- Courses table
-- Used for Many-to-Many relationship

CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL UNIQUE,
    course_fee DECIMAL(10,2) NOT NULL,

    CHECK (course_fee >= 0)
);

INSERT INTO Courses
(
    course_id,
    course_name,
    course_fee
)
VALUES
    (101, 'SQL', 5000),
    (102, 'Python', 6000),
    (103, 'Power BI', 5500),
    (104, 'Machine Learning', 8000);


-- Student_Courses table
-- Junction / Bridge table
-- Creates Many-to-Many relationship

CREATE TABLE Student_Courses (
    student_id INT,
    course_id INT,
    enrollment_date DATE DEFAULT (CURRENT_DATE),

    PRIMARY KEY (student_id, course_id),

    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),

    FOREIGN KEY (course_id)
        REFERENCES Courses(course_id)
);

INSERT INTO Student_Courses
(
    student_id,
    course_id,
    enrollment_date
)
VALUES
    (1, 101, '2024-01-10'),
    (1, 102, '2024-01-10'),
    (1, 104, '2024-01-15'),

    (2, 101, '2024-01-12'),
    (2, 103, '2024-01-12'),

    (3, 102, '2024-01-15'),
    (3, 103, '2024-01-15'),

    (4, 101, '2024-01-20'),
    (4, 104, '2024-01-20'),

    (5, 102, '2024-01-25'),
    (5, 103, '2024-01-25');


-- Check tables

SHOW TABLES;


-- Check departments

SELECT *
FROM Departments;


-- Check employees

SELECT *
FROM Employees;


-- Check employee details

SELECT *
FROM Employee_Details;


-- Check customers

SELECT *
FROM Customers;


-- Check products

SELECT *
FROM Products;


-- Check orders

SELECT *
FROM Orders;


-- Check order details

SELECT *
FROM Order_Details;


-- Check students

SELECT *
FROM Students;


-- Check courses

SELECT *
FROM Courses;


-- Check student courses

SELECT *
FROM Student_Courses;


-- Check Employee and Department relationship

SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name,
    d.location
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;


-- Check One-to-One relationship

SELECT
    e.employee_id,
    e.employee_name,
    e.email,
    ed.phone,
    ed.address,
    ed.city
FROM Employees e
JOIN Employee_Details ed
    ON e.employee_id = ed.employee_id;


-- Check One-to-Many relationship

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_status
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id;


-- Check Many-to-Many relationship

SELECT
    s.student_id,
    s.student_name,
    c.course_id,
    c.course_name
FROM Students s
JOIN Student_Courses sc
    ON s.student_id = sc.student_id
JOIN Courses c
    ON sc.course_id = c.course_id;
    
    SHOW TABLES;
    
    
    
    # -- Chapter 30 — Relationships & Referential Integrity

USE database_design_db;

-- Primary Key
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees;

-- Foreign Key
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;

-- UNIQUE constraint
-- Email values must be unique
SELECT
    employee_id,
    employee_name,
    email
FROM Employees;

-- NOT NULL constraint
-- employee_name cannot contain NULL
SELECT
    employee_id,
    employee_name
FROM Employees
WHERE employee_name IS NOT NULL;

-- DEFAULT constraint
-- Check the default status of customers
SELECT
    customer_id,
    customer_name,
    status
FROM Customers;

-- CHECK constraint
-- Salary must be greater than 0
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > 0;

-- CHECK constraint
-- Product price must be greater than 0
SELECT
    product_id,
    product_name,
    price
FROM Products
WHERE price > 0;

-- One-to-One relationship
-- One employee has one employee detail record
SELECT
    e.employee_id,
    e.employee_name,
    ed.phone,
    ed.address,
    ed.city
FROM Employees e
JOIN Employee_Details ed
    ON e.employee_id = ed.employee_id;

-- One-to-Many relationship
-- One customer can have many orders
SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_status
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id
ORDER BY c.customer_id;

-- Many-to-Many relationship
-- One student can take many courses
-- One course can have many students
SELECT
    s.student_id,
    s.student_name,
    c.course_id,
    c.course_name
FROM Students s
JOIN Student_Courses sc
    ON s.student_id = sc.student_id
JOIN Courses c
    ON sc.course_id = c.course_id;

-- Junction / Bridge table
-- Student_Courses connects Students and Courses
SELECT
    sc.student_id,
    sc.course_id,
    sc.enrollment_date
FROM Student_Courses sc;

-- Referential integrity
-- This works because department_id = 1 exists
INSERT INTO Employees
(employee_id, employee_name, email, salary, department_id, joining_date)
VALUES
(113, 'Test Employee', 'test@company.com', 40000, 1, '2024-06-01');

SELECT *
FROM Employees
WHERE employee_id = 113;

-- Remove test record
DELETE FROM Employees
WHERE employee_id = 113;

-- Referential integrity prevents invalid foreign key values
-- The following query would fail because department_id = 99 does not exist

-- INSERT INTO Employees
-- (employee_id, employee_name, email, salary, department_id)
-- VALUES
-- (114, 'Invalid Employee', 'invalid@company.com', 40000, 99);

-- Check foreign key relationship
SELECT
    e.employee_id,
    e.employee_name,
    e.department_id,
    d.department_name
FROM Employees e
LEFT JOIN Departments d
    ON e.department_id = d.department_id;
    
    
    
    #-- Chapter 31 — Normalization

USE database_design_db;

-- Check normalized Departments table
SELECT
    department_id,
    department_name,
    location
FROM Departments;

-- Check normalized Employees table
SELECT
    employee_id,
    employee_name,
    email,
    salary,
    department_id
FROM Employees;

-- 1NF
-- Each column contains atomic values
SELECT
    employee_id,
    employee_name,
    email,
    salary
FROM Employees;

-- Example of normalized employee data
-- One employee is stored in one row
SELECT *
FROM Employees;

-- 2NF
-- Employee information is stored separately
-- Department information is stored separately

SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_id,
    d.department_name,
    d.location
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;

-- 3NF
-- Department details depend on department_id
-- Employee details depend on employee_id

SELECT
    e.employee_id,
    e.employee_name,
    e.department_id,
    d.department_name,
    d.location
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;

-- Separate employee details table
-- Employee details depend on employee_id
SELECT
    e.employee_id,
    e.employee_name,
    ed.phone,
    ed.address,
    ed.city
FROM Employees e
JOIN Employee_Details ed
    ON e.employee_id = ed.employee_id;

-- Normalized customer and order structure
-- Customer data is stored in Customers
-- Order data is stored in Orders

SELECT
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date,
    o.order_status
FROM Customers c
JOIN Orders o
    ON c.customer_id = o.customer_id;

-- Normalized order and product structure
-- Orders, Products and Order_Details are separate

SELECT
    o.order_id,
    o.order_date,
    p.product_name,
    od.quantity,
    od.unit_price
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
JOIN Products p
    ON od.product_id = p.product_id;

-- Many-to-many normalized structure
SELECT
    s.student_name,
    c.course_name,
    sc.enrollment_date
FROM Students s
JOIN Student_Courses sc
    ON s.student_id = sc.student_id
JOIN Courses c
    ON sc.course_id = c.course_id;

-- Example of denormalized data
-- Department information is repeated for every employee

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    d.location
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;

-- Normalization reduces data redundancy
-- It also helps avoid:
-- Insert anomaly
-- Update anomaly
-- Delete anomaly

-- Count employees by department
SELECT
    d.department_name,
    COUNT(e.employee_id) AS employee_count
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name;
    
    
# -- Chapter 32 — Indexes

USE database_design_db;

-- View existing indexes
SHOW INDEX FROM Employees;

-- View indexes on Products
SHOW INDEX FROM Products;

-- Create a single-column index
CREATE INDEX idx_employee_salary
ON Employees(salary);

-- Check the created index
SHOW INDEX FROM Employees;

-- Use indexed column in filtering
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > 70000;

-- Create index on department_id
CREATE INDEX idx_employee_department
ON Employees(department_id);

-- Query using department_id
SELECT
    employee_id,
    employee_name,
    department_id
FROM Employees
WHERE department_id = 1;

-- Create a composite index
-- Index contains department_id and salary
CREATE INDEX idx_department_salary
ON Employees(department_id, salary);

-- Query using the composite index columns
SELECT
    employee_id,
    employee_name,
    department_id,
    salary
FROM Employees
WHERE department_id = 1
AND salary > 50000;

-- Another useful index
CREATE INDEX idx_product_category
ON Products(category);

-- Search products by category
SELECT
    product_id,
    product_name,
    category,
    price
FROM Products
WHERE category = 'Electronics';

-- Primary key automatically has an index
SHOW INDEX FROM Departments;

-- UNIQUE columns automatically have a unique index
SHOW INDEX FROM Employees;

-- Check all Employee indexes
SHOW INDEX FROM Employees;

-- Drop single-column index
DROP INDEX idx_employee_salary
ON Employees;

-- Check indexes after dropping
SHOW INDEX FROM Employees;

-- Drop composite index
DROP INDEX idx_department_salary
ON Employees;

-- Check remaining indexes
SHOW INDEX FROM Employees;


# -- Chapter 33 — Query Performance & Optimization

USE database_design_db;

-- Basic query
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees;

-- Avoid SELECT *
-- Better: select only required columns
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees;

-- Efficient filtering
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > 70000;

-- Multiple filters
SELECT
    employee_id,
    employee_name,
    salary,
    department_id
FROM Employees
WHERE department_id = 1
AND salary > 50000;

-- Check query execution plan
EXPLAIN
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE department_id = 1;

-- Create index for filtering
CREATE INDEX idx_perf_department
ON Employees(department_id);

-- Check execution plan again
EXPLAIN
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE department_id = 1;

-- Check execution plan for salary filtering
EXPLAIN
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > 70000;

-- Create index on salary
CREATE INDEX idx_perf_salary
ON Employees(salary);

-- Check execution plan again
EXPLAIN
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > 70000;

-- Efficient JOIN
EXPLAIN
SELECT
    e.employee_id,
    e.employee_name,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;

-- Filter before returning unnecessary rows
SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
WHERE e.salary > 70000;

-- Use LIMIT when only a few rows are required
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- Use an indexed column for filtering
SELECT
    employee_id,
    employee_name,
    department_id
FROM Employees
WHERE department_id = 1;

-- Check table statistics
ANALYZE TABLE Employees;

-- Check table information
SHOW TABLE STATUS LIKE 'Employees';

-- Check indexes
SHOW INDEX FROM Employees;

-- Remove performance-practice indexes if needed
DROP INDEX idx_perf_department
ON Employees;

DROP INDEX idx_perf_salary
ON Employees;


# -- Chapter 34 — Set Operations

USE database_design_db;

-- UNION
-- Combines results and removes duplicates

SELECT
    city
FROM Employees

UNION

SELECT
    city
FROM Customers;

-- UNION ALL
-- Combines results and keeps duplicates

SELECT
    city
FROM Employees

UNION ALL

SELECT
    city
FROM Customers;

-- UNION vs UNION ALL
-- UNION removes duplicate rows
-- UNION ALL keeps duplicate rows

-- UNION with matching columns

SELECT
    employee_name AS person_name,
    city
FROM Employees

UNION

SELECT
    customer_name AS person_name,
    city
FROM Customers;

-- UNION ALL with matching columns

SELECT
    employee_name AS person_name,
    city
FROM Employees

UNION ALL

SELECT
    customer_name AS person_name,
    city
FROM Customers;

-- UNION with filtering

SELECT
    employee_name AS name,
    city
FROM Employees
WHERE city = 'Delhi'

UNION

SELECT
    customer_name AS name,
    city
FROM Customers
WHERE city = 'Delhi';

-- INTERSECT
-- Returns rows common to both result sets

SELECT
    city
FROM Employees

INTERSECT

SELECT
    city
FROM Customers;

-- INTERSECT with employee/customer names
-- Returns exact matching names, if any

SELECT
    employee_name AS name
FROM Employees

INTERSECT

SELECT
    customer_name AS name
FROM Customers;

-- EXCEPT
-- Returns rows from the first query
-- that are not present in the second query

SELECT
    city
FROM Employees

EXCEPT

SELECT
    city
FROM Customers;

-- EXCEPT in reverse direction

SELECT
    city
FROM Customers

EXCEPT

SELECT
    city
FROM Employees;

-- Set operations require compatible columns
-- Number of columns must match

SELECT
    department_id,
    department_name
FROM Departments

UNION

SELECT
    course_id,
    course_name
FROM Courses;

-- ORDER BY is applied to the final result

SELECT
    city
FROM Employees

UNION

SELECT
    city
FROM Customers

ORDER BY city;

-- LIMIT can be applied to the final result

SELECT
    city
FROM Employees

UNION

SELECT
    city
FROM Customers

ORDER BY city
LIMIT 5;



#-- Chapter 35 — Temporary Tables

USE database_design_db;

-- Create a temporary table
CREATE TEMPORARY TABLE Temp_Employees (
    employee_id INT,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT
);

-- Insert data into temporary table
INSERT INTO Temp_Employees
(employee_id, employee_name, salary, department_id)
SELECT
    employee_id,
    employee_name,
    salary,
    department_id
FROM Employees
WHERE salary > 70000;

-- View temporary table
SELECT *
FROM Temp_Employees;

-- Use temporary table in another query
SELECT
    employee_id,
    employee_name,
    salary
FROM Temp_Employees
WHERE salary > 80000;

-- Join temporary table with Departments
SELECT
    t.employee_id,
    t.employee_name,
    t.salary,
    d.department_name
FROM Temp_Employees t
JOIN Departments d
    ON t.department_id = d.department_id;

-- Aggregate temporary table data
SELECT
    department_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Temp_Employees
GROUP BY department_id;

-- Create temporary table from a query
CREATE TEMPORARY TABLE Temp_High_Value_Orders AS
SELECT
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status,
    SUM(od.quantity * od.unit_price) AS order_value
FROM Orders o
JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    o.order_date,
    o.order_status;

-- View temporary order table
SELECT *
FROM Temp_High_Value_Orders;

-- Filter temporary table
SELECT *
FROM Temp_High_Value_Orders
WHERE order_value > 50000;

-- Join temporary table with Customers
SELECT
    t.order_id,
    c.customer_name,
    t.order_value
FROM Temp_High_Value_Orders t
JOIN Customers c
    ON t.customer_id = c.customer_id
ORDER BY t.order_value DESC;

-- Drop temporary tables
DROP TEMPORARY TABLE Temp_Employees;

DROP TEMPORARY TABLE Temp_High_Value_Orders;


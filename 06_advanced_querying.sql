-- Day 6: Advanced Querying Database

CREATE DATABASE advanced_sql_db;

USE advanced_sql_db;


-- Departments table

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
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

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    job_title VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    joining_date DATE,
    manager_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

INSERT INTO Employees
(
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id,
    joining_date,
    manager_id
)
VALUES
    (101, 'Ranjeet Kumar', 'Data Analyst', 55000, 1, '2023-01-15', NULL),
    (102, 'Amit Sharma', 'Software Engineer', 72000, 1, '2022-06-10', 101),
    (103, 'Priya Singh', 'HR Executive', 45000, 2, '2023-03-20', NULL),
    (104, 'Rahul Verma', 'HR Manager', 78000, 2, '2021-08-12', NULL),
    (105, 'Neha Gupta', 'Accountant', 52000, 3, '2022-01-25', 106),
    (106, 'Vikas Mehra', 'Finance Manager', 90000, 3, '2020-11-05', NULL),
    (107, 'Anjali Mehta', 'Sales Executive', 42000, 4, '2023-05-18', 109),
    (108, 'Karan Malhotra', 'Sales Executive', 48000, 4, '2023-07-22', 109),
    (109, 'Pooja Agarwal', 'Sales Manager', 85000, 4, '2021-04-14', NULL),
    (110, 'Suresh Yadav', 'Marketing Executive', 47000, 5, '2022-09-30', 112),
    (111, 'Kavita Joshi', 'Marketing Executive', 50000, 5, '2023-02-11', 112),
    (112, 'Arjun Kapoor', 'Marketing Manager', 80000, 5, '2020-05-16', NULL);


-- Customers table

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO Customers
(
    customer_id,
    customer_name,
    email,
    city,
    signup_date
)
VALUES
    (1, 'Aman Gupta', 'aman@gmail.com', 'Delhi', '2023-01-10'),
    (2, 'Sneha Sharma', 'sneha@gmail.com', 'Noida', '2023-02-15'),
    (3, 'Rohit Singh', 'rohit@gmail.com', 'Lucknow', '2023-03-20'),
    (4, 'Kavita Verma', 'kavita@gmail.com', 'Mumbai', '2023-04-25'),
    (5, 'Mohit Agarwal', 'mohit@gmail.com', 'Pune', '2023-05-12'),
    (6, 'Anjali Gupta', 'anjali@gmail.com', 'Delhi', '2023-06-18'),
    (7, 'Vivek Sharma', 'vivek@gmail.com', 'Jaipur', '2023-07-22'),
    (8, 'Pooja Singh', 'pooja@gmail.com', 'Noida', '2023-08-30'),
    (9, 'Saurabh Jain', 'saurabh@gmail.com', 'Delhi', '2023-09-15'),
    (10, 'Meena Joshi', 'meena@gmail.com', 'Chandigarh', '2023-10-10');


-- Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    price DECIMAL(10,2),
    stock_quantity INT
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

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
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
    (1005, 4, '2024-02-12', 'Completed'),
    (1006, 5, '2024-02-20', 'Pending'),
    (1007, 6, '2024-03-01', 'Completed'),
    (1008, 2, '2024-03-10', 'Completed'),
    (1009, 7, '2024-03-15', 'Completed'),
    (1010, 8, '2024-04-05', 'Completed'),
    (1011, 1, '2024-04-20', 'Completed'),
    (1012, 9, '2024-05-01', 'Completed'),
    (1013, 3, '2024-05-15', 'Pending'),
    (1014, 5, '2024-06-01', 'Completed'),
    (1015, 2, '2024-06-10', 'Completed');


-- Order_Details table

CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

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
    (22, 1012, 202, 5, 800),

    (23, 1013, 206, 3, 2500),

    (24, 1014, 207, 2, 28000),
    (25, 1014, 203, 3, 1500),

    (26, 1015, 201, 1, 65000),
    (27, 1015, 206, 2, 2500);


-- Check tables

SHOW TABLES;


-- Check data

SELECT * FROM Departments;

SELECT * FROM Employees;

SELECT * FROM Customers;

SELECT * FROM Products;

SELECT * FROM Orders;

SELECT * FROM Order_Details;


-- Chapter 21: Subqueries

USE advanced_sql_db;

-- What is a subquery?

-- A subquery is a query written inside another SQL query.

-- Basic structure

SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


-- Why subqueries are used

-- Subqueries are useful when the result of one query
-- is required by another query.


-- Subquery in SELECT

-- Find each employee's salary and company average salary.

SELECT
    employee_name,
    salary,
    (
        SELECT AVG(salary)
        FROM Employees
    ) AS average_salary
FROM Employees;


-- Subquery in WHERE

-- Find employees earning above average salary.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


-- Single-row subquery

-- A single-row subquery returns one value.

-- Find the employee with the maximum salary.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
);


-- Find employees earning the minimum salary.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary = (
    SELECT MIN(salary)
    FROM Employees
);


-- Multiple-row subquery

-- A multiple-row subquery returns multiple values.

-- Find employees who belong to departments
-- located in Delhi or Noida.

SELECT
    employee_name,
    department_id
FROM Employees
WHERE department_id IN (
    SELECT department_id
    FROM Departments
    WHERE location IN ('Delhi', 'Noida')
);


-- IN with subquery

-- Find employees working in departments
-- whose names are IT or Finance.

SELECT
    employee_id,
    employee_name,
    department_id
FROM Employees
WHERE department_id IN (
    SELECT department_id
    FROM Departments
    WHERE department_name IN ('IT', 'Finance')
);


-- Find employees working in departments
-- located in Mumbai.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE department_id IN (
    SELECT department_id
    FROM Departments
    WHERE location = 'Mumbai'
);


-- EXISTS

-- EXISTS checks whether the subquery returns
-- at least one row.

-- Find customers who have placed an order.

SELECT
    customer_id,
    customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
);


-- Find customers who have completed orders.

SELECT
    customer_id,
    customer_name
FROM Customers c
WHERE EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.customer_id = c.customer_id
      AND o.order_status = 'Completed'
);


-- Find departments having employees.

SELECT
    department_id,
    department_name
FROM Departments d
WHERE EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.department_id = d.department_id
);


-- Find departments without employees.

SELECT
    department_id,
    department_name
FROM Departments d
WHERE NOT EXISTS (
    SELECT 1
    FROM Employees e
    WHERE e.department_id = d.department_id
);


-- Aggregate subqueries

-- Find employees whose salary is greater than
-- the average salary.

SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


-- Find employees whose salary equals
-- the maximum salary.

SELECT
    employee_name,
    salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
);


-- Find employees whose salary is less than
-- the average salary.

SELECT
    employee_name,
    salary
FROM Employees
WHERE salary < (
    SELECT AVG(salary)
    FROM Employees
);


-- Correlated subqueries

-- A correlated subquery depends on the outer query.

-- Find employees earning more than the average salary
-- of their own department.

SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    e.department_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.department_id = e.department_id
);


-- Find employees earning the highest salary
-- in their own department.

SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    e.department_id
FROM Employees e
WHERE e.salary = (
    SELECT MAX(e2.salary)
    FROM Employees e2
    WHERE e2.department_id = e.department_id
);


-- Find employees who earn more than their manager.

SELECT
    e.employee_name AS employee,
    e.salary AS employee_salary,
    m.employee_name AS manager,
    m.salary AS manager_salary
FROM Employees e
JOIN Employees m
    ON e.manager_id = m.employee_id
WHERE e.salary > m.salary;


-- Above-average salary

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
)
ORDER BY salary DESC;


-- Maximum salary

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
);


-- Second-highest salary

SELECT
    MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < (
    SELECT MAX(salary)
    FROM Employees
);


-- Employees having the second-highest salary

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary = (
    SELECT MAX(salary)
    FROM Employees
    WHERE salary < (
        SELECT MAX(salary)
        FROM Employees
    )
);


-- Employees by department

-- Find employees belonging to the IT department.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE department_id = (
    SELECT department_id
    FROM Departments
    WHERE department_name = 'IT'
);


-- Find employees belonging to IT or Finance.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE department_id IN (
    SELECT department_id
    FROM Departments
    WHERE department_name IN ('IT', 'Finance')
);


-- Find employees earning more than
-- the average salary of the IT department.

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE department_id = (
        SELECT department_id
        FROM Departments
        WHERE department_name = 'IT'
    )
);


-- Customers with orders

SELECT
    customer_id,
    customer_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
);


-- Customers without orders

SELECT
    customer_id,
    customer_name
FROM Customers
WHERE customer_id NOT IN (
    SELECT customer_id
    FROM Orders
);


-- Customers with completed orders

SELECT
    customer_id,
    customer_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    WHERE order_status = 'Completed'
);


-- Customers having more than one order

SELECT
    customer_id,
    customer_name
FROM Customers
WHERE customer_id IN (
    SELECT customer_id
    FROM Orders
    GROUP BY customer_id
    HAVING COUNT(order_id) > 1
);


-- Subquery vs JOIN

-- Using a subquery

SELECT
    employee_name,
    salary
FROM Employees
WHERE department_id = (
    SELECT department_id
    FROM Departments
    WHERE department_name = 'IT'
);


-- Using JOIN

SELECT
    e.employee_name,
    e.salary
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
WHERE d.department_name = 'IT';


-- Subquery in FROM

-- The result of a subquery can act as a temporary table.

SELECT
    department_id,
    average_salary
FROM (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department_id
) AS department_salary;


-- Department-wise average salary
-- and employees earning above that average.

SELECT
    e.employee_name,
    e.salary,
    e.department_id
FROM Employees e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.department_id, e.salary DESC;


-- Complete subquery example

SELECT
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM Employees e2
    WHERE e2.department_id = e.department_id
)
ORDER BY e.salary DESC;


-- Chapter 22: Common Table Expressions

USE advanced_sql_db;

-- What is CTE?

-- CTE stands for Common Table Expression.
-- It creates a temporary named result set
-- that can be used by the main query.

-- Why CTE is useful

-- CTE makes complex queries easier to read,
-- understand and maintain.


-- WITH clause

-- Basic CTE syntax

WITH cte_name AS (
    SELECT ...
)
SELECT *
FROM cte_name;


-- CTE with SELECT

WITH employee_data AS (
    SELECT
        employee_id,
        employee_name,
        salary
    FROM Employees
)
SELECT *
FROM employee_data;


-- CTE with WHERE

WITH high_salary_employees AS (
    SELECT
        employee_id,
        employee_name,
        salary
    FROM Employees
    WHERE salary > 70000
)
SELECT *
FROM high_salary_employees;


-- CTE with GROUP BY

WITH department_salary AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department_id
)
SELECT *
FROM department_salary;


-- CTE with JOIN

WITH employee_data AS (
    SELECT
        employee_id,
        employee_name,
        salary,
        department_id
    FROM Employees
)
SELECT
    e.employee_name,
    e.salary,
    d.department_name
FROM employee_data e
JOIN Departments d
    ON e.department_id = d.department_id;


-- CTE with aggregates

WITH department_statistics AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees,
        SUM(salary) AS total_salary,
        AVG(salary) AS average_salary,
        MIN(salary) AS minimum_salary,
        MAX(salary) AS maximum_salary
    FROM Employees
    GROUP BY department_id
)
SELECT
    ds.department_id,
    d.department_name,
    ds.total_employees,
    ds.total_salary,
    ds.average_salary,
    ds.minimum_salary,
    ds.maximum_salary
FROM department_statistics ds
JOIN Departments d
    ON ds.department_id = d.department_id;


-- Multiple CTEs

WITH employee_data AS (
    SELECT
        employee_id,
        employee_name,
        salary,
        department_id
    FROM Employees
),

department_data AS (
    SELECT
        department_id,
        department_name,
        location
    FROM Departments
)

SELECT
    e.employee_name,
    e.salary,
    d.department_name,
    d.location
FROM employee_data e
JOIN department_data d
    ON e.department_id = d.department_id;


-- Multiple CTEs with aggregates

WITH department_salary AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department_id
),

department_employee_count AS (
    SELECT
        department_id,
        COUNT(*) AS total_employees
    FROM Employees
    GROUP BY department_id
)

SELECT
    d.department_name,
    ds.average_salary,
    dec.total_employees
FROM Departments d
JOIN department_salary ds
    ON d.department_id = ds.department_id
JOIN department_employee_count dec
    ON d.department_id = dec.department_id;


-- CTE for above-average employees

WITH average_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
)
SELECT
    e.employee_name,
    e.salary,
    a.avg_salary
FROM Employees e
CROSS JOIN average_salary a
WHERE e.salary > a.avg_salary;


-- CTE for department-wise salary

WITH department_salary AS (
    SELECT
        department_id,
        AVG(salary) AS average_salary
    FROM Employees
    GROUP BY department_id
)
SELECT
    d.department_name,
    ds.average_salary
FROM Departments d
JOIN department_salary ds
    ON d.department_id = ds.department_id
ORDER BY ds.average_salary DESC;


-- CTE with WHERE and GROUP BY

WITH department_sales AS (
    SELECT
        o.customer_id,
        COUNT(o.order_id) AS total_orders
    FROM Orders o
    WHERE o.order_status = 'Completed'
    GROUP BY o.customer_id
)
SELECT
    c.customer_name,
    ds.total_orders
FROM Customers c
JOIN department_sales ds
    ON c.customer_id = ds.customer_id
ORDER BY ds.total_orders DESC;


-- CTE for order totals

WITH order_totals AS (
    SELECT
        od.order_id,
        SUM(
            od.quantity * od.unit_price
        ) AS order_total
    FROM Order_Details od
    GROUP BY od.order_id
)
SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    ot.order_total
FROM Orders o
JOIN order_totals ot
    ON o.order_id = ot.order_id;


-- CTE with JOIN and aggregate

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(order_id) AS total_orders
    FROM Orders
    GROUP BY customer_id
)
SELECT
    c.customer_id,
    c.customer_name,
    co.total_orders
FROM Customers c
JOIN customer_orders co
    ON c.customer_id = co.customer_id
ORDER BY co.total_orders DESC;


-- Multi-step analysis using CTE

WITH order_totals AS (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM Order_Details
    GROUP BY order_id
),

customer_totals AS (
    SELECT
        o.customer_id,
        SUM(ot.order_total) AS total_spending
    FROM Orders o
    JOIN order_totals ot
        ON o.order_id = ot.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.customer_id
)

SELECT
    c.customer_id,
    c.customer_name,
    ct.total_spending
FROM Customers c
JOIN customer_totals ct
    ON c.customer_id = ct.customer_id
ORDER BY ct.total_spending DESC;


-- Multi-step analysis:
-- Customer spending and customer category

WITH order_totals AS (
    SELECT
        order_id,
        SUM(quantity * unit_price) AS order_total
    FROM Order_Details
    GROUP BY order_id
),

customer_totals AS (
    SELECT
        o.customer_id,
        SUM(ot.order_total) AS total_spending
    FROM Orders o
    JOIN order_totals ot
        ON o.order_id = ot.order_id
    WHERE o.order_status = 'Completed'
    GROUP BY o.customer_id
)

SELECT
    c.customer_name,
    ct.total_spending,
    CASE
        WHEN ct.total_spending >= 100000 THEN 'Premium'
        WHEN ct.total_spending >= 50000 THEN 'Regular'
        ELSE 'Basic'
    END AS customer_category
FROM Customers c
JOIN customer_totals ct
    ON c.customer_id = ct.customer_id
ORDER BY ct.total_spending DESC;


-- CTE vs Subquery

-- Subquery version

SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);


-- CTE version

WITH average_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
)
SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT avg_salary
    FROM average_salary
);


-- CTE vs Temporary Table

-- CTE exists only for the duration of the query.
-- A temporary table can exist for the duration
-- of the database session.

-- CTE example

WITH high_salary AS (
    SELECT *
    FROM Employees
    WHERE salary > 70000
)
SELECT *
FROM high_salary;




-- Chapter 23: Views

USE advanced_sql_db;

-- What is a View?

-- A View is a virtual table based on a SQL query.

-- Why Views are used

-- Views can simplify complex queries,
-- provide reusable queries and restrict access
-- to selected columns or rows.


-- View vs Table

-- Table stores actual data.
-- View stores a SQL query and displays its result.


-- CREATE VIEW

CREATE VIEW employee_view AS
SELECT
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id
FROM Employees;


-- Querying a View

SELECT *
FROM employee_view;


-- Query selected columns from a View

SELECT
    employee_name,
    salary
FROM employee_view;


-- WHERE with View

SELECT
    employee_name,
    salary
FROM employee_view
WHERE salary > 70000;


-- ORDER BY with View

SELECT
    employee_name,
    salary
FROM employee_view
ORDER BY salary DESC;


-- CREATE VIEW with JOIN

CREATE VIEW employee_department_view AS
SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    e.salary,
    d.department_name,
    d.location
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;


-- Query employee department View

SELECT *
FROM employee_department_view;


-- Find high-salary employees using View

SELECT
    employee_name,
    department_name,
    salary
FROM employee_department_view
WHERE salary > 70000
ORDER BY salary DESC;


-- Department View

CREATE VIEW department_view AS
SELECT
    d.department_id,
    d.department_name,
    d.location,
    COUNT(e.employee_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary
FROM Departments d
LEFT JOIN Employees e
    ON d.department_id = e.department_id
GROUP BY
    d.department_id,
    d.department_name,
    d.location;


-- Query Department View

SELECT *
FROM department_view;


-- Department View with ORDER BY

SELECT *
FROM department_view
ORDER BY average_salary DESC;


-- Sales Summary View

CREATE VIEW sales_summary_view AS
SELECT
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.order_date,
    o.order_status,
    SUM(
        od.quantity * od.unit_price
    ) AS order_total
FROM Orders o
JOIN Customers c
    ON o.customer_id = c.customer_id
JOIN Order_Details od
    ON o.order_id = od.order_id
GROUP BY
    o.order_id,
    o.customer_id,
    c.customer_name,
    o.order_date,
    o.order_status;


-- Query Sales Summary View

SELECT *
FROM sales_summary_view;


-- Total sales from View

SELECT
    SUM(order_total) AS total_sales
FROM sales_summary_view;


-- Completed sales from View

SELECT
    SUM(order_total) AS completed_sales
FROM sales_summary_view
WHERE order_status = 'Completed';


-- Customer-wise sales from View

SELECT
    customer_name,
    SUM(order_total) AS total_spending
FROM sales_summary_view
WHERE order_status = 'Completed'
GROUP BY customer_name
ORDER BY total_spending DESC;


-- Updating a View

-- Simple views based on a single table can sometimes
-- be updated.

UPDATE employee_view
SET salary = 56000
WHERE employee_id = 101;


-- Check updated value

SELECT *
FROM employee_view
WHERE employee_id = 101;


-- Check original table

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id = 101;


-- Restore original salary

UPDATE Employees
SET salary = 55000
WHERE employee_id = 101;


-- ALTER / CREATE OR REPLACE VIEW

CREATE OR REPLACE VIEW employee_view AS
SELECT
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id,
    joining_date
FROM Employees;


-- Check modified View

SELECT *
FROM employee_view;


-- Replace employee department View

CREATE OR REPLACE VIEW employee_department_view AS
SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    e.salary,
    d.department_name,
    d.location,
    e.joining_date
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;


-- Query modified View

SELECT *
FROM employee_department_view;


-- DROP VIEW

CREATE VIEW test_view AS
SELECT
    employee_id,
    employee_name
FROM Employees;


-- Check test View

SELECT *
FROM test_view;


-- Delete View

DROP VIEW test_view;


-- Check available Views

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';


-- Advantages of Views

-- 1. Simplifies complex queries.
-- 2. Provides reusable SQL queries.
-- 3. Can hide unnecessary columns.
-- 4. Can help restrict access to sensitive data.
-- 5. Makes reporting queries easier to use.


-- Limitations of Views

-- 1. Complex Views may be slower.
-- 2. Some Views cannot be updated.
-- 3. Views depend on underlying tables.
-- 4. Complex View definitions can be difficult to maintain.


-- Employee View

SELECT
    employee_id,
    employee_name,
    job_title,
    salary
FROM employee_view
ORDER BY salary DESC;


-- Department View

SELECT
    department_name,
    location,
    total_employees,
    average_salary
FROM department_view
ORDER BY average_salary DESC;


-- Sales Summary View

SELECT
    order_id,
    customer_name,
    order_date,
    order_status,
    order_total
FROM sales_summary_view
ORDER BY order_total DESC;


-- Complete View example

SELECT
    ed.employee_name,
    ed.job_title,
    ed.salary,
    ed.department_name,
    dv.total_employees,
    dv.average_salary
FROM employee_department_view ed
JOIN department_view dv
    ON ed.department_name = dv.department_name
ORDER BY ed.salary DESC;

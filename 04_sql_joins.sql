-- Day 4: SQL JOINs
-- Database for Chapter 15 and Chapter 16

CREATE DATABASE company_join_db;

USE company_join_db;


-- Department table

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);


INSERT INTO Department
(
    dept_id,
    dept_name,
    location
)
VALUES
    (1, 'IT', 'Delhi'),
    (2, 'HR', 'Noida'),
    (3, 'Finance', 'Mumbai'),
    (4, 'Sales', 'Bangalore'),
    (5, 'Marketing', 'Pune'),
    (6, 'Operations', 'Hyderabad');


-- Employees table

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    job VARCHAR(50),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    gender VARCHAR(10),
    dept_id INT,
    joining_date DATE,
    email VARCHAR(100),
    manager_id INT,

    FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);


INSERT INTO Employees
(
    emp_id,
    emp_name,
    job,
    salary,
    city,
    gender,
    dept_id,
    joining_date,
    email,
    manager_id
)
VALUES
    (101, 'Ranjeet', 'Data Analyst', 55000, 'Delhi', 'Male', 1, '2023-01-15', 'ranjeet@company.com', NULL),

    (102, 'Amit', 'Software Engineer', 65000, 'Noida', 'Male', 1, '2022-06-10', 'amit@company.com', 101),

    (103, 'Priya', 'HR Executive', 45000, 'Noida', 'Female', 2, '2023-03-20', 'priya@company.com', NULL),

    (104, 'Rahul', 'HR Manager', 70000, 'Delhi', 'Male', 2, '2021-08-12', 'rahul@company.com', NULL),

    (105, 'Neha', 'Accountant', 50000, 'Mumbai', 'Female', 3, '2022-01-25', 'neha@company.com', NULL),

    (106, 'Vikas', 'Finance Manager', 80000, 'Mumbai', 'Male', 3, '2020-11-05', 'vikas@company.com', NULL),

    (107, 'Anjali', 'Sales Executive', 40000, 'Bangalore', 'Female', 4, '2023-05-18', 'anjali@company.com', NULL),

    (108, 'Karan', 'Sales Executive', 42000, 'Bangalore', 'Male', 4, '2023-07-22', 'karan@company.com', 107),

    (109, 'Pooja', 'Sales Manager', 75000, 'Pune', 'Female', 4, '2021-04-14', 'pooja@company.com', NULL),

    (110, 'Suresh', 'Marketing Executive', 48000, 'Pune', 'Male', 5, '2022-09-30', 'suresh@company.com', NULL),

    (111, 'Kavita', 'Marketing Executive', 47000, 'Delhi', 'Female', 5, '2023-02-11', NULL, 110),

    (112, 'Arjun', 'Marketing Manager', 72000, 'Delhi', 'Male', 5, '2020-05-16', 'arjun@company.com', NULL),

    (113, 'Deepak', 'Data Scientist', 90000, 'Delhi', 'Male', 1, '2021-12-01', 'deepak@company.com', 101),

    (114, 'Sneha', 'Software Engineer', 68000, 'Noida', 'Female', 1, '2022-10-19', 'sneha@company.com', 101),

    (115, 'Meera', 'HR Executive', 46000, 'Noida', 'Female', 2, '2024-01-10', NULL, 104);


-- Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    product VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2),
    sale_date DATE,

    FOREIGN KEY (emp_id)
    REFERENCES Employees(emp_id)
);


INSERT INTO Sales
(
    sale_id,
    emp_id,
    product,
    category,
    quantity,
    amount,
    sale_date
)
VALUES
    (1, 107, 'Laptop', 'Electronics', 2, 120000, '2024-01-05'),

    (2, 108, 'Mouse', 'Accessories', 10, 15000, '2024-01-08'),

    (3, 109, 'Laptop', 'Electronics', 3, 180000, '2024-01-12'),

    (4, 107, 'Keyboard', 'Accessories', 8, 20000, '2024-01-15'),

    (5, 108, 'Monitor', 'Electronics', 4, 80000, '2024-01-20'),

    (6, 109, 'Printer', 'Office', 2, 50000, '2024-02-02'),

    (7, 107, 'Laptop', 'Electronics', 1, 60000, '2024-02-10'),

    (8, 108, 'Mouse', 'Accessories', 15, 22500, '2024-02-14'),

    (9, 109, 'Keyboard', 'Accessories', 10, 25000, '2024-02-20'),

    (10, 101, 'Laptop', 'Electronics', 2, 120000, '2024-03-01'),

    (11, 102, 'Monitor', 'Electronics', 5, 100000, '2024-03-05'),

    (12, 113, 'Laptop', 'Electronics', 4, 240000, '2024-03-10'),

    (13, 114, 'Keyboard', 'Accessories', 12, 30000, '2024-03-15'),

    (14, 101, 'Mouse', 'Accessories', 20, 30000, '2024-04-01'),

    (15, 102, 'Laptop', 'Electronics', 2, 120000, '2024-04-05'),

    (16, 113, 'Monitor', 'Electronics', 3, 60000, '2024-04-10'),

    (17, 114, 'Mouse', 'Accessories', 25, 37500, '2024-04-15'),

    (18, 103, 'Printer', 'Office', 2, 50000, '2024-05-01'),

    (19, 104, 'Laptop', 'Electronics', 1, 60000, '2024-05-05'),

    (20, 115, 'Keyboard', 'Accessories', 15, 37500, '2024-05-10'),

    (21, 105, 'Monitor', 'Electronics', 2, 40000, '2024-06-01'),

    (22, 106, 'Laptop', 'Electronics', 3, 180000, '2024-06-05'),

    (23, 105, 'Mouse', 'Accessories', 10, 15000, '2024-06-10'),

    (24, 106, 'Printer', 'Office', 4, 100000, '2024-06-15');


-- Projects table

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    dept_id INT,
    project_budget DECIMAL(12,2),

    FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);


INSERT INTO Projects
(
    project_id,
    project_name,
    dept_id,
    project_budget
)
VALUES
    (201, 'AI Analytics Platform', 1, 500000),

    (202, 'Employee Management System', 2, 250000),

    (203, 'Financial Reporting System', 3, 300000),

    (204, 'Sales Dashboard', 4, 200000),

    (205, 'Digital Marketing Campaign', 5, 150000);


-- Verify tables

SHOW TABLES;


-- View Department table

SELECT *
FROM Department;


-- View Employees table

SELECT *
FROM Employees;


-- View Sales table

SELECT *
FROM Sales;


-- View Projects table

SELECT *
FROM Projects;


-- Chapter 15: SQL JOINs

USE company_join_db;


-- What is JOIN?

-- JOIN is used to combine data from two or more tables
-- using a related column.


-- Primary Key - Foreign Key relationship

-- Department.dept_id is the Primary Key
-- Employees.dept_id is the Foreign Key

SELECT *
FROM Department;


SELECT *
FROM Employees;


-- JOIN condition

-- The JOIN condition specifies how two tables are related.

SELECT
    Employees.emp_name,
    Department.dept_name
FROM Employees
JOIN Department
    ON Employees.dept_id = Department.dept_id;


-- ON clause

-- ON defines the condition used to match rows
-- between the tables.

SELECT
    e.emp_name,
    d.dept_name,
    e.salary
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id;


-- INNER JOIN

-- INNER JOIN returns only matching records
-- from both tables.

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employees e
INNER JOIN Department d
    ON e.dept_id = d.dept_id;


-- INNER JOIN using JOIN keyword

-- In MySQL, JOIN means INNER JOIN by default.

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id;


-- INNER JOIN with multiple columns

SELECT
    e.emp_name,
    e.city,
    d.dept_name,
    d.location
FROM Employees e
INNER JOIN Department d
    ON e.dept_id = d.dept_id;


-- INNER JOIN with WHERE

-- Find employees working in IT

SELECT
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
INNER JOIN Department d
    ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';


-- Find employees earning more than 60000
-- along with their department

SELECT
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
INNER JOIN Department d
    ON e.dept_id = d.dept_id
WHERE e.salary > 60000;


-- LEFT JOIN

-- LEFT JOIN returns all records from the left table
-- and matching records from the right table.

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id;


-- LEFT JOIN with department information

SELECT
    d.dept_name,
    d.location,
    e.emp_name,
    e.job
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id;


-- Find departments having no employees

SELECT
    d.dept_id,
    d.dept_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;


-- RIGHT JOIN

-- RIGHT JOIN returns all records from the right table
-- and matching records from the left table.

SELECT
    d.dept_name,
    e.emp_name
FROM Employees e
RIGHT JOIN Department d
    ON e.dept_id = d.dept_id;


-- RIGHT JOIN with employee information

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employees e
RIGHT JOIN Department d
    ON e.dept_id = d.dept_id;


-- RIGHT JOIN can be rewritten as LEFT JOIN
-- by changing the table order.

SELECT
    d.dept_name,
    e.emp_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id;


-- FULL OUTER JOIN

-- MySQL does not directly support FULL OUTER JOIN.

-- FULL OUTER JOIN returns:
-- Matching records
-- Unmatched records from the left table
-- Unmatched records from the right table


-- MySQL solution using LEFT JOIN + RIGHT JOIN + UNION

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id

UNION

SELECT
    d.dept_id,
    d.dept_name,
    e.emp_id,
    e.emp_name
FROM Department d
RIGHT JOIN Employees e
    ON d.dept_id = e.dept_id;


-- Find all departments and employees
-- including unmatched records

SELECT
    d.dept_name,
    e.emp_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id

UNION

SELECT
    d.dept_name,
    e.emp_name
FROM Department d
RIGHT JOIN Employees e
    ON d.dept_id = e.dept_id;


-- SELF JOIN

-- SELF JOIN joins a table with itself.

-- Employees.manager_id refers to Employees.emp_id.


-- Display employee and manager

SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.emp_id;


-- Display employees who have a manager

SELECT
    e.emp_name AS employee,
    m.emp_name AS manager
FROM Employees e
INNER JOIN Employees m
    ON e.manager_id = m.emp_id;


-- Display employee, manager and employee salary

SELECT
    e.emp_name AS employee,
    e.salary AS employee_salary,
    m.emp_name AS manager,
    m.salary AS manager_salary
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.emp_id;


-- Find employees whose manager earns more than 60000

SELECT
    e.emp_name AS employee,
    m.emp_name AS manager,
    m.salary AS manager_salary
FROM Employees e
INNER JOIN Employees m
    ON e.manager_id = m.emp_id
WHERE m.salary > 60000;


-- CROSS JOIN

-- CROSS JOIN returns every possible combination
-- of rows from both tables.

SELECT
    e.emp_name,
    d.dept_name
FROM Employees e
CROSS JOIN Department d;


-- Count possible employee-department combinations

SELECT COUNT(*) AS total_combinations
FROM Employees
CROSS JOIN Department;


-- CROSS JOIN with selected departments

SELECT
    e.emp_name,
    d.dept_name
FROM Employees e
CROSS JOIN Department d
WHERE d.dept_id IN (1, 2);


-- JOIN with column aliases

SELECT
    e.emp_name AS employee_name,
    d.dept_name AS department_name,
    e.salary AS employee_salary
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id;


-- JOIN with ORDER BY

-- Display employees according to salary
-- from highest to lowest

SELECT
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
ORDER BY e.salary DESC;


-- JOIN with LIMIT

-- Display top 5 highest-paid employees
-- with department names

SELECT
    e.emp_name,
    e.salary,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
ORDER BY e.salary DESC
LIMIT 5;


-- JOIN with aggregate function

-- Count employees in each department

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- Calculate total salary of each department

SELECT
    d.dept_name,
    SUM(e.salary) AS total_salary
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- Calculate average salary of each department

SELECT
    d.dept_name,
    AVG(e.salary) AS average_salary
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- Find minimum and maximum salary of each department

SELECT
    d.dept_name,
    MIN(e.salary) AS minimum_salary,
    MAX(e.salary) AS maximum_salary
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name;


-- JOIN with GROUP BY and ORDER BY

-- Display departments according to employee count

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY total_employees DESC;


-- Finding unmatched records

-- Find departments without employees

SELECT
    d.dept_id,
    d.dept_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;


-- Find employees without a matching department

SELECT
    e.emp_id,
    e.emp_name,
    e.dept_id
FROM Employees e
LEFT JOIN Department d
    ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;


-- Find employees who have no manager

SELECT
    e.emp_id,
    e.emp_name
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.emp_id
WHERE e.manager_id IS NULL;


-- Find employees who have a manager

SELECT
    e.emp_id,
    e.emp_name,
    m.emp_name AS manager_name
FROM Employees e
INNER JOIN Employees m
    ON e.manager_id = m.emp_id;


-- JOIN with WHERE

-- Find female employees working in IT

SELECT
    e.emp_name,
    e.gender,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
WHERE e.gender = 'Female'
  AND d.dept_name = 'IT';


-- Find employees from Delhi with their departments

SELECT
    e.emp_name,
    e.city,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
WHERE e.city = 'Delhi';


-- Complete JOIN example

-- Display employee details with department information

SELECT
    e.emp_id,
    e.emp_name,
    e.job,
    e.salary,
    e.city,
    d.dept_name,
    d.location
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
ORDER BY e.emp_id;


-- Department statistics using JOIN

SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary,
    MIN(e.salary) AS minimum_salary,
    MAX(e.salary) AS maximum_salary
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY total_salary DESC;


-- Chapter 16: Multiple Table JOINs

USE company_join_db;

-- Joining two tables

SELECT
    e.emp_name,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id;

-- Joining three tables

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id;

-- Joining multiple tables

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name,
    s.product,
    s.category,
    s.amount,
    p.project_name,
    p.project_budget
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
JOIN Projects p
    ON d.dept_id = p.dept_id;

-- Multiple JOIN conditions

-- Multiple conditions can be used inside ON clause.

SELECT
    e.emp_name,
    e.city,
    d.dept_name,
    d.location
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
   AND e.city = d.location;

-- Multiple JOIN conditions using AND

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
   AND s.amount > 50000;

-- JOIN + WHERE

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
WHERE s.amount > 50000;

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
WHERE d.dept_name = 'IT'
  AND s.amount > 50000;

-- JOIN + GROUP BY

SELECT
    d.dept_name,
    COUNT(s.sale_id) AS total_sales
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

SELECT
    d.dept_name,
    SUM(s.amount) AS total_sales_amount
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

-- JOIN + GROUP BY + multiple columns

SELECT
    d.dept_name,
    s.category,
    COUNT(s.sale_id) AS total_transactions,
    SUM(s.amount) AS total_amount
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY
    d.dept_name,
    s.category;

-- JOIN + HAVING

SELECT
    d.dept_name,
    SUM(s.amount) AS total_sales_amount
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name
HAVING SUM(s.amount) > 300000;

SELECT
    d.dept_name,
    COUNT(s.sale_id) AS total_sales
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name
HAVING COUNT(s.sale_id) >= 5;

-- JOIN + WHERE + GROUP BY + HAVING

SELECT
    d.dept_name,
    SUM(s.amount) AS total_sales_amount
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
WHERE s.category = 'Electronics'
GROUP BY d.dept_name
HAVING SUM(s.amount) > 100000;

-- JOIN + ORDER BY

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
ORDER BY s.amount DESC;

-- JOIN + GROUP BY + ORDER BY

SELECT
    d.dept_name,
    SUM(s.amount) AS total_sales_amount
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_sales_amount DESC;

-- JOIN + LIMIT

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
ORDER BY s.amount DESC
LIMIT 5;

-- JOIN + GROUP BY + ORDER BY + LIMIT

SELECT
    e.emp_name,
    SUM(s.amount) AS total_sales
FROM Employees e
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY e.emp_name
ORDER BY total_sales DESC
LIMIT 5;

-- JOIN + Aggregate Functions

SELECT
    d.dept_name,
    COUNT(s.sale_id) AS total_transactions,
    SUM(s.amount) AS total_sales,
    AVG(s.amount) AS average_sale,
    MIN(s.amount) AS minimum_sale,
    MAX(s.amount) AS maximum_sale
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name;

-- Employee-wise sales statistics

SELECT
    e.emp_id,
    e.emp_name,
    COUNT(s.sale_id) AS total_transactions,
    SUM(s.amount) AS total_sales,
    AVG(s.amount) AS average_sale
FROM Employees e
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY
    e.emp_id,
    e.emp_name
ORDER BY total_sales DESC;

-- Department and project information

SELECT
    d.dept_name,
    p.project_name,
    p.project_budget
FROM Department d
JOIN Projects p
    ON d.dept_id = p.dept_id;

-- Department, employees and projects

SELECT
    d.dept_name,
    e.emp_name,
    p.project_name
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Projects p
    ON d.dept_id = p.dept_id
ORDER BY d.dept_name;

-- Finding unmatched departments

SELECT
    d.dept_id,
    d.dept_name
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- Finding departments without projects

SELECT
    d.dept_id,
    d.dept_name
FROM Department d
LEFT JOIN Projects p
    ON d.dept_id = p.dept_id
WHERE p.project_id IS NULL;

-- Finding employees without sales

SELECT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
LEFT JOIN Sales s
    ON e.emp_id = s.emp_id
WHERE s.sale_id IS NULL;

-- Finding employees who have sales

SELECT DISTINCT
    e.emp_id,
    e.emp_name,
    d.dept_name
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id;

-- Real-world problem: Find the employee with the highest total sales

SELECT
    e.emp_id,
    e.emp_name,
    SUM(s.amount) AS total_sales
FROM Employees e
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY
    e.emp_id,
    e.emp_name
ORDER BY total_sales DESC
LIMIT 1;

-- Real-world problem: Find total sales by department

SELECT
    d.dept_name,
    SUM(s.amount) AS total_sales
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_sales DESC;

-- Real-world problem: Find employees whose total sales exceed 100000

SELECT
    e.emp_id,
    e.emp_name,
    SUM(s.amount) AS total_sales
FROM Employees e
JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY
    e.emp_id,
    e.emp_name
HAVING SUM(s.amount) > 100000
ORDER BY total_sales DESC;

-- Real-world problem: Find department-wise number of employees and sales

SELECT
    d.dept_name,
    COUNT(DISTINCT e.emp_id) AS total_employees,
    COUNT(s.sale_id) AS total_sales,
    SUM(s.amount) AS total_sales_amount
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
LEFT JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY d.dept_name
ORDER BY total_sales_amount DESC;

-- Real-world problem: Find department-wise project budget and sales

SELECT
    d.dept_name,
    p.project_name,
    p.project_budget,
    SUM(s.amount) AS total_sales
FROM Department d
LEFT JOIN Projects p
    ON d.dept_id = p.dept_id
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
LEFT JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY
    d.dept_name,
    p.project_name,
    p.project_budget
ORDER BY total_sales DESC;

-- Real-world problem: Find top-selling product

SELECT
    s.product,
    SUM(s.amount) AS total_sales
FROM Sales s
GROUP BY s.product
ORDER BY total_sales DESC
LIMIT 1;

-- Real-world problem: Find sales made by employees from IT department

SELECT
    e.emp_name,
    d.dept_name,
    s.product,
    s.amount,
    s.sale_date
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
JOIN Sales s
    ON e.emp_id = s.emp_id
WHERE d.dept_name = 'IT'
ORDER BY s.amount DESC;

-- Real-world problem: Find employees and their managers along with sales

SELECT
    e.emp_name AS employee,
    m.emp_name AS manager,
    d.dept_name,
    SUM(s.amount) AS total_sales
FROM Employees e
LEFT JOIN Employees m
    ON e.manager_id = m.emp_id
JOIN Department d
    ON e.dept_id = d.dept_id
LEFT JOIN Sales s
    ON e.emp_id = s.emp_id
GROUP BY
    e.emp_id,
    e.emp_name,
    m.emp_name,
    d.dept_name
ORDER BY total_sales DESC;

-- Complete multiple JOIN example

SELECT
    e.emp_id,
    e.emp_name,
    e.job,
    d.dept_name,
    d.location,
    s.product,
    s.category,
    s.quantity,
    s.amount,
    s.sale_date,
    p.project_name,
    p.project_budget
FROM Employees e
JOIN Department d
    ON e.dept_id = d.dept_id
LEFT JOIN Sales s
    ON e.emp_id = s.emp_id
LEFT JOIN Projects p
    ON d.dept_id = p.dept_id
ORDER BY
    d.dept_name,
    e.emp_name,
    s.sale_date;

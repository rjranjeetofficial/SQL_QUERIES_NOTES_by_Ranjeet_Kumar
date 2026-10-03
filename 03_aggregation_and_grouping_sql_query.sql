-- DAY 3 — AGGREGATION & GROUPING
-- Database: company_sales_db

DROP DATABASE IF EXISTS company_sales_db;

CREATE DATABASE company_sales_db;

USE company_sales_db;

-- Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

INSERT INTO Department
(dept_id, dept_name, location)
VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Noida'),
(3, 'Finance', 'Mumbai'),
(4, 'Sales', 'Bangalore'),
(5, 'Marketing', 'Pune');

-- Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    job VARCHAR(100),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    gender VARCHAR(10),
    dept_id INT,
    joining_date DATE,
    email VARCHAR(100),
    FOREIGN KEY (dept_id)
        REFERENCES Department(dept_id)
);

INSERT INTO Employees
(emp_id, emp_name, job, salary, city, gender, dept_id, joining_date, email)
VALUES
(101, 'Ranjeet', 'Data Analyst', 55000, 'Delhi', 'Male', 1, '2023-01-15', 'ranjeet@company.com'),
(102, 'Amit', 'Software Engineer', 65000, 'Noida', 'Male', 1, '2022-06-10', 'amit@company.com'),
(103, 'Priya', 'HR Executive', 45000, 'Noida', 'Female', 2, '2023-03-20', 'priya@company.com'),
(104, 'Rahul', 'HR Manager', 70000, 'Delhi', 'Male', 2, '2021-08-12', 'rahul@company.com'),
(105, 'Neha', 'Accountant', 50000, 'Mumbai', 'Female', 3, '2022-01-25', 'neha@company.com'),
(106, 'Vikas', 'Finance Manager', 80000, 'Mumbai', 'Male', 3, '2020-11-05', 'vikas@company.com'),
(107, 'Anjali', 'Sales Executive', 40000, 'Bangalore', 'Female', 4, '2023-05-18', 'anjali@company.com'),
(108, 'Karan', 'Sales Executive', 42000, 'Bangalore', 'Male', 4, '2023-07-22', 'karan@company.com'),
(109, 'Pooja', 'Sales Manager', 75000, 'Pune', 'Female', 4, '2021-04-14', 'pooja@company.com'),
(110, 'Suresh', 'Marketing Executive', 48000, 'Pune', 'Male', 5, '2022-09-30', 'suresh@company.com'),
(111, 'Kavita', 'Marketing Executive', 47000, 'Delhi', 'Female', 5, '2023-02-11', NULL),
(112, 'Arjun', 'Marketing Manager', 72000, 'Delhi', 'Male', 5, '2020-05-16', 'arjun@company.com'),
(113, 'Deepak', 'Data Scientist', 90000, 'Delhi', 'Male', 1, '2021-12-01', 'deepak@company.com'),
(114, 'Sneha', 'Software Engineer', 68000, 'Noida', 'Female', 1, '2022-10-19', 'sneha@company.com'),
(115, 'Meera', 'HR Executive', 46000, 'Noida', 'Female', 2, '2024-01-10', NULL);

-- Sales table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    emp_id INT,
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2),
    sale_date DATE,
    FOREIGN KEY (emp_id)
        REFERENCES Employees(emp_id)
);

INSERT INTO Sales
(sale_id, emp_id, product, category, quantity, amount, sale_date)
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

-- Check tables
SHOW TABLES;

SELECT * FROM Department;

SELECT * FROM Employees;

SELECT * FROM Sales;


-- Chapter 11 — Aggregate Functions

USE company_sales_db;

-- COUNT()
-- Count total employees
SELECT
    COUNT(*) AS total_employees
FROM Employees;

-- COUNT(column)
-- Counts only non-NULL values
SELECT
    COUNT(email) AS employees_with_email
FROM Employees;

-- COUNT(*)
-- Counts every row
SELECT
    COUNT(*) AS total_rows
FROM Employees;

-- COUNT(column)
-- NULL values are not counted
SELECT
    COUNT(email) AS email_count
FROM Employees;

-- SUM()
-- Total salary
SELECT
    SUM(salary) AS total_salary
FROM Employees;

-- SUM() on sales amount
SELECT
    SUM(amount) AS total_sales
FROM Sales;

-- AVG()
-- Average salary
SELECT
    AVG(salary) AS average_salary
FROM Employees;

-- Average sales amount
SELECT
    AVG(amount) AS average_sale
FROM Sales;

-- MIN()
-- Lowest salary
SELECT
    MIN(salary) AS minimum_salary
FROM Employees;

-- Minimum sale
SELECT
    MIN(amount) AS minimum_sale
FROM Sales;

-- MAX()
-- Highest salary
SELECT
    MAX(salary) AS maximum_salary
FROM Employees;

-- Maximum sale
SELECT
    MAX(amount) AS maximum_sale
FROM Sales;

-- Multiple aggregate functions
SELECT
    COUNT(*) AS total_employees,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM Employees;

-- Multiple aggregate functions on Sales
SELECT
    COUNT(*) AS total_sales,
    SUM(amount) AS total_sales_amount,
    AVG(amount) AS average_sale,
    MIN(amount) AS minimum_sale,
    MAX(amount) AS maximum_sale
FROM Sales;

-- NULL behavior
-- COUNT(*) counts all rows
SELECT
    COUNT(*) AS total_rows,
    COUNT(email) AS non_null_emails
FROM Employees;

-- Check NULL emails
SELECT
    emp_id,
    emp_name,
    email
FROM Employees
WHERE email IS NULL;

-- SUM ignores NULL values
SELECT
    SUM(salary) AS total_salary
FROM Employees;

-- AVG ignores NULL values
SELECT
    AVG(salary) AS average_salary
FROM Employees;

-- Aggregate functions with WHERE
SELECT
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM Employees
WHERE dept_id = 1;

-- Aggregate sales for Electronics
SELECT
    COUNT(*) AS sales_count,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_sale,
    MIN(amount) AS minimum_sale,
    MAX(amount) AS maximum_sale
FROM Sales
WHERE category = 'Electronics';

-- Aggregate sales above 50000
SELECT
    COUNT(*) AS sales_count,
    SUM(amount) AS total_amount
FROM Sales
WHERE amount > 50000;




-- Chapter 12 — GROUP BY

USE company_sales_db;

-- What is GROUP BY?
-- GROUP BY combines rows having the same value
-- into groups.

-- GROUP BY one column
-- Employee count by department
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id;

-- Department-wise total salary
SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY dept_id;

-- Department-wise average salary
SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY dept_id;

-- Department-wise minimum and maximum salary
SELECT
    dept_id,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM Employees
GROUP BY dept_id;

-- GROUP BY with department name
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

-- GROUP BY multiple columns
-- Employees grouped by department and city
SELECT
    dept_id,
    city,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id, city;

-- GROUP BY gender and department
SELECT
    dept_id,
    gender,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id, gender;

-- GROUP BY with multiple aggregate functions
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary,
    MIN(salary) AS minimum_salary,
    MAX(salary) AS maximum_salary
FROM Employees
GROUP BY dept_id;

-- Sales grouped by category
SELECT
    category,
    COUNT(*) AS number_of_sales,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_sale
FROM Sales
GROUP BY category;

-- Sales grouped by product
SELECT
    product,
    COUNT(*) AS number_of_sales,
    SUM(quantity) AS total_quantity,
    SUM(amount) AS total_sales
FROM Sales
GROUP BY product;

-- GROUP BY with WHERE
-- First filter rows, then create groups
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary > 45000
GROUP BY dept_id;

-- GROUP BY with WHERE on Sales
SELECT
    category,
    SUM(amount) AS total_sales
FROM Sales
WHERE amount > 20000
GROUP BY category;

-- GROUP BY with ORDER BY
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id
ORDER BY employee_count DESC;

-- Department-wise salary sorted highest first
SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY dept_id
ORDER BY total_salary DESC;

-- GROUP BY with JOIN and ORDER BY
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM Department d
LEFT JOIN Employees e
    ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name
ORDER BY average_salary DESC;




-- Chapter 13 — HAVING

USE company_sales_db;

-- What is HAVING?
-- HAVING filters groups after GROUP BY.

-- HAVING with GROUP BY
-- Departments having more than 2 employees
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

-- HAVING with aggregate functions
-- Departments whose average salary is greater than 60000
SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY dept_id
HAVING AVG(salary) > 60000;

-- Departments whose total salary is greater than 150000
SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY dept_id
HAVING SUM(salary) > 150000;

-- Departments whose highest salary is greater than 80000
SELECT
    dept_id,
    MAX(salary) AS maximum_salary
FROM Employees
GROUP BY dept_id
HAVING MAX(salary) > 80000;

-- HAVING with COUNT
SELECT
    city,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY city
HAVING COUNT(*) >= 2;

-- Sales categories with total sales greater than 200000
SELECT
    category,
    SUM(amount) AS total_sales
FROM Sales
GROUP BY category
HAVING SUM(amount) > 200000;

-- WHERE vs HAVING
-- WHERE filters individual rows
-- HAVING filters groups

-- WHERE example
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
WHERE salary > 50000
GROUP BY dept_id;

-- HAVING example
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

-- WHERE + GROUP BY + HAVING
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary > 45000
GROUP BY dept_id
HAVING COUNT(*) >= 2;

-- WHERE + GROUP BY + HAVING + ORDER BY
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    SUM(salary) AS total_salary,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary >= 45000
GROUP BY dept_id
HAVING AVG(salary) > 55000
ORDER BY average_salary DESC;

-- JOIN + WHERE + GROUP BY + HAVING
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.salary > 45000
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) >= 2
ORDER BY average_salary DESC;

-- Sales example
SELECT
    category,
    COUNT(*) AS sales_count,
    SUM(amount) AS total_sales
FROM Sales
WHERE amount >= 20000
GROUP BY category
HAVING SUM(amount) > 200000
ORDER BY total_sales DESC;




-- Chapter 14 — SQL Query Processing Order

USE company_sales_db;

-- SQL writing order:
--
-- SELECT
-- FROM
-- JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY
-- LIMIT
-- OFFSET

-- Logical processing order:
--
-- FROM
-- JOIN
-- WHERE
-- GROUP BY
-- AGGREGATION
-- HAVING
-- SELECT
-- DISTINCT
-- ORDER BY
-- LIMIT
-- OFFSET

-- Simple example
SELECT
    dept_id,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary > 45000
GROUP BY dept_id
HAVING AVG(salary) > 55000
ORDER BY average_salary DESC
LIMIT 3;

-- Logical processing:
--
-- 1. FROM
--    Get data from Employees.
--
-- 2. WHERE
--    Keep employees with salary > 45000.
--
-- 3. GROUP BY
--    Create groups based on dept_id.
--
-- 4. AGGREGATION
--    Calculate AVG(salary) for each group.
--
-- 5. HAVING
--    Keep groups where average salary > 55000.
--
-- 6. SELECT
--    Return dept_id and average_salary.
--
-- 7. ORDER BY
--    Sort by average_salary.
--
-- 8. LIMIT
--    Return only first 3 rows.

-- WHERE vs GROUP BY vs HAVING

-- WHERE filters rows
SELECT
    *
FROM Employees
WHERE salary > 60000;

-- GROUP BY creates groups
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id;

-- HAVING filters groups
SELECT
    dept_id,
    COUNT(*) AS employee_count
FROM Employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

-- WHERE + GROUP BY + HAVING
SELECT
    dept_id,
    COUNT(*) AS employee_count,
    AVG(salary) AS average_salary
FROM Employees
WHERE salary > 45000
GROUP BY dept_id
HAVING AVG(salary) > 55000;

-- Query processing with JOIN
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS employee_count,
    AVG(e.salary) AS average_salary
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.salary > 45000
GROUP BY d.dept_id, d.dept_name
HAVING COUNT(e.emp_id) >= 2
ORDER BY average_salary DESC
LIMIT 3;

-- Alias example
-- SELECT alias can generally be used in ORDER BY
SELECT
    dept_id,
    SUM(salary) AS total_salary
FROM Employees
GROUP BY dept_id
ORDER BY total_salary DESC;

-- DISTINCT is logically processed after SELECT
SELECT DISTINCT
    city
FROM Employees
ORDER BY city;

-- LIMIT comes after ORDER BY
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- OFFSET comes after LIMIT
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

-- Complete example
SELECT
    d.dept_name AS department,
    COUNT(e.emp_id) AS employee_count,
    SUM(e.salary) AS total_salary,
    AVG(e.salary) AS average_salary
FROM Department d
JOIN Employees e
    ON d.dept_id = e.dept_id
WHERE e.salary >= 45000
GROUP BY d.dept_id, d.dept_name
HAVING AVG(e.salary) > 55000
ORDER BY average_salary DESC
LIMIT 3;
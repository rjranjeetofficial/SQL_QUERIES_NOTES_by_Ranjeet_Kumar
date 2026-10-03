-- DAY 8 - WINDOW FUNCTIONS
-- Database: window_functions_db

CREATE DATABASE window_functions_db;

USE window_functions_db;


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
    joining_date
)
VALUES
    (101, 'Ranjeet Kumar', 'Data Analyst', 55000, 1, '2023-01-15'),
    (102, 'Amit Sharma', 'Software Engineer', 72000, 1, '2022-06-10'),
    (103, 'Deepak Singh', 'Data Scientist', 90000, 1, '2021-12-01'),

    (104, 'Priya Singh', 'HR Executive', 45000, 2, '2023-03-20'),
    (105, 'Rahul Verma', 'HR Manager', 78000, 2, '2021-08-12'),
    (106, 'Neha Gupta', 'HR Executive', 50000, 2, '2022-01-25'),

    (107, 'Vikas Mehra', 'Finance Manager', 90000, 3, '2020-11-05'),
    (108, 'Pooja Sharma', 'Accountant', 52000, 3, '2022-04-18'),
    (109, 'Karan Malhotra', 'Financial Analyst', 65000, 3, '2023-07-22'),

    (110, 'Anjali Mehta', 'Sales Executive', 42000, 4, '2023-05-18'),
    (111, 'Pooja Agarwal', 'Sales Manager', 85000, 4, '2021-04-14'),
    (112, 'Suresh Yadav', 'Sales Executive', 48000, 4, '2022-09-30'),

    (113, 'Arjun Kapoor', 'Marketing Manager', 80000, 5, '2020-05-16'),
    (114, 'Kavita Joshi', 'Marketing Executive', 50000, 5, '2023-02-11'),
    (115, 'Mohit Gupta', 'Marketing Executive', 47000, 5, '2022-08-20');


-- Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    employee_id INT,
    sale_amount DECIMAL(12,2),
    sale_date DATE,
    status VARCHAR(30),

    FOREIGN KEY (employee_id)
        REFERENCES Employees(employee_id)
);

INSERT INTO Sales
(
    sale_id,
    employee_id,
    sale_amount,
    sale_date,
    status
)
VALUES
    (1, 110, 120000, '2024-01-05', 'Completed'),
    (2, 111, 180000, '2024-01-10', 'Completed'),
    (3, 112, 85000, '2024-01-15', 'Completed'),

    (4, 110, 95000, '2024-02-05', 'Completed'),
    (5, 111, 210000, '2024-02-12', 'Completed'),
    (6, 112, 75000, '2024-02-20', 'Completed'),

    (7, 110, 110000, '2024-03-05', 'Completed'),
    (8, 111, 250000, '2024-03-12', 'Completed'),
    (9, 112, 90000, '2024-03-20', 'Completed'),

    (10, 110, 130000, '2024-04-05', 'Completed'),
    (11, 111, 230000, '2024-04-15', 'Completed'),
    (12, 112, 105000, '2024-04-25', 'Completed'),

    (13, 110, 140000, '2024-05-05', 'Completed'),
    (14, 111, 260000, '2024-05-15', 'Completed'),
    (15, 112, 115000, '2024-05-25', 'Completed'),

    (16, 110, 150000, '2024-06-05', 'Completed'),
    (17, 111, 280000, '2024-06-15', 'Completed'),
    (18, 112, 125000, '2024-06-25', 'Completed'),

    (19, 101, 50000, '2024-01-08', 'Completed'),
    (20, 102, 75000, '2024-01-18', 'Completed'),
    (21, 103, 100000, '2024-01-28', 'Completed'),

    (22, 101, 60000, '2024-02-08', 'Completed'),
    (23, 102, 80000, '2024-02-18', 'Completed'),
    (24, 103, 110000, '2024-02-28', 'Completed'),

    (25, 101, 65000, '2024-03-08', 'Completed'),
    (26, 102, 85000, '2024-03-18', 'Completed'),
    (27, 103, 120000, '2024-03-28', 'Completed'),

    (28, 101, 70000, '2024-04-08', 'Completed'),
    (29, 102, 90000, '2024-04-18', 'Completed'),
    (30, 103, 130000, '2024-04-28', 'Completed');


-- Check tables

SHOW TABLES;


-- Check departments

SELECT *
FROM Departments;


-- Check employees

SELECT *
FROM Employees;


-- Check sales

SELECT *
FROM Sales;


-- Check employee and department data

SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    e.salary,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;


-- Check employee and sales data

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    s.sale_amount,
    s.sale_date,
    s.status
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id
JOIN Sales s
    ON e.employee_id = s.employee_id;
    
    
    
    USE window_functions_db;


-- What are Window Functions?

-- Window functions perform calculations across related rows
-- without combining those rows into a single result row.


-- Basic Window Function Syntax

SELECT
    employee_id,
    employee_name,
    salary,
    AVG(salary) OVER() AS average_salary
FROM Employees;


-- Window Functions vs GROUP BY

-- GROUP BY combines rows into groups

SELECT
    department_id,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department_id;


-- Window Function keeps every employee row

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    AVG(salary) OVER(
        PARTITION BY department_id
    ) AS department_average_salary
FROM Employees;


-- OVER()

SELECT
    employee_name,
    salary,
    AVG(salary) OVER() AS company_average_salary
FROM Employees;


-- PARTITION BY

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    AVG(salary) OVER(
        PARTITION BY department_id
    ) AS department_average_salary
FROM Employees;


-- ORDER BY inside OVER()

SELECT
    employee_id,
    employee_name,
    salary,
    SUM(salary) OVER(
        ORDER BY salary
    ) AS running_salary_total
FROM Employees;


-- Department-wise ordered salary

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    SUM(salary) OVER(
        PARTITION BY department_id
        ORDER BY salary
    ) AS department_running_salary
FROM Employees;


-- ROW_NUMBER()

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_number
FROM Employees;


-- ROW_NUMBER() department-wise

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    ROW_NUMBER() OVER(
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS row_number
FROM Employees;


-- RANK()

SELECT
    employee_id,
    employee_name,
    salary,
    RANK() OVER(
        ORDER BY salary DESC
    ) AS salary_rank
FROM Employees;


-- RANK() department-wise

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    RANK() OVER(
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank
FROM Employees;


-- DENSE_RANK()

SELECT
    employee_id,
    employee_name,
    salary,
    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS salary_rank
FROM Employees;


-- DENSE_RANK() department-wise

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    DENSE_RANK() OVER(
        PARTITION BY department_id
        ORDER BY salary DESC
    ) AS department_rank
FROM Employees;


-- Difference between ROW_NUMBER(), RANK() and DENSE_RANK()

SELECT
    employee_id,
    employee_name,
    salary,

    ROW_NUMBER() OVER(
        ORDER BY salary DESC
    ) AS row_number,

    RANK() OVER(
        ORDER BY salary DESC
    ) AS rank_number,

    DENSE_RANK() OVER(
        ORDER BY salary DESC
    ) AS dense_rank_number

FROM Employees;


-- Top 3 employees per department

WITH ranked_employees AS
(
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,

        ROW_NUMBER() OVER(
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS row_number

    FROM Employees
)

SELECT
    employee_id,
    employee_name,
    department_id,
    salary
FROM ranked_employees
WHERE row_number <= 3;


-- Top 3 employees per department using RANK()

WITH ranked_employees AS
(
    SELECT
        employee_id,
        employee_name,
        department_id,
        salary,

        RANK() OVER(
            PARTITION BY department_id
            ORDER BY salary DESC
        ) AS salary_rank

    FROM Employees
)

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,
    salary_rank
FROM ranked_employees
WHERE salary_rank <= 3;


-- LAG()

-- LAG() returns the value from the previous row.

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    LAG(sale_amount) OVER(
        ORDER BY sale_date
    ) AS previous_sale_amount

FROM Sales;


-- LAG() with employee-wise sales

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    LAG(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
    ) AS previous_employee_sale

FROM Sales;


-- Difference between current sale and previous sale

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    LAG(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
    ) AS previous_sale,

    sale_amount -
    LAG(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
    ) AS sale_difference

FROM Sales;


-- LEAD()

-- LEAD() returns the value from the next row.

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    LEAD(sale_amount) OVER(
        ORDER BY sale_date
    ) AS next_sale_amount

FROM Sales;


-- LEAD() with employee-wise sales

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    LEAD(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
    ) AS next_employee_sale

FROM Sales;


-- FIRST_VALUE()

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    FIRST_VALUE(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
    ) AS first_sale_amount

FROM Sales;


-- LAST_VALUE()

-- Explicit window frame is used so LAST_VALUE()
-- returns the actual last value of the partition.

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    LAST_VALUE(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND UNBOUNDED FOLLOWING
    ) AS last_sale_amount

FROM Sales;


-- SUM() OVER()

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    SUM(sale_amount) OVER() AS total_sales

FROM Sales;


-- Department-wise salary total

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,

    SUM(salary) OVER(
        PARTITION BY department_id
    ) AS department_total_salary

FROM Employees;


-- Running total

SELECT
    sale_id,
    sale_date,
    sale_amount,

    SUM(sale_amount) OVER(
        ORDER BY sale_date
    ) AS running_total

FROM Sales;


-- Employee-wise running sales total

SELECT
    sale_id,
    employee_id,
    sale_date,
    sale_amount,

    SUM(sale_amount) OVER(
        PARTITION BY employee_id
        ORDER BY sale_date
    ) AS employee_running_total

FROM Sales;


-- AVG() OVER()

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,

    AVG(salary) OVER(
        PARTITION BY department_id
    ) AS department_average_salary

FROM Employees;


-- COUNT() OVER()

SELECT
    employee_id,
    employee_name,
    department_id,

    COUNT(*) OVER(
        PARTITION BY department_id
    ) AS employees_in_department

FROM Employees;


-- MIN() OVER()

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,

    MIN(salary) OVER(
        PARTITION BY department_id
    ) AS minimum_department_salary

FROM Employees;


-- MAX() OVER()

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,

    MAX(salary) OVER(
        PARTITION BY department_id
    ) AS maximum_department_salary

FROM Employees;


-- All aggregate window functions together

SELECT
    employee_id,
    employee_name,
    department_id,
    salary,

    SUM(salary) OVER(
        PARTITION BY department_id
    ) AS department_total,

    AVG(salary) OVER(
        PARTITION BY department_id
    ) AS department_average,

    COUNT(*) OVER(
        PARTITION BY department_id
    ) AS department_employee_count,

    MIN(salary) OVER(
        PARTITION BY department_id
    ) AS department_minimum,

    MAX(salary) OVER(
        PARTITION BY department_id
    ) AS department_maximum

FROM Employees;


-- Cumulative sales

SELECT
    sale_id,
    sale_date,
    sale_amount,

    SUM(sale_amount) OVER(
        ORDER BY sale_date
        ROWS BETWEEN UNBOUNDED PRECEDING
        AND CURRENT ROW
    ) AS cumulative_sales

FROM Sales;


-- Month-over-month comparison

WITH monthly_sales AS
(
    SELECT
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        SUM(sale_amount) AS monthly_total

    FROM Sales

    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
)

SELECT
    sale_year,
    sale_month,
    monthly_total,

    LAG(monthly_total) OVER(
        ORDER BY sale_year, sale_month
    ) AS previous_month_sales,

    monthly_total -
    LAG(monthly_total) OVER(
        ORDER BY sale_year, sale_month
    ) AS month_difference

FROM monthly_sales;


-- Month-over-month percentage change

WITH monthly_sales AS
(
    SELECT
        YEAR(sale_date) AS sale_year,
        MONTH(sale_date) AS sale_month,
        SUM(sale_amount) AS monthly_total

    FROM Sales

    GROUP BY
        YEAR(sale_date),
        MONTH(sale_date)
)

SELECT
    sale_year,
    sale_month,
    monthly_total,

    LAG(monthly_total) OVER(
        ORDER BY sale_year, sale_month
    ) AS previous_month_sales,

    ROUND(
        (
            monthly_total -
            LAG(monthly_total) OVER(
                ORDER BY sale_year, sale_month
            )
        )
        /
        LAG(monthly_total) OVER(
            ORDER BY sale_year, sale_month
        ) * 100,
        2
    ) AS month_over_month_percentage

FROM monthly_sales;


-- Complete practical example

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary,

    ROW_NUMBER() OVER(
        PARTITION BY e.department_id
        ORDER BY e.salary DESC
    ) AS row_number,

    RANK() OVER(
        PARTITION BY e.department_id
        ORDER BY e.salary DESC
    ) AS salary_rank,

    DENSE_RANK() OVER(
        PARTITION BY e.department_id
        ORDER BY e.salary DESC
    ) AS dense_salary_rank,

    AVG(e.salary) OVER(
        PARTITION BY e.department_id
    ) AS department_average_salary,

    SUM(e.salary) OVER(
        PARTITION BY e.department_id
    ) AS department_total_salary

FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id

ORDER BY
    d.department_name,
    e.salary DESC;
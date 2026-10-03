-- DAY 2 - BASIC SQL QUERIES
-- Database: basic_sql_queries_db

DROP DATABASE IF EXISTS basic_sql_queries_db;

CREATE DATABASE basic_sql_queries_db;

USE basic_sql_queries_db;

-- Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO Departments
(department_id, department_name, location)
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
    email VARCHAR(100),
    job_title VARCHAR(100),
    salary DECIMAL(10,2),
    age INT,
    city VARCHAR(50),
    department_id INT,
    joining_date DATE,
    status VARCHAR(20) DEFAULT 'Active',
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

INSERT INTO Employees
(employee_id, employee_name, email, job_title, salary, age, city, department_id, joining_date, status)
VALUES
(101, 'Ranjeet Kumar', 'ranjeet@company.com', 'Data Analyst', 55000, 25, 'Delhi', 1, '2023-01-15', 'Active'),
(102, 'Amit Sharma', 'amit@company.com', 'Software Engineer', 72000, 28, 'Noida', 1, '2022-06-10', 'Active'),
(103, 'Priya Singh', 'priya@company.com', 'HR Executive', 45000, 26, 'Noida', 2, '2023-03-20', 'Active'),
(104, 'Rahul Verma', 'rahul@company.com', 'HR Manager', 78000, 35, 'Delhi', 2, '2021-08-12', 'Active'),
(105, 'Neha Gupta', 'neha@company.com', 'Accountant', 52000, 29, 'Mumbai', 3, '2022-01-25', 'Active'),
(106, 'Vikas Mehra', 'vikas@company.com', 'Finance Manager', 90000, 38, 'Mumbai', 3, '2020-11-05', 'Active'),
(107, 'Anjali Mehta', 'anjali@company.com', 'Sales Executive', 42000, 24, 'Bangalore', 4, '2023-05-18', 'Active'),
(108, 'Karan Malhotra', 'karan@company.com', 'Sales Executive', 48000, 27, 'Bangalore', 4, '2023-07-22', 'Active'),
(109, 'Pooja Agarwal', 'pooja@company.com', 'Sales Manager', 85000, 34, 'Pune', 4, '2021-04-14', 'Active'),
(110, 'Suresh Yadav', 'suresh@company.com', 'Marketing Executive', 47000, 26, 'Pune', 5, '2022-09-30', 'Active'),
(111, 'Kavita Joshi', 'kavita@company.com', 'Marketing Executive', 50000, 28, 'Delhi', 5, '2023-02-11', 'Inactive'),
(112, 'Arjun Kapoor', NULL, 'Marketing Manager', 80000, 36, 'Delhi', 5, '2020-05-16', 'Active');


-- Check data
SELECT *
FROM Departments;

SELECT *
FROM Employees;


# -- Chapter 5 — INSERT

USE basic_sql_queries_db;

-- INSERT INTO
-- Insert values into all columns
INSERT INTO Employees
VALUES
(
    113,
    'Deepak Sharma',
    'deepak@company.com',
    'Data Scientist',
    88000,
    30,
    'Delhi',
    1,
    '2024-01-10',
    'Active'
);

-- Check inserted record
SELECT *
FROM Employees
WHERE employee_id = 113;

-- INSERT values into selected columns
-- Columns not specified receive NULL or DEFAULT value
INSERT INTO Employees
(
    employee_id,
    employee_name,
    job_title,
    salary,
    city,
    department_id,
    joining_date
)
VALUES
(
    114,
    'Sneha Verma',
    'Business Analyst',
    60000,
    'Noida',
    1,
    '2024-02-15'
);

SELECT *
FROM Employees
WHERE employee_id = 114;

-- Multiple-row INSERT
INSERT INTO Employees
(
    employee_id,
    employee_name,
    email,
    job_title,
    salary,
    age,
    city,
    department_id,
    joining_date,
    status
)
VALUES
(115, 'Mohit Kumar', 'mohit@company.com', 'Developer', 65000, 27, 'Delhi', 1, '2024-03-01', 'Active'),
(116, 'Simran Kaur', 'simran@company.com', 'HR Executive', 46000, 25, 'Noida', 2, '2024-03-05', 'Active'),
(117, 'Nitin Gupta', 'nitin@company.com', 'Accountant', 54000, 29, 'Mumbai', 3, '2024-03-10', 'Active');

SELECT *
FROM Employees
WHERE employee_id IN (115, 116, 117);

-- DEFAULT values
-- Status has DEFAULT 'Active'
INSERT INTO Employees
(
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id
)
VALUES
(
    118,
    'Rohit Singh',
    'Developer',
    62000,
    1
);

SELECT *
FROM Employees
WHERE employee_id = 118;

-- Explicit DEFAULT
INSERT INTO Employees
(
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id,
    status
)
VALUES
(
    119,
    'Pankaj Kumar',
    'Tester',
    50000,
    1,
    DEFAULT
);

SELECT *
FROM Employees
WHERE employee_id = 119;

-- INSERT using another table
CREATE TABLE IT_Employees (
    employee_id INT,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO IT_Employees
(employee_id, employee_name, salary)
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE department_id = 1;

-- Check copied data
SELECT *
FROM IT_Employees;



# -- Chapter 6 — SELECT

USE basic_sql_queries_db;

-- SELECT *
-- Select all columns and all rows
SELECT *
FROM Employees;

-- Selecting specific columns
SELECT
    employee_name
FROM Employees;

-- Selecting multiple columns
SELECT
    employee_name,
    job_title,
    salary
FROM Employees;

-- Column aliases using AS
SELECT
    employee_name AS Employee_Name,
    salary AS Monthly_Salary
FROM Employees;

-- Alias without AS
SELECT
    employee_name Employee_Name,
    salary Monthly_Salary
FROM Employees;

-- DISTINCT
-- Returns unique values
SELECT DISTINCT
    city
FROM Employees;

-- DISTINCT department IDs
SELECT DISTINCT
    department_id
FROM Employees;

-- DISTINCT combination of columns
SELECT DISTINCT
    city,
    department_id
FROM Employees;

-- Arithmetic expression
SELECT
    employee_name,
    salary,
    salary + 5000 AS Salary_After_Increment
FROM Employees;

-- Subtraction
SELECT
    employee_name,
    salary,
    salary - 2000 AS Salary_After_Deduction
FROM Employees;

-- Multiplication
SELECT
    employee_name,
    salary,
    salary * 12 AS Annual_Salary
FROM Employees;

-- Division
SELECT
    employee_name,
    salary,
    salary / 12 AS Monthly_Salary
FROM Employees;

-- Calculated column
SELECT
    employee_name,
    salary,
    salary * 12 AS Annual_Salary,
    salary * 12 * 0.10 AS Annual_Bonus
FROM Employees;

-- Multiple calculated columns
SELECT
    employee_name,
    salary,
    salary * 12 AS Annual_Salary,
    salary + 5000 AS Revised_Salary,
    (salary + 5000) * 12 AS Revised_Annual_Salary
FROM Employees;

-- SELECT with department name
SELECT
    employee_name AS Employee,
    job_title AS Job,
    salary AS Salary,
    city AS City
FROM Employees;




# -- Chapter 7 — UPDATE & DELETE

USE basic_sql_queries_db;

-- UPDATE syntax
-- UPDATE table
-- SET column = value
-- WHERE condition;

-- Updating one column
UPDATE Employees
SET salary = 60000
WHERE employee_id = 101;

SELECT *
FROM Employees
WHERE employee_id = 101;

-- Updating multiple columns
UPDATE Employees
SET
    salary = 65000,
    city = 'Noida'
WHERE employee_id = 101;

SELECT *
FROM Employees
WHERE employee_id = 101;

-- UPDATE with WHERE
UPDATE Employees
SET salary = salary + 5000
WHERE department_id = 1;

SELECT
    employee_id,
    employee_name,
    salary,
    department_id
FROM Employees
WHERE department_id = 1;

-- Update using multiple conditions
UPDATE Employees
SET status = 'Inactive'
WHERE salary < 45000
AND age < 26;

SELECT *
FROM Employees
WHERE status = 'Inactive';

-- DELETE syntax
-- DELETE FROM table
-- WHERE condition;

-- Delete a specific record
DELETE FROM Employees
WHERE employee_id = 119;

SELECT *
FROM Employees
WHERE employee_id = 119;

-- Delete multiple records
DELETE FROM Employees
WHERE department_id = 5
AND status = 'Inactive';

SELECT *
FROM Employees
WHERE department_id = 5;

-- DELETE vs TRUNCATE vs DROP

-- DELETE
-- Removes selected rows.
-- WHERE can be used.
-- Table structure remains.

-- Example:
DELETE FROM IT_Employees
WHERE salary < 60000;

-- TRUNCATE
-- Removes all rows.
-- Table structure remains.
TRUNCATE TABLE IT_Employees;

SELECT *
FROM IT_Employees;

-- DROP
-- Removes the complete table including its structure.
DROP TABLE IT_Employees;

-- Verify table no longer exists
SHOW TABLES;




# -- Chapter 8 — SQL Operators & Filtering

USE basic_sql_queries_db;

-- Comparison operator =
SELECT *
FROM Employees
WHERE salary = 55000;

-- Not equal: <>
SELECT *
FROM Employees
WHERE department_id <> 1;

-- Not equal: !=
SELECT *
FROM Employees
WHERE department_id != 1;

-- Greater than >
SELECT *
FROM Employees
WHERE salary > 70000;

-- Less than <
SELECT *
FROM Employees
WHERE salary < 50000;

-- Greater than or equal >=
SELECT *
FROM Employees
WHERE salary >= 70000;

-- Less than or equal <=
SELECT *
FROM Employees
WHERE salary <= 50000;

-- AND
SELECT *
FROM Employees
WHERE salary > 50000
AND city = 'Delhi';

-- OR
SELECT *
FROM Employees
WHERE city = 'Delhi'
OR city = 'Mumbai';

-- NOT
SELECT *
FROM Employees
WHERE NOT department_id = 1;

-- BETWEEN
-- Includes both boundary values
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

-- BETWEEN with age
SELECT *
FROM Employees
WHERE age BETWEEN 25 AND 30;

-- IN
SELECT *
FROM Employees
WHERE city IN ('Delhi', 'Mumbai', 'Pune');

-- NOT IN
SELECT *
FROM Employees
WHERE city NOT IN ('Delhi', 'Mumbai');

-- LIKE
-- Names starting with R
SELECT *
FROM Employees
WHERE employee_name LIKE 'R%';

-- Names ending with a
SELECT *
FROM Employees
WHERE employee_name LIKE '%a';

-- Names containing 'an'
SELECT *
FROM Employees
WHERE employee_name LIKE '%an%';

-- NOT LIKE
SELECT *
FROM Employees
WHERE employee_name NOT LIKE 'R%';

-- IS NULL
SELECT *
FROM Employees
WHERE email IS NULL;

-- IS NOT NULL
SELECT *
FROM Employees
WHERE email IS NOT NULL;

-- Wildcard %
-- Represents zero or more characters
SELECT *
FROM Employees
WHERE employee_name LIKE 'A%';

-- Wildcard _
-- Represents exactly one character
SELECT *
FROM Employees
WHERE employee_name LIKE '_a%';

-- Example:
-- '_a%' means:
-- first character = anything
-- second character = a
-- remaining characters = anything

-- Multiple operators together
SELECT *
FROM Employees
WHERE salary BETWEEN 50000 AND 80000
AND city IN ('Delhi', 'Noida');

-- NOT with IN
SELECT *
FROM Employees
WHERE city NOT IN ('Delhi', 'Mumbai', 'Pune');



# -- Chapter 9 — WHERE Clause

USE basic_sql_queries_db;

-- WHERE with comparison operator
SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > 60000;

-- Equal to
SELECT *
FROM Employees
WHERE city = 'Delhi';

-- Not equal
SELECT *
FROM Employees
WHERE department_id <> 1;

-- WHERE with logical operators
SELECT *
FROM Employees
WHERE salary > 50000
AND city = 'Delhi';

SELECT *
FROM Employees
WHERE city = 'Delhi'
OR city = 'Mumbai';

SELECT *
FROM Employees
WHERE NOT city = 'Delhi';

-- WHERE with BETWEEN
SELECT
    employee_name,
    salary
FROM Employees
WHERE salary BETWEEN 50000 AND 80000;

-- WHERE with IN
SELECT
    employee_name,
    city
FROM Employees
WHERE city IN ('Delhi', 'Noida', 'Pune');

-- WHERE with NOT IN
SELECT
    employee_name,
    city
FROM Employees
WHERE city NOT IN ('Delhi', 'Mumbai');

-- WHERE with LIKE
SELECT
    employee_name,
    job_title
FROM Employees
WHERE employee_name LIKE 'R%';

-- Names containing 'a'
SELECT
    employee_name
FROM Employees
WHERE employee_name LIKE '%a%';

-- Multiple conditions
SELECT
    employee_name,
    salary,
    city,
    department_id
FROM Employees
WHERE salary >= 50000
AND salary <= 80000
AND city IN ('Delhi', 'Noida');

-- Numeric filtering
SELECT *
FROM Employees
WHERE age > 30;

SELECT *
FROM Employees
WHERE salary >= 70000;

SELECT *
FROM Employees
WHERE salary BETWEEN 45000 AND 60000;

-- Text filtering
SELECT *
FROM Employees
WHERE job_title = 'Sales Executive';

SELECT *
FROM Employees
WHERE city IN ('Delhi', 'Pune');

SELECT *
FROM Employees
WHERE employee_name LIKE 'A%';

-- Date filtering
SELECT *
FROM Employees
WHERE joining_date > '2022-01-01';

-- Date range
SELECT *
FROM Employees
WHERE joining_date BETWEEN '2022-01-01' AND '2023-12-31';

-- Employees who joined before a specific date
SELECT *
FROM Employees
WHERE joining_date < '2023-01-01';

-- Multiple conditions with date
SELECT
    employee_name,
    joining_date,
    salary
FROM Employees
WHERE joining_date >= '2022-01-01'
AND salary > 50000;

-- NULL filtering
SELECT *
FROM Employees
WHERE email IS NULL;

-- NOT NULL filtering
SELECT *
FROM Employees
WHERE email IS NOT NULL;

-- Complex WHERE condition
SELECT
    employee_name,
    salary,
    city,
    joining_date
FROM Employees
WHERE
    salary >= 50000
    AND city IN ('Delhi', 'Noida')
    AND joining_date >= '2022-01-01';
    
    
    
# -- Chapter 10 — ORDER BY, LIMIT & OFFSET

USE basic_sql_queries_db;

-- ORDER BY
-- Sort data in ascending order by default

SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary;

-- ASC
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary ASC;

-- DESC
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC;

-- Sort by employee name
SELECT
    employee_name,
    city
FROM Employees
ORDER BY employee_name ASC;

-- Sort by multiple columns
SELECT
    employee_name,
    department_id,
    salary
FROM Employees
ORDER BY department_id ASC, salary DESC;

-- First sort by department_id
-- Then sort salary from highest to lowest
-- within each department

-- Sorting using alias
SELECT
    employee_name AS Employee,
    salary AS Monthly_Salary
FROM Employees
ORDER BY Monthly_Salary DESC;

-- Another alias example
SELECT
    employee_name,
    salary * 12 AS Annual_Salary
FROM Employees
ORDER BY Annual_Salary DESC;

-- LIMIT
-- Return only a specific number of rows

SELECT *
FROM Employees
LIMIT 5;

-- Top 5 highest-paid employees
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5;

-- Top 3 lowest-paid employees
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary ASC
LIMIT 3;

-- LIMIT with WHERE
SELECT
    employee_name,
    salary,
    city
FROM Employees
WHERE city = 'Delhi'
ORDER BY salary DESC
LIMIT 3;

-- LIMIT with ORDER BY
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 10;

-- OFFSET
-- Skip the specified number of rows

SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5 OFFSET 0;

-- Skip first 5 rows
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

-- Skip first 10 rows
SELECT
    employee_name,
    salary
FROM Employees
ORDER BY salary DESC
LIMIT 5 OFFSET 10;

-- Pagination
-- Page 1
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
ORDER BY employee_id
LIMIT 5 OFFSET 0;

-- Page 2
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
ORDER BY employee_id
LIMIT 5 OFFSET 5;

-- Page 3
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
ORDER BY employee_id
LIMIT 5 OFFSET 10;

-- Pagination formula
-- OFFSET = (page_number - 1) * page_size

-- Example:
-- Page 1: (1 - 1) * 5 = 0
-- Page 2: (2 - 1) * 5 = 5
-- Page 3: (3 - 1) * 5 = 10

-- Top 5 employees from IT department
SELECT
    employee_name,
    salary
FROM Employees
WHERE department_id = 1
ORDER BY salary DESC
LIMIT 5;

-- Top 3 employees from each selected city
SELECT
    employee_name,
    city,
    salary
FROM Employees
WHERE city IN ('Delhi', 'Noida')
ORDER BY city ASC, salary DESC
LIMIT 6;


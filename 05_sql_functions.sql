-- Day 5 Database: SQL Functions

CREATE DATABASE sql_functions_db;

USE sql_functions_db;

-- Customers table

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    signup_date DATE
);

INSERT INTO Customers
(
    customer_id,
    customer_name,
    email,
    city,
    country,
    signup_date
)
VALUES
    (1, 'Ranjeet Kumar', 'ranjeet@gmail.com', 'Delhi', 'India', '2023-01-15'),
    (2, 'Amit Sharma', 'amit@gmail.com', 'Noida', 'India', '2023-03-20'),
    (3, 'Priya Singh', 'priya@gmail.com', 'Lucknow', 'India', '2023-05-10'),
    (4, 'Rahul Verma', 'rahul@gmail.com', 'Mumbai', 'India', '2022-11-25'),
    (5, 'Neha Gupta', 'neha@gmail.com', 'Pune', 'India', '2024-01-05'),
    (6, 'Anjali Mehta', 'anjali@gmail.com', 'Bangalore', 'India', '2024-02-14'),
    (7, 'Karan Malhotra', 'karan@gmail.com', 'Jaipur', 'India', '2024-04-18'),
    (8, 'Pooja Agarwal', 'pooja@gmail.com', 'Delhi', 'India', '2024-06-22'),
    (9, 'Suresh Yadav', 'suresh@gmail.com', 'Patna', 'India', '2023-08-30'),
    (10, 'Kavita Joshi', 'kavita@gmail.com', 'Chandigarh', 'India', '2022-09-12');

-- Employees table

CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    job_title VARCHAR(100),
    salary DECIMAL(10,2),
    city VARCHAR(50),
    joining_date DATE,
    manager_id INT
);

INSERT INTO Employees
(
    emp_id,
    emp_name,
    job_title,
    salary,
    city,
    joining_date,
    manager_id
)
VALUES
    (101, 'Ranjeet Kumar', 'Data Analyst', 55000.75, 'Delhi', '2023-01-10', NULL),
    (102, 'Amit Sharma', 'Software Engineer', 68500.50, 'Noida', '2022-06-15', 101),
    (103, 'Priya Singh', 'HR Executive', 45500.25, 'Lucknow', '2023-03-20', 101),
    (104, 'Rahul Verma', 'HR Manager', 82000.80, 'Delhi', '2021-08-12', NULL),
    (105, 'Neha Gupta', 'Accountant', 50500.40, 'Mumbai', '2022-01-25', 104),
    (106, 'Vikas Mehra', 'Finance Manager', 95000.90, 'Mumbai', '2020-11-05', NULL),
    (107, 'Anjali Mehta', 'Sales Executive', 42500.60, 'Bangalore', '2023-05-18', 106),
    (108, 'Karan Malhotra', 'Sales Executive', 48500.35, 'Bangalore', '2023-07-22', 106),
    (109, 'Pooja Agarwal', 'Sales Manager', 88000.75, 'Pune', '2021-04-14', NULL),
    (110, 'Suresh Yadav', 'Marketing Executive', 47000.20, 'Pune', '2022-09-30', 109);

-- Products table

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    stock_quantity INT
);

INSERT INTO Products
(
    product_id,
    product_name,
    category,
    price,
    discount_percent,
    stock_quantity
)
VALUES
    (201, 'Laptop', 'Electronics', 65000.75, 10.00, 25),
    (202, 'Mouse', 'Accessories', 850.50, 5.00, 100),
    (203, 'Keyboard', 'Accessories', 1450.75, 8.00, 75),
    (204, 'Monitor', 'Electronics', 18500.40, 12.00, 40),
    (205, 'Printer', 'Office', 12500.90, 15.00, 20),
    (206, 'Headphones', 'Accessories', 2500.60, 10.00, 60),
    (207, 'Tablet', 'Electronics', 28000.80, 7.50, 35),
    (208, 'Webcam', 'Electronics', 4500.45, 5.00, 50);

-- Sales table

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    sale_amount DECIMAL(12,2),
    sale_date DATETIME,
    payment_method VARCHAR(30),
    status VARCHAR(30),
    FOREIGN KEY (customer_id)
        REFERENCES Customers(customer_id),
    FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
);

INSERT INTO Sales
(
    sale_id,
    customer_id,
    product_id,
    quantity,
    sale_amount,
    sale_date,
    payment_method,
    status
)
VALUES
    (1, 1, 201, 1, 58500.68, '2024-01-05 10:30:00', 'UPI', 'Completed'),
    (2, 2, 202, 3, 2423.93, '2024-01-08 11:15:00', 'Card', 'Completed'),
    (3, 3, 204, 2, 32560.70, '2024-01-12 14:20:00', 'UPI', 'Completed'),
    (4, 4, 203, 4, 5338.76, '2024-02-02 09:45:00', 'Cash', 'Completed'),
    (5, 5, 205, 1, 10625.77, '2024-02-10 16:30:00', 'Card', 'Completed'),
    (6, 6, 206, 2, 4501.08, '2024-02-14 13:10:00', 'UPI', 'Completed'),
    (7, 7, 207, 1, 25900.74, '2024-03-01 15:40:00', 'Card', 'Completed'),
    (8, 8, 208, 3, 12826.28, '2024-03-15 12:25:00', 'UPI', 'Pending'),
    (9, 9, 201, 2, 117001.35, '2024-04-05 17:20:00', 'Card', 'Completed'),
    (10, 10, 204, 1, 16280.35, '2024-04-18 10:05:00', 'Cash', 'Completed'),
    (11, 1, 202, 5, 4039.88, '2024-05-01 11:30:00', 'UPI', 'Completed'),
    (12, 2, 206, 3, 6751.62, '2024-05-10 14:45:00', 'Card', 'Completed'),
    (13, 3, 207, 2, 51851.48, '2024-06-05 09:15:00', 'UPI', 'Completed'),
    (14, 4, 205, 2, 21251.53, '2024-06-15 16:50:00', 'Card', 'Pending'),
    (15, 5, 203, 6, 8008.14, '2024-07-01 13:35:00', 'Cash', 'Completed'),
    (16, 6, 201, 1, 58500.68, '2024-07-12 18:10:00', 'UPI', 'Completed'),
    (17, 7, 204, 2, 32560.70, '2024-08-05 10:25:00', 'Card', 'Completed'),
    (18, 8, 207, 1, 25900.74, '2024-08-20 15:15:00', 'UPI', 'Completed'),
    (19, 9, 208, 4, 17101.71, '2024-09-05 11:40:00', 'Card', 'Completed'),
    (20, 10, 202, 10, 8079.75, '2024-09-15 14:30:00', 'Cash', 'Completed');

-- Check tables

SHOW TABLES;

-- Check data

SELECT * FROM Customers;

SELECT * FROM Employees;

SELECT * FROM Products;

SELECT * FROM Sales;

-- Chapter 17: String Functions

USE sql_functions_db;

-- CONCAT()
-- Combines two or more strings.

SELECT CONCAT('Hello', ' ', 'Ranjeet') AS message;

SELECT
    customer_id,
    CONCAT(customer_name, ' - ', city) AS customer_details
FROM Customers;

SELECT
    emp_id,
    CONCAT(emp_name, ' - ', job_title) AS employee_details
FROM Employees;


-- CONCAT_WS()
-- Combines strings using a separator.

SELECT
    CONCAT_WS(' - ', 'Ranjeet Kumar', 'Delhi', 'India') AS customer_details;

SELECT
    customer_id,
    CONCAT_WS(' | ', customer_name, city, country) AS customer_details
FROM Customers;

SELECT
    emp_id,
    CONCAT_WS(' | ', emp_name, job_title, city) AS employee_details
FROM Employees;


-- UPPER()
-- Converts text into uppercase.

SELECT
    customer_name,
    UPPER(customer_name) AS uppercase_name
FROM Customers;

SELECT
    city,
    UPPER(city) AS uppercase_city
FROM Customers;


-- LOWER()
-- Converts text into lowercase.

SELECT
    customer_name,
    LOWER(customer_name) AS lowercase_name
FROM Customers;

SELECT
    email,
    LOWER(email) AS lowercase_email
FROM Customers;


-- LENGTH()
-- Returns the length of a string in bytes.

SELECT
    customer_name,
    LENGTH(customer_name) AS name_length
FROM Customers;

SELECT
    email,
    LENGTH(email) AS email_length
FROM Customers;


-- TRIM()
-- Removes spaces from both sides of a string.

SELECT
    TRIM('   Ranjeet Kumar   ') AS trimmed_name;

SELECT
    TRIM('   SQL Functions   ') AS trimmed_text;


-- LTRIM()
-- Removes spaces from the left side.

SELECT
    LTRIM('   Ranjeet Kumar') AS left_trimmed_name;


-- RTRIM()
-- Removes spaces from the right side.

SELECT
    RTRIM('Ranjeet Kumar   ') AS right_trimmed_name;


-- SUBSTRING()
-- Extracts a part of a string.

SELECT
    SUBSTRING('Ranjeet Kumar', 1, 7) AS extracted_text;

SELECT
    customer_name,
    SUBSTRING(customer_name, 1, 5) AS first_five_characters
FROM Customers;

-- SUBSTRING() starting from a position

SELECT
    SUBSTRING('Data Science', 6) AS extracted_text;


-- LEFT()
-- Returns characters from the left side.

SELECT
    customer_name,
    LEFT(customer_name, 5) AS first_five_characters
FROM Customers;

SELECT
    email,
    LEFT(email, 5) AS first_five_characters
FROM Customers;


-- RIGHT()
-- Returns characters from the right side.

SELECT
    customer_name,
    RIGHT(customer_name, 5) AS last_five_characters
FROM Customers;

SELECT
    email,
    RIGHT(email, 4) AS last_four_characters
FROM Customers;


-- REPLACE()
-- Replaces one string with another string.

SELECT
    REPLACE('I am learning SQL', 'SQL', 'Python') AS modified_text;

SELECT
    customer_name,
    REPLACE(customer_name, 'a', '@') AS modified_name
FROM Customers;

SELECT
    city,
    REPLACE(city, 'Delhi', 'New Delhi') AS modified_city
FROM Customers;


-- LOCATE()
-- Returns the position of a substring inside a string.

SELECT
    LOCATE('SQL', 'I am learning SQL') AS position;

SELECT
    LOCATE('a', 'Ranjeet') AS position;

SELECT
    customer_name,
    LOCATE('a', customer_name) AS position_of_a
FROM Customers;


-- CONCAT() with UPPER()

SELECT
    customer_id,
    CONCAT(
        UPPER(customer_name),
        ' - ',
        city
    ) AS customer_details
FROM Customers;


-- CONCAT_WS() with UPPER()

SELECT
    customer_id,
    CONCAT_WS(
        ' | ',
        UPPER(customer_name),
        UPPER(city),
        country
    ) AS customer_details
FROM Customers;


-- LOWER() with email

SELECT
    customer_name,
    LOWER(email) AS formatted_email
FROM Customers;


-- LENGTH() with WHERE

SELECT
    customer_id,
    customer_name,
    LENGTH(customer_name) AS name_length
FROM Customers
WHERE LENGTH(customer_name) > 12;


-- LOCATE() with WHERE

SELECT
    customer_id,
    customer_name
FROM Customers
WHERE LOCATE('a', customer_name) > 0;


-- LEFT() with WHERE

SELECT
    customer_id,
    customer_name
FROM Customers
WHERE LEFT(city, 1) = 'D';


-- RIGHT() with WHERE

SELECT
    customer_id,
    customer_name,
    email
FROM Customers
WHERE RIGHT(email, 3) = 'com';


-- REPLACE() for email domain

SELECT
    customer_name,
    email,
    REPLACE(email, 'gmail.com', 'company.com') AS new_email
FROM Customers;


-- SUBSTRING() for email username

SELECT
    customer_name,
    email,
    SUBSTRING(
        email,
        1,
        LOCATE('@', email) - 1
    ) AS email_username
FROM Customers;


-- Extract email domain

SELECT
    customer_name,
    email,
    SUBSTRING(
        email,
        LOCATE('@', email) + 1
    ) AS email_domain
FROM Customers;


-- String functions with ORDER BY

SELECT
    customer_name,
    LENGTH(customer_name) AS name_length
FROM Customers
ORDER BY name_length DESC;


-- String functions with DISTINCT

SELECT DISTINCT
    UPPER(city) AS city_name
FROM Customers
ORDER BY city_name;


-- Formatting employee information

SELECT
    emp_id,
    CONCAT_WS(
        ' | ',
        emp_name,
        job_title,
        city
    ) AS employee_information
FROM Employees;


-- Create a short employee code

SELECT
    emp_id,
    emp_name,
    CONCAT(
        LEFT(UPPER(emp_name), 3),
        emp_id
    ) AS employee_code
FROM Employees;


-- Create a customer code

SELECT
    customer_id,
    customer_name,
    CONCAT(
        UPPER(LEFT(customer_name, 3)),
        customer_id
    ) AS customer_code
FROM Customers;


-- Complete String Functions example

SELECT
    customer_id,
    customer_name,
    UPPER(customer_name) AS uppercase_name,
    LOWER(customer_name) AS lowercase_name,
    LENGTH(customer_name) AS name_length,
    LEFT(customer_name, 3) AS first_three,
    RIGHT(customer_name, 3) AS last_three,
    CONCAT_WS(' - ', customer_name, city, country) AS customer_details
FROM Customers
ORDER BY customer_id;


-- Real-world example:
-- Extract username and domain from customer email

SELECT
    customer_id,
    customer_name,
    email,
    SUBSTRING(
        email,
        1,
        LOCATE('@', email) - 1
    ) AS email_username,
    SUBSTRING(
        email,
        LOCATE('@', email) + 1
    ) AS email_domain
FROM Customers;


-- Real-world example:
-- Create formatted customer information

SELECT
    customer_id,
    CONCAT(
        UPPER(customer_name),
        ' | ',
        LOWER(email),
        ' | ',
        UPPER(city)
    ) AS customer_information
FROM Customers;




-- Chapter 18: Numeric Functions

USE sql_functions_db;

-- ROUND()
-- Rounds a number to the specified number of decimal places.

SELECT ROUND(125.6789, 2) AS rounded_value;

SELECT
    product_name,
    price,
    ROUND(price, 0) AS rounded_price
FROM Products;

SELECT
    product_name,
    price,
    discount_percent,
    ROUND(price * discount_percent / 100, 2) AS discount_amount
FROM Products;


-- ROUND() without decimal places

SELECT ROUND(125.6789) AS rounded_value;


-- CEIL()
-- Returns the smallest integer greater than or equal to a number.

SELECT CEIL(10.25) AS result;

SELECT CEIL(10.99) AS result;

SELECT
    product_name,
    price,
    CEIL(price) AS ceiling_price
FROM Products;


-- CEILING()
-- Same as CEIL().

SELECT CEILING(10.25) AS result;

SELECT
    product_name,
    price,
    CEILING(price) AS ceiling_price
FROM Products;


-- FLOOR()
-- Returns the largest integer less than or equal to a number.

SELECT FLOOR(10.99) AS result;

SELECT FLOOR(10.25) AS result;

SELECT
    product_name,
    price,
    FLOOR(price) AS floor_price
FROM Products;


-- ABS()
-- Returns the absolute value of a number.

SELECT ABS(-100) AS result;

SELECT ABS(100) AS result;

SELECT
    -500 AS original_value,
    ABS(-500) AS absolute_value;


-- MOD()
-- Returns the remainder after division.

SELECT MOD(10, 3) AS remainder;

SELECT MOD(20, 4) AS remainder;

SELECT
    product_id,
    stock_quantity,
    MOD(stock_quantity, 2) AS remainder
FROM Products;


-- Find products with even stock quantity

SELECT
    product_name,
    stock_quantity
FROM Products
WHERE MOD(stock_quantity, 2) = 0;


-- Find products with odd stock quantity

SELECT
    product_name,
    stock_quantity
FROM Products
WHERE MOD(stock_quantity, 2) <> 0;


-- POWER()
-- Returns a number raised to a specified power.

SELECT POWER(2, 3) AS result;

SELECT POWER(5, 2) AS result;

SELECT
    POWER(10, 2) AS square,
    POWER(10, 3) AS cube;


-- SQRT()
-- Returns the square root of a number.

SELECT SQRT(25) AS result;

SELECT SQRT(100) AS result;

SELECT
    product_id,
    stock_quantity,
    SQRT(stock_quantity) AS square_root
FROM Products;


-- Numeric functions with Sales

SELECT
    sale_id,
    sale_amount,
    ROUND(sale_amount, 0) AS rounded_amount,
    CEIL(sale_amount) AS ceiling_amount,
    FLOOR(sale_amount) AS floor_amount
FROM Sales;


-- Calculate discount amount

SELECT
    product_name,
    price,
    discount_percent,
    ROUND(
        price * discount_percent / 100,
        2
    ) AS discount_amount
FROM Products;


-- Calculate final price after discount

SELECT
    product_name,
    price,
    discount_percent,
    ROUND(
        price - (price * discount_percent / 100),
        2
    ) AS final_price
FROM Products;


-- Calculate sales amount per quantity

SELECT
    sale_id,
    quantity,
    sale_amount,
    ROUND(sale_amount / quantity, 2) AS amount_per_item
FROM Sales;


-- Numeric functions with ORDER BY

SELECT
    product_name,
    price,
    ROUND(price, 0) AS rounded_price
FROM Products
ORDER BY rounded_price DESC;


-- Complete numeric example

SELECT
    product_id,
    product_name,
    price,
    discount_percent,
    ROUND(price, 2) AS rounded_price,
    CEIL(price) AS ceiling_price,
    FLOOR(price) AS floor_price,
    ROUND(price * discount_percent / 100, 2) AS discount_amount,
    ROUND(
        price - (price * discount_percent / 100),
        2
    ) AS final_price
FROM Products
ORDER BY final_price DESC;



-- Chapter 19: Date & Time Functions

USE sql_functions_db;

-- CURDATE()
-- Returns the current date.

SELECT CURDATE() AS current_date;


-- CURRENT_DATE
-- Returns the current date.

SELECT CURRENT_DATE AS current_date;


-- NOW()
-- Returns the current date and time.

SELECT NOW() AS current_datetime;


-- CURRENT_TIMESTAMP
-- Returns the current date and time.

SELECT CURRENT_TIMESTAMP AS current_datetime;


-- YEAR()
-- Extracts the year from a date.

SELECT
    customer_name,
    signup_date,
    YEAR(signup_date) AS signup_year
FROM Customers;


-- MONTH()
-- Extracts the month number from a date.

SELECT
    customer_name,
    signup_date,
    MONTH(signup_date) AS signup_month
FROM Customers;


-- DAY()
-- Extracts the day of the month.

SELECT
    customer_name,
    signup_date,
    DAY(signup_date) AS signup_day
FROM Customers;


-- HOUR()
-- Extracts the hour from a DATETIME value.

SELECT
    sale_id,
    sale_date,
    HOUR(sale_date) AS sale_hour
FROM Sales;


-- MINUTE()
-- Extracts the minute from a DATETIME value.

SELECT
    sale_id,
    sale_date,
    MINUTE(sale_date) AS sale_minute
FROM Sales;


-- SECOND()
-- Extracts the second from a DATETIME value.

SELECT
    sale_id,
    sale_date,
    SECOND(sale_date) AS sale_second
FROM Sales;


-- DATEDIFF()
-- Returns the number of days between two dates.

SELECT
    DATEDIFF('2024-12-31', '2024-01-01') AS total_days;


-- Calculate customer membership days

SELECT
    customer_id,
    customer_name,
    signup_date,
    DATEDIFF(CURDATE(), signup_date) AS membership_days
FROM Customers;


-- Calculate employee working days

SELECT
    emp_id,
    emp_name,
    joining_date,
    DATEDIFF(CURDATE(), joining_date) AS working_days
FROM Employees;


-- Calculate days between sale date and today

SELECT
    sale_id,
    sale_date,
    DATEDIFF(CURDATE(), DATE(sale_date)) AS days_since_sale
FROM Sales;


-- DATE_ADD()
-- Adds a specified time interval to a date.

SELECT
    DATE_ADD('2024-01-01', INTERVAL 10 DAY) AS new_date;

SELECT
    DATE_ADD('2024-01-01', INTERVAL 2 MONTH) AS new_date;

SELECT
    DATE_ADD('2024-01-01', INTERVAL 1 YEAR) AS new_date;


-- Add 30 days to customer signup date

SELECT
    customer_name,
    signup_date,
    DATE_ADD(signup_date, INTERVAL 30 DAY) AS after_30_days
FROM Customers;


-- Add one year to employee joining date

SELECT
    emp_name,
    joining_date,
    DATE_ADD(joining_date, INTERVAL 1 YEAR) AS one_year_later
FROM Employees;


-- DATE_SUB()
-- Subtracts a specified time interval from a date.

SELECT
    DATE_SUB('2024-12-31', INTERVAL 10 DAY) AS new_date;

SELECT
    DATE_SUB('2024-12-31', INTERVAL 2 MONTH) AS new_date;

SELECT
    DATE_SUB('2024-12-31', INTERVAL 1 YEAR) AS new_date;


-- Subtract 30 days from signup date

SELECT
    customer_name,
    signup_date,
    DATE_SUB(signup_date, INTERVAL 30 DAY) AS previous_date
FROM Customers;


-- DATE_FORMAT()
-- Formats a date or datetime into a desired format.

SELECT
    DATE_FORMAT('2024-01-15', '%d-%m-%Y') AS formatted_date;

SELECT
    DATE_FORMAT('2024-01-15', '%M %d, %Y') AS formatted_date;


-- Format customer signup dates

SELECT
    customer_name,
    signup_date,
    DATE_FORMAT(
        signup_date,
        '%d-%m-%Y'
    ) AS formatted_date
FROM Customers;


-- Format employee joining dates

SELECT
    emp_name,
    joining_date,
    DATE_FORMAT(
        joining_date,
        '%d %M %Y'
    ) AS formatted_date
FROM Employees;


-- Format sales date and time

SELECT
    sale_id,
    sale_date,
    DATE_FORMAT(
        sale_date,
        '%d-%m-%Y %H:%i:%s'
    ) AS formatted_datetime
FROM Sales;


-- Extract year and month from sales

SELECT
    sale_id,
    sale_date,
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month
FROM Sales;


-- Filter sales by year

SELECT
    sale_id,
    sale_date,
    sale_amount
FROM Sales
WHERE YEAR(sale_date) = 2024;


-- Filter customers by signup year

SELECT
    customer_id,
    customer_name,
    signup_date
FROM Customers
WHERE YEAR(signup_date) = 2024;


-- Sales made during a particular month

SELECT
    sale_id,
    sale_date,
    sale_amount
FROM Sales
WHERE MONTH(sale_date) = 5;


-- Group sales by year

SELECT
    YEAR(sale_date) AS sale_year,
    SUM(sale_amount) AS total_sales
FROM Sales
GROUP BY YEAR(sale_date);


-- Group sales by month

SELECT
    MONTH(sale_date) AS sale_month,
    SUM(sale_amount) AS total_sales
FROM Sales
GROUP BY MONTH(sale_date)
ORDER BY sale_month;


-- Group sales by year and month

SELECT
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month,
    SUM(sale_amount) AS total_sales
FROM Sales
GROUP BY
    YEAR(sale_date),
    MONTH(sale_date)
ORDER BY
    sale_year,
    sale_month;


-- Extract sale hour

SELECT
    sale_id,
    sale_date,
    HOUR(sale_date) AS sale_hour,
    sale_amount
FROM Sales
ORDER BY sale_hour;


-- Complete date and time example

SELECT
    sale_id,
    sale_date,
    DATE(sale_date) AS sale_date_only,
    YEAR(sale_date) AS sale_year,
    MONTH(sale_date) AS sale_month,
    DAY(sale_date) AS sale_day,
    HOUR(sale_date) AS sale_hour,
    MINUTE(sale_date) AS sale_minute,
    SECOND(sale_date) AS sale_second,
    DATE_FORMAT(
        sale_date,
        '%d-%m-%Y %H:%i:%s'
    ) AS formatted_datetime
FROM Sales;



-- Chapter 20: CASE Statement

USE sql_functions_db;

-- What is CASE?

-- CASE is used to apply conditional logic in SQL.
-- It works similar to IF-ELSE logic.

-- CASE syntax

SELECT
    column_name,
    CASE
        WHEN condition THEN result
        WHEN condition THEN result
        ELSE result
    END AS alias_name
FROM table_name;


-- Simple CASE

-- Simple CASE compares one expression
-- with different values.

SELECT
    customer_name,
    city,
    CASE city
        WHEN 'Delhi' THEN 'North India'
        WHEN 'Noida' THEN 'North India'
        WHEN 'Lucknow' THEN 'North India'
        WHEN 'Mumbai' THEN 'West India'
        WHEN 'Pune' THEN 'West India'
        WHEN 'Bangalore' THEN 'South India'
        ELSE 'Other'
    END AS region
FROM Customers;


-- Searched CASE

-- Searched CASE checks different conditions.

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 90000 THEN 'High Salary'
        WHEN salary >= 70000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM Employees;


-- CASE with SELECT

SELECT
    emp_id,
    emp_name,
    salary,
    CASE
        WHEN salary >= 90000 THEN 'High'
        WHEN salary >= 70000 THEN 'Medium'
        WHEN salary >= 50000 THEN 'Average'
        ELSE 'Low'
    END AS salary_category
FROM Employees;


-- CASE with SELECT for sales classification

SELECT
    sale_id,
    sale_amount,
    CASE
        WHEN sale_amount >= 50000 THEN 'High Sale'
        WHEN sale_amount >= 20000 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END AS sales_category
FROM Sales;


-- CASE with WHERE

SELECT
    emp_id,
    emp_name,
    salary
FROM Employees
WHERE
    CASE
        WHEN salary >= 70000 THEN 1
        ELSE 0
    END = 1;


-- Another CASE with WHERE example

SELECT
    sale_id,
    sale_amount,
    status
FROM Sales
WHERE
    CASE
        WHEN status = 'Completed' THEN sale_amount
        ELSE 0
    END > 50000;


-- CASE with GROUP BY

SELECT
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category,
    COUNT(*) AS total_employees
FROM Employees
GROUP BY
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END;


-- CASE with GROUP BY for sales

SELECT
    CASE
        WHEN sale_amount >= 50000 THEN 'High Sale'
        WHEN sale_amount >= 20000 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END AS sales_category,
    COUNT(*) AS total_sales
FROM Sales
GROUP BY
    CASE
        WHEN sale_amount >= 50000 THEN 'High Sale'
        WHEN sale_amount >= 20000 THEN 'Medium Sale'
        ELSE 'Low Sale'
    END;


-- CASE with ORDER BY

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 90000 THEN 1
        WHEN salary >= 70000 THEN 2
        WHEN salary >= 50000 THEN 3
        ELSE 4
    END AS salary_priority
FROM Employees
ORDER BY salary_priority;


-- CASE with ORDER BY using category

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 90000 THEN 'High'
        WHEN salary >= 70000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employees
ORDER BY
    CASE
        WHEN salary >= 90000 THEN 1
        WHEN salary >= 70000 THEN 2
        ELSE 3
    END;


-- CASE with aggregate functions

SELECT
    SUM(
        CASE
            WHEN salary >= 70000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees
FROM Employees;


-- Count employees by salary category

SELECT
    COUNT(
        CASE
            WHEN salary >= 70000 THEN 1
        END
    ) AS high_salary_employees,
    COUNT(
        CASE
            WHEN salary < 70000 THEN 1
        END
    ) AS below_70000
FROM Employees;


-- Calculate sales from completed orders

SELECT
    SUM(
        CASE
            WHEN status = 'Completed'
            THEN sale_amount
            ELSE 0
        END
    ) AS completed_sales
FROM Sales;


-- Calculate pending sales

SELECT
    SUM(
        CASE
            WHEN status = 'Pending'
            THEN sale_amount
            ELSE 0
        END
    ) AS pending_sales
FROM Sales;


-- Data classification

SELECT
    product_name,
    stock_quantity,
    CASE
        WHEN stock_quantity >= 75 THEN 'High Stock'
        WHEN stock_quantity >= 40 THEN 'Medium Stock'
        ELSE 'Low Stock'
    END AS stock_category
FROM Products;


-- Salary classification

SELECT
    emp_id,
    emp_name,
    salary,
    CASE
        WHEN salary >= 90000 THEN 'Very High'
        WHEN salary >= 70000 THEN 'High'
        WHEN salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category
FROM Employees;


-- Sales classification

SELECT
    sale_id,
    sale_amount,
    CASE
        WHEN sale_amount >= 50000 THEN 'High Sale'
        WHEN sale_amount >= 20000 THEN 'Medium Sale'
        WHEN sale_amount >= 10000 THEN 'Low Sale'
        ELSE 'Very Low Sale'
    END AS sales_category
FROM Sales;


-- Profit/Loss classification

-- Assume cost is 90% of sale amount.

SELECT
    sale_id,
    sale_amount,
    sale_amount * 0.90 AS cost,
    sale_amount - (sale_amount * 0.90) AS profit,
    CASE
        WHEN sale_amount - (sale_amount * 0.90) > 0
            THEN 'Profit'
        WHEN sale_amount - (sale_amount * 0.90) < 0
            THEN 'Loss'
        ELSE 'No Profit No Loss'
    END AS result
FROM Sales;


-- Profit/Loss classification with a fixed cost

SELECT
    sale_id,
    sale_amount,
    10000 AS cost,
    sale_amount - 10000 AS profit_loss,
    CASE
        WHEN sale_amount > 10000 THEN 'Profit'
        WHEN sale_amount < 10000 THEN 'Loss'
        ELSE 'No Profit No Loss'
    END AS result
FROM Sales;


-- Customer segmentation

SELECT
    c.customer_id,
    c.customer_name,
    SUM(s.sale_amount) AS total_spending,
    CASE
        WHEN SUM(s.sale_amount) >= 100000 THEN 'Premium Customer'
        WHEN SUM(s.sale_amount) >= 50000 THEN 'Regular Customer'
        ELSE 'Basic Customer'
    END AS customer_segment
FROM Customers c
JOIN Sales s
    ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- Customer segmentation based on number of purchases

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(s.sale_id) AS total_orders,
    CASE
        WHEN COUNT(s.sale_id) >= 3 THEN 'Frequent Customer'
        WHEN COUNT(s.sale_id) = 2 THEN 'Regular Customer'
        ELSE 'New Customer'
    END AS customer_segment
FROM Customers c
LEFT JOIN Sales s
    ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- Customer segmentation using spending and orders

SELECT
    c.customer_id,
    c.customer_name,
    COUNT(s.sale_id) AS total_orders,
    COALESCE(SUM(s.sale_amount), 0) AS total_spending,
    CASE
        WHEN COALESCE(SUM(s.sale_amount), 0) >= 100000
             AND COUNT(s.sale_id) >= 2
            THEN 'Premium Customer'

        WHEN COALESCE(SUM(s.sale_amount), 0) >= 50000
            THEN 'Regular Customer'

        ELSE 'Basic Customer'
    END AS customer_segment
FROM Customers c
LEFT JOIN Sales s
    ON c.customer_id = s.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;


-- CASE with aggregate functions

SELECT
    COUNT(*) AS total_employees,

    SUM(
        CASE
            WHEN salary >= 70000 THEN 1
            ELSE 0
        END
    ) AS high_salary_employees,

    SUM(
        CASE
            WHEN salary < 70000 THEN 1
            ELSE 0
        END
    ) AS lower_salary_employees

FROM Employees;


-- Sales status summary using CASE

SELECT
    COUNT(*) AS total_orders,

    SUM(
        CASE
            WHEN status = 'Completed' THEN 1
            ELSE 0
        END
    ) AS completed_orders,

    SUM(
        CASE
            WHEN status = 'Pending' THEN 1
            ELSE 0
        END
    ) AS pending_orders

FROM Sales;


-- Sales amount summary using CASE

SELECT
    SUM(
        CASE
            WHEN status = 'Completed'
            THEN sale_amount
            ELSE 0
        END
    ) AS completed_sales,

    SUM(
        CASE
            WHEN status = 'Pending'
            THEN sale_amount
            ELSE 0
        END
    ) AS pending_sales

FROM Sales;


-- CASE with DATE functions

SELECT
    customer_name,
    signup_date,
    CASE
        WHEN YEAR(signup_date) <= 2022 THEN 'Old Customer'
        WHEN YEAR(signup_date) = 2023 THEN 'Existing Customer'
        ELSE 'New Customer'
    END AS customer_type
FROM Customers;


-- Complete CASE example

SELECT
    e.emp_id,
    e.emp_name,
    e.job_title,
    e.salary,

    CASE
        WHEN e.salary >= 90000 THEN 'Very High'
        WHEN e.salary >= 70000 THEN 'High'
        WHEN e.salary >= 50000 THEN 'Medium'
        ELSE 'Low'
    END AS salary_category,

    CASE
        WHEN e.salary >= 70000 THEN 'Management Level'
        WHEN e.salary >= 50000 THEN 'Professional Level'
        ELSE 'Entry Level'
    END AS employee_level

FROM Employees e
ORDER BY e.salary DESC;



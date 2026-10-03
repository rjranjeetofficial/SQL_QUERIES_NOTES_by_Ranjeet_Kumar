-- DAY 9 - DATABASE OPERATIONS & SECURITY
-- Database: security_operations_db

CREATE DATABASE security_operations_db;

USE security_operations_db;

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
    email VARCHAR(100),

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
    email
)
VALUES
    (101, 'Ranjeet Kumar', 'Data Analyst', 55000, 1, '2023-01-15', 'ranjeet@company.com'),
    (102, 'Amit Sharma', 'Software Engineer', 72000, 1, '2022-06-10', 'amit@company.com'),
    (103, 'Priya Singh', 'HR Executive', 45000, 2, '2023-03-20', 'priya@company.com'),
    (104, 'Rahul Verma', 'HR Manager', 78000, 2, '2021-08-12', 'rahul@company.com'),
    (105, 'Neha Gupta', 'Accountant', 52000, 3, '2022-01-25', 'neha@company.com'),
    (106, 'Vikas Mehra', 'Finance Manager', 90000, 3, '2020-11-05', 'vikas@company.com'),
    (107, 'Anjali Mehta', 'Sales Executive', 42000, 4, '2023-05-18', 'anjali@company.com'),
    (108, 'Karan Malhotra', 'Sales Executive', 48000, 4, '2023-07-22', 'karan@company.com'),
    (109, 'Pooja Agarwal', 'Sales Manager', 85000, 4, '2021-04-14', 'pooja@company.com'),
    (110, 'Suresh Yadav', 'Marketing Executive', 47000, 5, '2022-09-30', 'suresh@company.com'),
    (111, 'Kavita Joshi', 'Marketing Executive', 50000, 5, '2023-02-11', 'kavita@company.com'),
    (112, 'Arjun Kapoor', 'Marketing Manager', 80000, 5, '2020-05-16', 'arjun@company.com');


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
    (8, 'Pooja Singh', 'pooja@gmail.com', 'Noida', '2023-08-30');


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
    (1010, 8, '2024-04-05', 'Completed');


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
    (18, 1010, 208, 1, 4500);


-- Employee Audit table
-- Used to store INSERT, UPDATE and DELETE activities

CREATE TABLE Employee_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    employee_name VARCHAR(100),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_type VARCHAR(30),
    action_time DATETIME
);


-- Salary Audit table
-- Used to track salary changes

CREATE TABLE Salary_Audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    employee_name VARCHAR(100),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    changed_at DATETIME
);


-- Check all tables

SHOW TABLES;


-- Check departments

SELECT *
FROM Departments;


-- Check employees

SELECT *
FROM Employees;


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


-- Check empty audit tables

SELECT *
FROM Employee_Audit;


SELECT *
FROM Salary_Audit;


# Chapter 27 — Transactions

USE security_operations_db;


-- What is a Transaction?

-- A transaction is a group of SQL operations
-- treated as one single unit of work.


-- START TRANSACTION

START TRANSACTION;

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 101;

-- Check the change before COMMIT

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id = 101;

-- Save the transaction permanently

COMMIT;


-- ROLLBACK

START TRANSACTION;

UPDATE Employees
SET salary = salary + 10000
WHERE employee_id = 102;

-- Check the temporary change

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id = 102;

-- Undo the transaction

ROLLBACK;

-- Check again

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id = 102;


-- SAVEPOINT

START TRANSACTION;

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 103;

SAVEPOINT salary_point;


-- Another change

UPDATE Employees
SET salary = salary + 10000
WHERE employee_id = 104;


-- Check changes

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id IN (103, 104);


-- Rollback only to SAVEPOINT

ROLLBACK TO SAVEPOINT salary_point;


-- Check the result

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id IN (103, 104);


-- Permanently save the remaining transaction

COMMIT;


-- Multiple SAVEPOINTS

START TRANSACTION;

UPDATE Employees
SET salary = salary + 1000
WHERE employee_id = 105;

SAVEPOINT point1;


UPDATE Employees
SET salary = salary + 2000
WHERE employee_id = 106;

SAVEPOINT point2;


UPDATE Employees
SET salary = salary + 3000
WHERE employee_id = 107;


-- Rollback to point2

ROLLBACK TO SAVEPOINT point2;


-- Save the transaction

COMMIT;


-- Transaction with INSERT

START TRANSACTION;

INSERT INTO Customers
(
    customer_id,
    customer_name,
    email,
    city,
    signup_date
)
VALUES
(
    9,
    'Transaction Customer',
    'transaction@gmail.com',
    'Delhi',
    CURDATE()
);

SELECT *
FROM Customers
WHERE customer_id = 9;

COMMIT;


-- Transaction with DELETE

START TRANSACTION;

DELETE FROM Customers
WHERE customer_id = 9;

SELECT *
FROM Customers
WHERE customer_id = 9;

ROLLBACK;

-- Customer is restored

SELECT *
FROM Customers
WHERE customer_id = 9;


-- Transaction with UPDATE and ROLLBACK

START TRANSACTION;

UPDATE Products
SET stock_quantity = stock_quantity - 5
WHERE product_id = 201;

SELECT
    product_id,
    product_name,
    stock_quantity
FROM Products
WHERE product_id = 201;

ROLLBACK;


-- Check stock after rollback

SELECT
    product_id,
    product_name,
    stock_quantity
FROM Products
WHERE product_id = 201;


-- ACID Properties

-- Atomicity
-- All operations of a transaction succeed
-- or all operations can be rolled back.


-- Consistency
-- Transaction must keep the database
-- in a valid state.


-- Isolation
-- Transactions running at the same time
-- should not incorrectly interfere with each other.


-- Durability
-- Once COMMIT is completed,
-- committed changes are permanently saved.


-- Complete Transaction Example

START TRANSACTION;


-- Step 1

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 101;


-- Step 2

SAVEPOINT salary_update;


-- Step 3

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 102;


-- Undo Step 3

ROLLBACK TO SAVEPOINT salary_update;


-- Save Step 1

COMMIT;


-- Check final result

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id IN (101, 102);



## Chapter 28 — Triggers

USE security_operations_db;


-- What is a Trigger?

-- A trigger is a database program
-- that automatically executes when
-- INSERT, UPDATE or DELETE occurs.


-- OLD and NEW

-- INSERT
-- NEW contains the new row.

-- UPDATE
-- OLD contains the previous row.
-- NEW contains the new row.

-- DELETE
-- OLD contains the deleted row.


-- BEFORE INSERT

DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT
ON Employees
FOR EACH ROW
BEGIN

    -- Prevent negative salary

    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;

END$$

DELIMITER ;


-- Test BEFORE INSERT

INSERT INTO Employees
(
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id,
    joining_date,
    email
)
VALUES
(
    113,
    'Test Employee',
    'Intern',
    -5000,
    1,
    '2024-01-01',
    'test@company.com'
);


-- Check result

SELECT *
FROM Employees
WHERE employee_id = 113;


-- Remove test employee

DELETE FROM Employees
WHERE employee_id = 113;


-- AFTER INSERT

DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT
ON Employees
FOR EACH ROW
BEGIN

    INSERT INTO Employee_Audit
    (
        employee_id,
        employee_name,
        old_salary,
        new_salary,
        action_type,
        action_time
    )
    VALUES
    (
        NEW.employee_id,
        NEW.employee_name,
        NULL,
        NEW.salary,
        'INSERT',
        NOW()
    );

END$$

DELIMITER ;


-- Test AFTER INSERT

INSERT INTO Employees
(
    employee_id,
    employee_name,
    job_title,
    salary,
    department_id,
    joining_date,
    email
)
VALUES
(
    113,
    'Audit Test',
    'Developer',
    60000,
    1,
    '2024-01-01',
    'audit@company.com'
);


-- Check audit record

SELECT *
FROM Employee_Audit;


-- BEFORE UPDATE

DELIMITER $$

CREATE TRIGGER before_employee_update
BEFORE UPDATE
ON Employees
FOR EACH ROW
BEGIN

    -- Prevent negative salary

    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;

END$$

DELIMITER ;


-- Test BEFORE UPDATE

UPDATE Employees
SET salary = -10000
WHERE employee_id = 101;


-- Check result

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE employee_id = 101;


-- Restore salary

UPDATE Employees
SET salary = 55000
WHERE employee_id = 101;


-- AFTER UPDATE

DELIMITER $$

CREATE TRIGGER after_salary_update
AFTER UPDATE
ON Employees
FOR EACH ROW
BEGIN

    -- Record only salary changes

    IF OLD.salary <> NEW.salary THEN

        INSERT INTO Salary_Audit
        (
            employee_id,
            employee_name,
            old_salary,
            new_salary,
            changed_at
        )
        VALUES
        (
            NEW.employee_id,
            NEW.employee_name,
            OLD.salary,
            NEW.salary,
            NOW()
        );

    END IF;

END$$

DELIMITER ;


-- Test AFTER UPDATE

UPDATE Employees
SET salary = 60000
WHERE employee_id = 101;


-- Check salary audit

SELECT *
FROM Salary_Audit;


-- BEFORE DELETE

DELIMITER $$

CREATE TRIGGER before_employee_delete
BEFORE DELETE
ON Employees
FOR EACH ROW
BEGIN

    -- Prevent deletion of employee 101

    IF OLD.employee_id = 101 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT =
        'This employee cannot be deleted';

    END IF;

END$$

DELIMITER ;


-- Test BEFORE DELETE

DELETE FROM Employees
WHERE employee_id = 101;


-- AFTER DELETE

DELIMITER $$

CREATE TRIGGER after_employee_delete
AFTER DELETE
ON Employees
FOR EACH ROW
BEGIN

    -- Store deleted employee information

    INSERT INTO Employee_Audit
    (
        employee_id,
        employee_name,
        old_salary,
        new_salary,
        action_type,
        action_time
    )
    VALUES
    (
        OLD.employee_id,
        OLD.employee_name,
        OLD.salary,
        NULL,
        'DELETE',
        NOW()
    );

END$$

DELIMITER ;


-- Test AFTER DELETE

DELETE FROM Employees
WHERE employee_id = 113;


-- Check DELETE audit

SELECT *
FROM Employee_Audit;


-- Audit Logging

-- INSERT
-- Employee_Audit stores the new employee.

-- UPDATE
-- Salary_Audit stores old and new salary.

-- DELETE
-- Employee_Audit stores deleted employee information.


-- Salary Tracking

UPDATE Employees
SET salary = salary + 5000
WHERE employee_id = 102;


-- Check salary history

SELECT
    audit_id,
    employee_id,
    employee_name,
    old_salary,
    new_salary,
    changed_at
FROM Salary_Audit;


-- Data Validation

-- Trigger can automatically validate
-- data before INSERT or UPDATE.


-- Show all triggers

SHOW TRIGGERS;


-- Show triggers from this database

SHOW TRIGGERS
FROM security_operations_db;


-- DROP TRIGGER

-- Use DROP TRIGGER only when you want
-- to permanently remove a trigger.

-- Example:

-- DROP TRIGGER before_employee_insert;

-- DROP TRIGGER after_employee_insert;

-- DROP TRIGGER before_employee_update;

-- DROP TRIGGER after_salary_update;

-- DROP TRIGGER before_employee_delete;

-- DROP TRIGGER after_employee_delete;


-- Complete Trigger Example

-- Salary changes are automatically recorded.

UPDATE Employees
SET salary = 65000
WHERE employee_id = 102;


SELECT
    employee_id,
    employee_name,
    old_salary,
    new_salary,
    changed_at
FROM Salary_Audit
WHERE employee_id = 102;





## Chapter 29 — SQL Injection & SQL Security

USE security_operations_db;


-- What is SQL Injection?

-- SQL Injection is a security vulnerability
-- where malicious input can change the meaning
-- of an SQL query.


-- Unsafe SQL Query

-- Never directly concatenate user input
-- into an SQL query.


-- Example of an unsafe query in Python

-- username = input("Enter username: ")
-- query = "SELECT * FROM Users WHERE username = '" + username + "'"


-- Unsafe SELECT query

-- name = input("Enter employee name: ")

-- query =
-- "SELECT * FROM Employees
--  WHERE employee_name = '" + name + "'"


-- The problem is:
-- User input becomes part of the SQL statement.


-- Unsafe Authentication Query

-- username = input("Username: ")
-- password = input("Password: ")

-- query =
-- "SELECT * FROM Users
--  WHERE username = '" + username +
-- "' AND password = '" + password + "'"


-- Authentication-related injection
-- can occur when login input is directly
-- concatenated into SQL.


-- Parameterized Queries

-- SQL structure and user data are
-- supplied separately.


-- Safe SELECT query in Python

-- query = """
-- SELECT
--     employee_id,
--     employee_name,
--     salary
-- FROM Employees
-- WHERE employee_name = %s
-- """

-- cursor.execute(query, (employee_name,))


-- Safe SELECT using employee_id

-- query = """
-- SELECT
--     employee_id,
--     employee_name,
--     salary
-- FROM Employees
-- WHERE employee_id = %s
-- """

-- cursor.execute(query, (employee_id,))


-- Safe INSERT

-- query = """
-- INSERT INTO Customers
-- (
--     customer_name,
--     email,
--     city
-- )
-- VALUES
-- (
--     %s,
--     %s,
--     %s
-- )
-- """

-- cursor.execute(
--     query,
--     (customer_name, email, city)
-- )


-- Safe UPDATE

-- query = """
-- UPDATE Employees
-- SET salary = %s
-- WHERE employee_id = %s
-- """

-- cursor.execute(
--     query,
--     (salary, employee_id)
-- )


-- Safe DELETE

-- query = """
-- DELETE FROM Employees
-- WHERE employee_id = %s
-- """

-- cursor.execute(
--     query,
--     (employee_id,)
-- )


-- Prepared Statements

-- MySQL prepared statement separates
-- SQL structure from parameter values.


PREPARE employee_query
FROM
'SELECT
    employee_id,
    employee_name,
    job_title,
    salary
 FROM Employees
 WHERE employee_id = ?';


-- Set parameter

SET @employee_id = 101;


-- Execute prepared statement

EXECUTE employee_query
USING @employee_id;


-- Remove prepared statement

DEALLOCATE PREPARE employee_query;


-- Prepared UPDATE

PREPARE salary_update
FROM
'UPDATE Employees
 SET salary = ?
 WHERE employee_id = ?';


-- Set parameters

SET @new_salary = 60000;

SET @employee_id = 101;


-- Execute

EXECUTE salary_update
USING @new_salary, @employee_id;


-- Remove prepared statement

DEALLOCATE PREPARE salary_update;


-- Prepared SELECT with Customer

PREPARE customer_query
FROM
'SELECT
    customer_id,
    customer_name,
    email,
    city
 FROM Customers
 WHERE city = ?';


SET @customer_city = 'Delhi';


EXECUTE customer_query
USING @customer_city;


DEALLOCATE PREPARE customer_query;

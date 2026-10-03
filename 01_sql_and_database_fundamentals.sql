-- DAY 1ST  — SQL & DATABASE FUNDAMENTALS         
-- Chapter 1 — Introduction to SQL & Database Fundamentals

DROP DATABASE IF EXISTS sql_fundamentals_db;

CREATE DATABASE sql_fundamentals_db;

USE sql_fundamentals_db;

-- Data
-- Data means raw facts or information.
-- Example: Ranjeet, 25, Delhi, 55000

-- Database
-- A database is an organized collection of related data.

-- DBMS
-- DBMS = Database Management System
-- It is software used to create, store, manage and retrieve data.
-- Examples: MySQL, PostgreSQL, Oracle, SQL Server

-- RDBMS
-- RDBMS = Relational Database Management System
-- It stores data in related tables.
-- Examples: MySQL, PostgreSQL, Oracle, SQL Server

-- DBMS vs RDBMS
-- DBMS may manage data without requiring relationships between tables.
-- RDBMS stores data in tables and supports relationships using keys.

-- SQL
-- SQL = Structured Query Language
-- SQL is used to communicate with relational databases.

-- SQL vs MySQL
-- SQL = Language
-- MySQL = RDBMS software that uses SQL

-- Create Departments table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

-- Insert departments
INSERT INTO Departments
(department_id, department_name, location)
VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Noida'),
(3, 'Finance', 'Mumbai'),
(4, 'Sales', 'Bangalore');

-- Create Employees table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    email VARCHAR(100),
    salary DECIMAL(10,2),
    department_id INT,
    joining_date DATE,
    FOREIGN KEY (department_id)
        REFERENCES Departments(department_id)
);

-- Insert employees
INSERT INTO Employees
(employee_id, employee_name, email, salary, department_id, joining_date)
VALUES
(101, 'Ranjeet Kumar', 'ranjeet@company.com', 55000, 1, '2023-01-15'),
(102, 'Amit Sharma', 'amit@company.com', 70000, 1, '2022-06-10'),
(103, 'Priya Singh', 'priya@company.com', 45000, 2, '2023-03-20'),
(104, 'Rahul Verma', 'rahul@company.com', 78000, 2, '2021-08-12'),
(105, 'Neha Gupta', 'neha@company.com', 52000, 3, '2022-01-25'),
(106, 'Vikas Mehra', 'vikas@company.com', 90000, 3, '2020-11-05');

-- Database
-- sql_fundamentals_db

-- Tables
-- Departments
-- Employees

-- Row
-- A single record in a table.
SELECT *
FROM Employees;

-- Column
-- A single attribute/field of a table.
SELECT
    employee_name,
    salary
FROM Employees;

-- Schema
-- Structure/design of a database including tables,
-- columns, data types, keys and relationships.

-- Primary Key
-- Uniquely identifies each row.
SELECT
    employee_id,
    employee_name
FROM Employees;

-- Foreign Key
-- Connects one table with another table.
SELECT
    e.employee_name,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;

-- NULL
-- NULL means missing/unknown/no value.
-- It is not the same as 0 or an empty string.

INSERT INTO Employees
(employee_id, employee_name, email, salary, department_id, joining_date)
VALUES
(107, 'Arjun Kapoor', NULL, 60000, 1, '2024-01-10');

-- Find NULL values
SELECT *
FROM Employees
WHERE email IS NULL;

-- Find NOT NULL values
SELECT *
FROM Employees
WHERE email IS NOT NULL;

-- Relationship between tables
-- One department can have many employees.
SELECT
    d.department_name,
    e.employee_name
FROM Departments d
JOIN Employees e
    ON d.department_id = e.department_id;

-- Basic SQL syntax
SELECT column_name
FROM table_name
WHERE condition;

-- Example
SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > 60000;


# -- Chapter 2 — SQL Command Categories

USE sql_fundamentals_db;

-- DDL
-- DDL = Data Definition Language
-- Used to create and modify database structures.

-- CREATE
CREATE TABLE Test_Table (
    id INT,
    name VARCHAR(50)
);

-- ALTER
ALTER TABLE Test_Table
ADD email VARCHAR(100);

-- RENAME
RENAME TABLE Test_Table
TO Test_Employees;

-- DROP
-- Removes the table completely.
-- We use it here after demonstrating the command.
DROP TABLE Test_Employees;

-- TRUNCATE
-- Removes all rows but keeps the table structure.

CREATE TABLE Test_Data (
    id INT,
    name VARCHAR(50)
);

INSERT INTO Test_Data
VALUES
(1, 'Amit'),
(2, 'Priya');

SELECT *
FROM Test_Data;

TRUNCATE TABLE Test_Data;

SELECT *
FROM Test_Data;

-- DML
-- DML = Data Manipulation Language
-- Used to insert, modify and delete data.

-- INSERT
INSERT INTO Employees
(employee_id, employee_name, email, salary, department_id, joining_date)
VALUES
(108, 'Suresh Yadav', 'suresh@company.com', 48000, 4, '2024-02-01');

-- UPDATE
UPDATE Employees
SET salary = 50000
WHERE employee_id = 108;

-- DELETE
DELETE FROM Employees
WHERE employee_id = 108;

-- DQL
-- DQL = Data Query Language
-- SELECT is used to retrieve data.

SELECT *
FROM Employees;

SELECT
    employee_name,
    salary
FROM Employees;

-- DCL
-- DCL = Data Control Language
-- Used to control database permissions.

-- GRANT syntax
-- Requires appropriate MySQL privileges.

-- GRANT SELECT
-- ON sql_fundamentals_db.Employees
-- TO 'username'@'localhost';

-- REVOKE syntax
-- REVOKE SELECT
-- ON sql_fundamentals_db.Employees
-- FROM 'username'@'localhost';

-- TCL
-- TCL = Transaction Control Language

-- Start transaction
START TRANSACTION;

-- Make a temporary change
UPDATE Employees
SET salary = salary + 1000
WHERE employee_id = 101;

-- Check the change
SELECT *
FROM Employees
WHERE employee_id = 101;

-- Undo the transaction
ROLLBACK;

-- Check again
SELECT *
FROM Employees
WHERE employee_id = 101;

-- COMMIT example
START TRANSACTION;

UPDATE Employees
SET salary = salary + 500
WHERE employee_id = 101;

COMMIT;

-- Check committed change
SELECT *
FROM Employees
WHERE employee_id = 101;

-- SAVEPOINT example
START TRANSACTION;

UPDATE Employees
SET salary = salary + 1000
WHERE employee_id = 102;

SAVEPOINT salary_change;

UPDATE Employees
SET salary = salary + 2000
WHERE employee_id = 103;

-- Undo only the second change
ROLLBACK TO SAVEPOINT salary_change;

-- Save the remaining transaction
COMMIT;

-- Check final data
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees;


# -- Chapter 3 — CREATE DATABASE & TABLE

-- CREATE DATABASE
CREATE DATABASE IF NOT EXISTS practice_database;

-- Select database
USE practice_database;

-- CREATE TABLE
CREATE TABLE Employees (
    employee_id INT,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2),
    gender CHAR(1),
    joining_date DATE,
    joining_time DATETIME,
    is_active BOOLEAN
);

-- Check table structure
DESCRIBE Employees;

-- Alternative command
SHOW COLUMNS FROM Employees;

-- Insert data
INSERT INTO Employees
(
    employee_id,
    employee_name,
    salary,
    gender,
    joining_date,
    joining_time,
    is_active
)
VALUES
(
    101,
    'Ranjeet Kumar',
    55000.50,
    'M',
    '2023-01-15',
    '2023-01-15 10:30:00',
    TRUE
);

INSERT INTO Employees
(
    employee_id,
    employee_name,
    salary,
    gender,
    joining_date,
    joining_time,
    is_active
)
VALUES
(
    102,
    'Priya Singh',
    62000.75,
    'F',
    '2023-03-20',
    '2023-03-20 09:45:00',
    TRUE
);

-- View data
SELECT *
FROM Employees;

-- INT
-- Whole numbers
SELECT employee_id
FROM Employees;

-- DECIMAL
-- Numbers with decimal values
SELECT salary
FROM Employees;

-- VARCHAR
-- Variable-length text
SELECT employee_name
FROM Employees;

-- CHAR
-- Fixed-length text
SELECT gender
FROM Employees;

-- DATE
-- Stores date
SELECT joining_date
FROM Employees;

-- DATETIME
-- Stores date and time
SELECT joining_time
FROM Employees;

-- BOOLEAN
-- Stores TRUE/FALSE
SELECT is_active
FROM Employees;

-- Create a table with multiple columns
CREATE TABLE Departments (
    department_id INT,
    department_name VARCHAR(50),
    location VARCHAR(50),
    budget DECIMAL(12,2)
);

-- Insert department data
INSERT INTO Departments
(department_id, department_name, location, budget)
VALUES
(1, 'IT', 'Delhi', 500000),
(2, 'HR', 'Noida', 300000),
(3, 'Finance', 'Mumbai', 400000);

-- Check structure
DESCRIBE Departments;

-- Check tables
SHOW TABLES;

-- Check data
SELECT *
FROM Departments;




# -- Chapter 4 — SQL Constraints

USE sql_fundamentals_db;

-- PRIMARY KEY
-- Uniquely identifies each record.

CREATE TABLE Constraint_Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    salary DECIMAL(10,2)
);

INSERT INTO Constraint_Employees
(employee_id, employee_name, salary)
VALUES
(201, 'Amit Sharma', 60000),
(202, 'Priya Singh', 65000);

SELECT *
FROM Constraint_Employees;

-- FOREIGN KEY
-- Creates a relationship between tables.

CREATE TABLE Constraint_Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE
);

INSERT INTO Constraint_Departments
(department_id, department_name)
VALUES
(1, 'IT'),
(2, 'HR');

CREATE TABLE Constraint_Staff (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id)
        REFERENCES Constraint_Departments(department_id)
);

INSERT INTO Constraint_Staff
(employee_id, employee_name, department_id)
VALUES
(301, 'Ranjeet Kumar', 1),
(302, 'Neha Gupta', 2);

-- NOT NULL
-- Column cannot contain NULL.

CREATE TABLE NotNull_Demo (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

INSERT INTO NotNull_Demo
(id, name)
VALUES
(1, 'Ranjeet');

-- UNIQUE
-- Prevents duplicate values.

CREATE TABLE Unique_Demo (
    id INT PRIMARY KEY,
    email VARCHAR(100) UNIQUE
);

INSERT INTO Unique_Demo
(id, email)
VALUES
(1, 'ranjeet@gmail.com'),
(2, 'amit@gmail.com');

-- DEFAULT
-- Provides a value automatically if no value is supplied.

CREATE TABLE Default_Demo (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    status VARCHAR(20) DEFAULT 'Active'
);

INSERT INTO Default_Demo
(id, name)
VALUES
(1, 'Ranjeet');

SELECT *
FROM Default_Demo;

-- CHECK
-- Ensures that data satisfies a condition.

CREATE TABLE Check_Demo (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    salary DECIMAL(10,2),
    CHECK (age >= 18),
    CHECK (salary > 0)
);

INSERT INTO Check_Demo
(id, name, age, salary)
VALUES
(1, 'Ranjeet', 25, 55000);

SELECT *
FROM Check_Demo;

-- Adding constraints to an existing table

CREATE TABLE Constraint_Add_Demo (
    id INT,
    name VARCHAR(100),
    email VARCHAR(100)
);

-- Add PRIMARY KEY
ALTER TABLE Constraint_Add_Demo
ADD PRIMARY KEY (id);

-- Add UNIQUE constraint
ALTER TABLE Constraint_Add_Demo
ADD CONSTRAINT uq_constraint_email
UNIQUE (email);

-- Add NOT NULL
ALTER TABLE Constraint_Add_Demo
MODIFY name VARCHAR(100) NOT NULL;

-- Check table structure
DESCRIBE Constraint_Add_Demo;

-- Add CHECK constraint
ALTER TABLE Constraint_Add_Demo
ADD CONSTRAINT chk_constraint_id
CHECK (id > 0);

-- Create another table for FOREIGN KEY demonstration
CREATE TABLE Constraint_Department_Add (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO Constraint_Department_Add
VALUES
(10, 'IT'),
(20, 'HR');

-- Add FOREIGN KEY to existing table
ALTER TABLE Constraint_Add_Demo
ADD department_id INT;

ALTER TABLE Constraint_Add_Demo
ADD CONSTRAINT fk_constraint_department
FOREIGN KEY (department_id)
REFERENCES Constraint_Department_Add(department_id);

-- View constraints
SHOW CREATE TABLE Constraint_Add_Demo;

-- Drop FOREIGN KEY
ALTER TABLE Constraint_Add_Demo
DROP FOREIGN KEY fk_constraint_department;

-- Drop UNIQUE constraint
ALTER TABLE Constraint_Add_Demo
DROP INDEX uq_constraint_email;

-- Drop CHECK constraint
ALTER TABLE Constraint_Add_Demo
DROP CHECK chk_constraint_id;

-- Primary Key vs UNIQUE
-- Primary Key:
-- 1. Uniquely identifies each row.
-- 2. Only one PRIMARY KEY per table.
-- 3. Cannot contain NULL.
--
-- UNIQUE:
-- 1. Prevents duplicate values.
-- 2. A table can have multiple UNIQUE constraints.
-- 3. NULL handling differs from PRIMARY KEY in MySQL.

-- Primary Key vs Foreign Key
-- PRIMARY KEY:
-- Identifies a row in its own table.
--
-- FOREIGN KEY:
-- Refers to a key in another table.
-- Used to establish relationships.

-- View final structures
DESCRIBE Constraint_Employees;

DESCRIBE Constraint_Departments;

DESCRIBE Constraint_Staff;

DESCRIBE Constraint_Add_Demo;
-- DAY 7 - STORED PROGRAMMING
-- Database: stored_programming_db

CREATE DATABASE stored_programming_db;

USE stored_programming_db;


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
    (103, 'Priya Singh', 'HR Executive', 45000, 2, '2023-03-20', 104),
    (104, 'Rahul Verma', 'HR Manager', 78000, 2, '2021-08-12', NULL),
    (105, 'Neha Gupta', 'Accountant', 52000, 3, '2022-01-25', 106),
    (106, 'Vikas Mehra', 'Finance Manager', 90000, 3, '2020-11-05', NULL),
    (107, 'Anjali Mehta', 'Sales Executive', 42000, 4, '2023-05-18', 109),
    (108, 'Karan Malhotra', 'Sales Executive', 48000, 4, '2023-07-22', 109),
    (109, 'Pooja Agarwal', 'Sales Manager', 85000, 4, '2021-04-14', NULL),
    (110, 'Suresh Yadav', 'Marketing Executive', 47000, 5, '2022-09-30', 112),
    (111, 'Kavita Joshi', 'Marketing Executive', 50000, 5, '2023-02-11', 112),
    (112, 'Arjun Kapoor', 'Marketing Manager', 80000, 5, '2020-05-16', NULL);


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
    (1, 107, 120000, '2024-01-05', 'Completed'),
    (2, 108, 85000, '2024-01-10', 'Completed'),
    (3, 109, 180000, '2024-01-15', 'Completed'),
    (4, 107, 95000, '2024-02-05', 'Completed'),
    (5, 108, 75000, '2024-02-12', 'Pending'),
    (6, 109, 210000, '2024-02-20', 'Completed'),
    (7, 101, 50000, '2024-03-01', 'Completed'),
    (8, 102, 90000, '2024-03-10', 'Completed'),
    (9, 107, 110000, '2024-03-15', 'Completed'),
    (10, 109, 250000, '2024-04-05', 'Completed'),
    (11, 108, 65000, '2024-04-12', 'Completed'),
    (12, 101, 70000, '2024-05-01', 'Completed');


-- Check tables

SHOW TABLES;


SELECT * FROM Departments;

SELECT * FROM Employees;

SELECT * FROM Sales;


-- Check employee and department data

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


-- Check employee and sales data

SELECT
    e.employee_id,
    e.employee_name,
    e.job_title,
    s.sale_amount,
    s.sale_date,
    s.status
FROM Employees e
JOIN Sales s
    ON e.employee_id = s.employee_id;
    
    
-- Chapter 24 — Stored Procedures
USE stored_programming_db;


-- What is a Stored Procedure?

-- A Stored Procedure is a group of SQL statements
-- stored inside the database and executed when called.


-- CREATE PROCEDURE

DELIMITER //

CREATE PROCEDURE show_all_employees()
BEGIN
    SELECT *
    FROM Employees;
END //

DELIMITER ;


-- CALL

CALL show_all_employees();


-- DROP PROCEDURE

DROP PROCEDURE show_all_employees;


-- Procedure with IN parameter

DELIMITER //

CREATE PROCEDURE get_employee_by_id(IN emp_id INT)
BEGIN
    SELECT
        employee_id,
        employee_name,
        job_title,
        salary
    FROM Employees
    WHERE employee_id = emp_id;
END //

DELIMITER ;

CALL get_employee_by_id(101);


-- Procedure with IN parameter for department

DELIMITER //

CREATE PROCEDURE get_employees_by_department(IN dept_id INT)
BEGIN
    SELECT
        employee_id,
        employee_name,
        job_title,
        salary
    FROM Employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

CALL get_employees_by_department(1);


-- Procedure with OUT parameter

DELIMITER //

CREATE PROCEDURE get_employee_salary(
    IN emp_id INT,
    OUT emp_salary DECIMAL(10,2)
)
BEGIN
    SELECT salary
    INTO emp_salary
    FROM Employees
    WHERE employee_id = emp_id;
END //

DELIMITER ;

CALL get_employee_salary(101, @salary);

SELECT @salary;


-- Procedure with INOUT parameter

DELIMITER //

CREATE PROCEDURE increase_value(
    INOUT value_num INT
)
BEGIN
    SET value_num = value_num + 10;
END //

DELIMITER ;

SET @number = 50;

CALL increase_value(@number);

SELECT @number;


-- Variables

DELIMITER //

CREATE PROCEDURE calculate_annual_salary(IN emp_id INT)
BEGIN
    DECLARE annual_salary DECIMAL(12,2);

    SELECT salary * 12
    INTO annual_salary
    FROM Employees
    WHERE employee_id = emp_id;

    SELECT annual_salary AS annual_salary;
END //

DELIMITER ;

CALL calculate_annual_salary(101);


-- IF condition

DELIMITER //

CREATE PROCEDURE check_salary(IN emp_id INT)
BEGIN
    DECLARE emp_salary DECIMAL(10,2);

    SELECT salary
    INTO emp_salary
    FROM Employees
    WHERE employee_id = emp_id;

    IF emp_salary >= 80000 THEN
        SELECT 'High Salary' AS salary_category;
    ELSEIF emp_salary >= 50000 THEN
        SELECT 'Medium Salary' AS salary_category;
    ELSE
        SELECT 'Low Salary' AS salary_category;
    END IF;
END //

DELIMITER ;

CALL check_salary(101);

CALL check_salary(106);

CALL check_salary(107);


-- Procedure with INSERT

DELIMITER //

CREATE PROCEDURE add_employee(
    IN emp_id INT,
    IN emp_name VARCHAR(100),
    IN emp_job VARCHAR(100),
    IN emp_salary DECIMAL(10,2),
    IN dept_id INT,
    IN join_date DATE
)
BEGIN
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
    (
        emp_id,
        emp_name,
        emp_job,
        emp_salary,
        dept_id,
        join_date,
        NULL
    );
END //

DELIMITER ;

CALL add_employee(
    113,
    'Nitin Kumar',
    'Data Engineer',
    65000,
    1,
    '2024-01-10'
);

SELECT * FROM Employees;


-- Procedure with UPDATE

DELIMITER //

CREATE PROCEDURE update_employee_salary(
    IN emp_id INT,
    IN new_salary DECIMAL(10,2)
)
BEGIN
    UPDATE Employees
    SET salary = new_salary
    WHERE employee_id = emp_id;
END //

DELIMITER ;

CALL update_employee_salary(113, 70000);

SELECT * FROM Employees
WHERE employee_id = 113;


-- Procedure with DELETE

DELIMITER //

CREATE PROCEDURE delete_employee(IN emp_id INT)
BEGIN
    DELETE FROM Employees
    WHERE employee_id = emp_id;
END //

DELIMITER ;

CALL delete_employee(113);

SELECT * FROM Employees;


-- Basic loop

DELIMITER //

CREATE PROCEDURE generate_numbers()
BEGIN
    DECLARE counter INT DEFAULT 1;

    CREATE TEMPORARY TABLE IF NOT EXISTS NumberList (
        number_value INT
    );

    WHILE counter <= 5 DO

        INSERT INTO NumberList
        VALUES (counter);

        SET counter = counter + 1;

    END WHILE;

    SELECT * FROM NumberList;

    DROP TEMPORARY TABLE NumberList;
END //

DELIMITER ;

CALL generate_numbers();


-- Parameterized procedure

DELIMITER //

CREATE PROCEDURE get_employees_by_salary(
    IN minimum_salary DECIMAL(10,2)
)
BEGIN
    SELECT
        employee_id,
        employee_name,
        job_title,
        salary
    FROM Employees
    WHERE salary >= minimum_salary
    ORDER BY salary DESC;
END //

DELIMITER ;

CALL get_employees_by_salary(60000);


-- Procedure using multiple parameters

DELIMITER //

CREATE PROCEDURE get_department_employees(
    IN dept_id INT,
    IN minimum_salary DECIMAL(10,2)
)
BEGIN
    SELECT
        employee_id,
        employee_name,
        job_title,
        salary,
        department_id
    FROM Employees
    WHERE department_id = dept_id
      AND salary >= minimum_salary
    ORDER BY salary DESC;
END //

DELIMITER ;

CALL get_department_employees(1, 60000);


-- Procedure using aggregate function

DELIMITER //

CREATE PROCEDURE get_department_salary(
    IN dept_id INT,
    OUT total_salary DECIMAL(12,2)
)
BEGIN
    SELECT SUM(salary)
    INTO total_salary
    FROM Employees
    WHERE department_id = dept_id;
END //

DELIMITER ;

CALL get_department_salary(1, @total_salary);

SELECT @total_salary;


-- Procedure using JOIN

DELIMITER //

CREATE PROCEDURE get_employee_details(IN emp_id INT)
BEGIN
    SELECT
        e.employee_id,
        e.employee_name,
        e.job_title,
        e.salary,
        d.department_name,
        d.location
    FROM Employees e
    JOIN Departments d
        ON e.department_id = d.department_id
    WHERE e.employee_id = emp_id;
END //

DELIMITER ;

CALL get_employee_details(101);


-- Show stored procedures

SHOW PROCEDURE STATUS
WHERE Db = 'stored_programming_db';


-- Drop procedures when no longer required

DROP PROCEDURE IF EXISTS show_all_employees;

DROP PROCEDURE IF EXISTS get_employee_by_id;

DROP PROCEDURE IF EXISTS get_employees_by_department;

DROP PROCEDURE IF EXISTS get_employee_salary;

DROP PROCEDURE IF EXISTS increase_value;

DROP PROCEDURE IF EXISTS calculate_annual_salary;

DROP PROCEDURE IF EXISTS check_salary;

DROP PROCEDURE IF EXISTS add_employee;

DROP PROCEDURE IF EXISTS update_employee_salary;

DROP PROCEDURE IF EXISTS delete_employee;

DROP PROCEDURE IF EXISTS generate_numbers;

DROP PROCEDURE IF EXISTS get_employees_by_salary;

DROP PROCEDURE IF EXISTS get_department_employees;

DROP PROCEDURE IF EXISTS get_department_salary;

DROP PROCEDURE IF EXISTS get_employee_details;



-- Chapter 25 — SQL Functions / User-Defined Functions

USE stored_programming_db;


-- Built-in Function vs User-Defined Function

-- Built-in function example

SELECT
    UPPER(employee_name) AS employee_name
FROM Employees;


-- User-Defined Function

-- CREATE FUNCTION

DELIMITER //

CREATE FUNCTION annual_salary(
    monthly_salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END //

DELIMITER ;


-- Calling a Function

SELECT annual_salary(55000);


-- Using Function with table data

SELECT
    employee_id,
    employee_name,
    salary,
    annual_salary(salary) AS annual_salary
FROM Employees;


-- Salary calculation

DELIMITER //

CREATE FUNCTION calculate_bonus(
    salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END //

DELIMITER ;

SELECT
    employee_id,
    employee_name,
    salary,
    calculate_bonus(salary) AS bonus
FROM Employees;


-- Tax calculation

DELIMITER //

CREATE FUNCTION calculate_tax(
    salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE tax DECIMAL(12,2);

    IF salary <= 50000 THEN
        SET tax = salary * 0.05;

    ELSEIF salary <= 80000 THEN
        SET tax = salary * 0.10;

    ELSE
        SET tax = salary * 0.20;

    END IF;

    RETURN tax;
END //

DELIMITER ;


-- Call tax function

SELECT calculate_tax(55000);


-- Tax calculation for all employees

SELECT
    employee_id,
    employee_name,
    salary,
    calculate_tax(salary) AS tax
FROM Employees;


-- Net salary calculation

DELIMITER //

CREATE FUNCTION calculate_net_salary(
    salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN salary - calculate_tax(salary);
END //

DELIMITER ;


SELECT
    employee_id,
    employee_name,
    salary,
    calculate_tax(salary) AS tax,
    calculate_net_salary(salary) AS net_salary
FROM Employees;


-- Employee classification

DELIMITER //

CREATE FUNCTION employee_classification(
    salary DECIMAL(10,2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN

    IF salary >= 80000 THEN
        RETURN 'Senior';

    ELSEIF salary >= 50000 THEN
        RETURN 'Mid Level';

    ELSE
        RETURN 'Junior';

    END IF;

END //

DELIMITER ;


-- Calling classification function

SELECT
    employee_id,
    employee_name,
    salary,
    employee_classification(salary) AS classification
FROM Employees;


-- Function with employee ID

DELIMITER //

CREATE FUNCTION get_employee_annual_salary(
    emp_id INT
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE annual_salary_value DECIMAL(12,2);

    SELECT salary * 12
    INTO annual_salary_value
    FROM Employees
    WHERE employee_id = emp_id;

    RETURN annual_salary_value;
END //

DELIMITER ;


SELECT
    employee_id,
    employee_name,
    get_employee_annual_salary(employee_id) AS annual_salary
FROM Employees;


-- Function used with WHERE

SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE calculate_tax(salary) > 5000;


-- Function used with ORDER BY

SELECT
    employee_id,
    employee_name,
    salary,
    calculate_tax(salary) AS tax
FROM Employees
ORDER BY calculate_tax(salary) DESC;


-- Function used with aggregate functions

SELECT
    AVG(calculate_tax(salary)) AS average_tax
FROM Employees;


-- Function used with JOIN

SELECT
    e.employee_id,
    e.employee_name,
    d.department_name,
    e.salary,
    employee_classification(e.salary) AS classification
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;


-- Show stored functions

SHOW FUNCTION STATUS
WHERE Db = 'stored_programming_db';


-- Drop functions when no longer required

DROP FUNCTION IF EXISTS annual_salary;

DROP FUNCTION IF EXISTS calculate_bonus;

DROP FUNCTION IF EXISTS calculate_tax;

DROP FUNCTION IF EXISTS calculate_net_salary;

DROP FUNCTION IF EXISTS employee_classification;

DROP FUNCTION IF EXISTS get_employee_annual_salary;





# 📘 SQL Practice & Revision

A structured **SQL practice and revision repository** designed to strengthen SQL fundamentals, advanced querying skills, database concepts, and problem-solving through hands-on practice.

This repository contains SQL notes, queries, examples, exercises, and practical database scenarios developed as part of my journey toward becoming an **AI/ML Engineer**.

---

## 🎯 About This Repository

This repository is focused on learning SQL through **concept + syntax + practical examples + hands-on queries**.

Instead of learning SQL only theoretically, I am using a common MySQL database environment to practice concepts on realistic data involving:

* 👨‍💼 Employees and Departments
* 👥 Customers
* 📦 Products
* 🛒 Orders
* 🧾 Order Details
* 💰 Salaries and Sales
* 📊 Aggregated business information

The goal is to build strong SQL fundamentals and gradually move toward **advanced SQL querying and data analysis**.

---

## 🗂️ Database Used

The main practice database is:

```sql
advanced_sql_db
```

### Database Tables

| Table           | Description                                           |
| --------------- | ----------------------------------------------------- |
| `Departments`   | Stores department information                         |
| `Employees`     | Stores employee and salary information                |
| `Customers`     | Stores customer information                           |
| `Products`      | Stores product and inventory information              |
| `Orders`        | Stores customer orders                                |
| `Order_Details` | Stores products and quantities associated with orders |

### Basic Relationship

```text
Departments
     │
     │ department_id
     ▼
Employees


Customers
     │
     │ customer_id
     ▼
Orders
     │
     │ order_id
     ▼
Order_Details
     │
     │ product_id
     ▼
Products
```

This relational structure makes it possible to practice SQL using realistic relationships between multiple tables.

---

# 📚 SQL Topics Covered

The repository follows a structured learning and revision approach covering SQL from fundamentals to advanced querying.

## 🔹 SQL Fundamentals

* What is SQL?
* What is a Database?
* DBMS and RDBMS
* SQL Commands
* DDL
* DML
* DQL
* DCL
* TCL
* Database and table creation
* Data types
* Primary Key
* Foreign Key
* Constraints

---

## 🔹 Data Manipulation

* `INSERT`
* `UPDATE`
* `DELETE`
* `SELECT`
* Filtering records
* Sorting records
* Limiting results

Example:

```sql
SELECT
    employee_name,
    salary
FROM Employees
WHERE salary > 70000
ORDER BY salary DESC;
```

---

## 🔹 Filtering & Operators

Practice includes:

* `WHERE`
* Comparison operators
* Logical operators
* `AND`
* `OR`
* `NOT`
* `IN`
* `BETWEEN`
* `LIKE`
* `IS NULL`
* `IS NOT NULL`

---

## 🔹 SQL Functions

### Aggregate Functions

* `COUNT()`
* `SUM()`
* `AVG()`
* `MIN()`
* `MAX()`

Example:

```sql
SELECT
    department_id,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department_id;
```

### Other SQL Functions

Practice also includes commonly used:

* String functions
* Numeric functions
* Date functions
* Conditional expressions

---

## 🔹 GROUP BY & HAVING

Topics include:

* `GROUP BY`
* Aggregate functions with `GROUP BY`
* `HAVING`
* Difference between `WHERE` and `HAVING`
* Group-level filtering
* Aggregate-based analysis

Example:

```sql
SELECT
    department_id,
    COUNT(*) AS total_employees,
    AVG(salary) AS average_salary
FROM Employees
GROUP BY department_id
HAVING AVG(salary) > 60000;
```

---

# 🔗 SQL Joins

The repository includes practical work with relational joins.

Topics include:

* `INNER JOIN`
* `LEFT JOIN`
* `RIGHT JOIN`
* Self Join
* Multiple-table joins
* Joining tables using primary and foreign keys

Example:

```sql
SELECT
    e.employee_name,
    e.salary,
    d.department_name
FROM Employees e
JOIN Departments d
    ON e.department_id = d.department_id;
```

---

# 🔍 Advanced SQL

The advanced section focuses on writing queries that are commonly required in real-world data analysis and SQL interviews.

## Subqueries

Covered concepts include:

* What is a subquery?
* Subquery in `WHERE`
* Subquery in `SELECT`
* Single-row subquery
* Multiple-row subquery
* `IN` with subquery
* `EXISTS`
* `NOT EXISTS`
* Aggregate subqueries
* Correlated subqueries
* Subquery in `FROM`
* Subquery vs JOIN
* Second-highest salary problems
* Above-average salary problems
* Department-wise comparisons

Example:

```sql
SELECT
    employee_id,
    employee_name,
    salary
FROM Employees
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
);
```

---

# 🧩 Common Table Expressions (CTEs)

The repository includes practical examples of:

* `WITH`
* Single CTE
* Multiple CTEs
* CTE with `JOIN`
* CTE with `GROUP BY`
* CTE with aggregate functions
* Multi-step analysis
* CTE vs Subquery
* CTE vs Temporary Table

Example:

```sql
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
    ON d.department_id = ds.department_id;
```

---

# 👁️ SQL Views

The repository also contains practical examples of database Views.

Topics include:

* What is a View?
* View vs Table
* `CREATE VIEW`
* Querying Views
* Views with `JOIN`
* Views with aggregate functions
* Updating Views
* `CREATE OR REPLACE VIEW`
* `DROP VIEW`
* Checking available Views
* Advantages and limitations of Views

Example:

```sql
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
```

---

The database is also used for practical business-style SQL problems, such as:

* Finding employees earning above average
* Finding maximum and minimum salaries
* Finding the second-highest salary
* Comparing employee salary with department average
* Finding employees who earn more than their managers
* Finding customers with orders
* Finding customers without orders
* Finding customers with completed orders
* Finding customers with multiple orders
* Calculating order totals
* Calculating customer spending
* Department-wise salary analysis
* Customer categorization based on spending
* Sales summary analysis

These problems help connect SQL concepts with **real-world data analysis**.

---

# 🛠️ Technologies Used

| Technology          | Purpose                       |
| ------------------- | ----------------------------- |
| **MySQL**           | Database management system    |
| **MySQL Workbench** | SQL development and execution |
| **SQL**             | Querying and data analysis    |
| **Git**             | Version control               |
| **GitHub**          | Repos                         |

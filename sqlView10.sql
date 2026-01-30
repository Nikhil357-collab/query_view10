use world;
SHOW TABLES;
DESCRIBE employees;
describe departments;
select * from departments;
select * from employees;
CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location  VARCHAR(50)
);
INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Operations', 'Chennai'),
(5, 'Marketing', 'Pune'),
(6, 'Sales', 'Hyderabad');
select *  from departments;
SELECT 
    emp_id,
    emp_name,
    salary,
    dept_name,
    location   
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.salary > 30000;

########################
CREATE VIEW vw_employee_department AS
SELECT 
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id;
drop table departments;
drop table employees;
CREATE TABLE departments (
    dept_id   INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL,
    location  VARCHAR(50)
);
INSERT INTO departments (dept_id, dept_name, location) VALUES
(1, 'HR', 'Mumbai'),
(2, 'Finance', 'Delhi'),
(3, 'IT', 'Bangalore'),
(4, 'Operations', 'Chennai'),
(5, 'Marketing', 'Pune'),
(6, 'Sales', 'Hyderabad');

select * from departments;

CREATE TABLE employees (
    emp_id     INT PRIMARY KEY,
    emp_name   VARCHAR(50) NOT NULL,
    salary     DECIMAL(10,2),
    dept_id    INT,
    hire_date  DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO employees (emp_id, emp_name, salary, dept_id, hire_date) VALUES
(101, 'Nikhil', 60000, 3, '2022-01-15'),
(102, 'Amit', 55000, 1, '2021-03-10'),
(103, 'Priya', 72000, 2, '2020-07-22'),
(104, 'Rahul', 48000, 4, '2023-02-05'),
(105, 'Sneha', 65000, 3, '2021-11-18'),
(106, 'Karan', 50000, 6, '2022-06-30');

select * from employees;

SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
    e.hire_date
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id
WHERE e.salary > 50000;
# Convert Query into a SQL VIEW
CREATE VIEW vw_employee_department AS
SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
    e.hire_date
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id;
-------------------------------------------
    -- Query Data from the VIEW
SELECT * FROM vw_employee_department;
SELECT emp_name, dept_name, salary
FROM vw_employee_department;

SELECT emp_name, dept_name, salary
FROM vw_employee_department
WHERE location = 'Bangalore'
ORDER BY salary DESC;
----------------------------------------------------
-- Why Views Improve Security & Simplicity
SELECT user, host FROM mysql.user;
CREATE USER 'analyst_user'@'localhost'
IDENTIFIED BY 'StrongPassword1234';
ALTER USER 'analyst_user'@'localhost'
IDENTIFIED BY 'Password1234';

GRANT SELECT ON world.vw_employee_department
TO 'analyst_user'@'localhost';
FLUSH PRIVILEGES;

-- Drop & Recreate VIEW Safely
DROP VIEW IF EXISTS vw_employee_department;

CREATE OR REPLACE VIEW vw_employee_department AS
SELECT
    e.emp_id,
    e.emp_name,
    e.salary,
    d.dept_name,
    d.location,
    e.hire_date
FROM employees e
JOIN departments d
    ON e.dept_id = d.dept_id;

select *from vw_employee_department;


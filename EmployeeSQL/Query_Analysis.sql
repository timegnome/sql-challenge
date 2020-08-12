CREATE VIEW employees AS
SELECT e.emp_no,e.first_name,e.last_name, salary
FROM employee e
JOIN (SELECT *
FROM employee_salary) s
ON e.emp_no = s.emp_no;

CREATE VIEW employees_1986 AS
SELECT first_name, last_name, hire_date
FROM employee
WHERE hire_date LIKE '%/1986';

CREATE VIEW dept_managers AS
SELECT dep.dept_no, dep.dept_name, e.emp_no, e.first_name, e.last_name
FROM employee e
JOIN (
SELECT d.dept_no, d.dept_name, dm.emp_no
FROM departments d
JOIN department_manager dm
ON d.dept_no = dm.dept_no) dep
ON e.emp_no = dep.emp_no;

CREATE VIEW empl_dept AS
SELECT dep.dept_name, e.emp_no, e.first_name, e.last_name
FROM employee e
JOIN (
SELECT d.dept_name, ej.emp_no
FROM departments d
JOIN employees_junct ej
ON d.dept_no = ej.dept_no) dep
ON e.emp_no = dep.emp_no;

SELECT * 
FROM empl_dept;

SELECT e.first_name, e.last_name, e.sex
FROM employee e
WHERE e.first_name = 'Hercules' AND e.last_name LIKE 'B%';

CREATE VIEW Sales_emp AS
SELECT e.emp_no, e.first_name, e.last_name, dep.dept_name
FROM employee e
JOIN (
SELECT d.dept_name, ej.emp_no
FROM departments d
JOIN employees_junct ej
ON d.dept_no = ej.dept_no
WHERE d.dept_name = 'Sales') dep
ON e.emp_no = dep.emp_no;

CREATE VIEW Sales_and_Devel_emp AS
SELECT e.emp_no, e.first_name, e.last_name, dep.dept_name
FROM employee e
JOIN (
SELECT d.dept_name, ej.emp_no
FROM departments d
JOIN employees_junct ej
ON d.dept_no = ej.dept_no
WHERE d.dept_name = 'Sales' OR  d.dept_name = 'Development') dep
ON e.emp_no = dep.emp_no;

SELECT COUNT(*),last_name
FROM employee
GROUP BY last_name
ORDER BY 1 desc;
-- Query 1

SELECT 
	e.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name", 
	e.sex AS "Employee Sex", 
	s.salary AS "Employee Salary"
FROM employees AS e
JOIN salaries AS s ON (e.emp_no = s.emp_no);

-- Query 2

SELECT 
	e.first_name AS "Employee First Name", 
	e.last_name AS "Employee Last Name", 
	e.hire_date AS "Employee Hire Date"
FROM employees AS e
WHERE (EXTRACT(YEAR FROM hire_date)) = 1986;

-- Query 3

SELECT 
	d.dept_no AS "Department No.", 
	d.dept_name AS "Department Name", 
	d_m.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name"
FROM departments AS d
JOIN dept_manager AS d_m ON (d.dept_no=d_m.dept_no)
JOIN employees AS e ON (d_m.emp_no=e.emp_no);

-- Query 4

SELECT 
	d.dept_no AS "Department No.", 
	d_e.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name", 
	d.dept_name AS "Department Name"
FROM departments AS d
JOIN dept_emp AS d_e ON (d.dept_no=d_e.dept_no)
JOIN employees AS e ON (d_e.emp_no=e.emp_no);

-- Query 5

SELECT 
	first_name AS "Employee First Name", 
	last_name AS "Employee Last Name", 
	sex AS "Employee Sex"
FROM employees
WHERE first_name='Hercules' AND last_name LIKE 'B%';

-- Query 6

SELECT 
	emp_no AS "Employee Number", 
	last_name AS "Employee Last Name", 
	first_name AS "Employee First Name"
FROM employees
WHERE emp_no IN
(
	SELECT emp_no FROM dept_emp
	WHERE dept_no IN
	(
		SELECT dept_no FROM departments
		WHERE dept_name = 'Sales'
	)
);

-- Query 7

SELECT 
	e.emp_no AS "Employee Number", 
	e.last_name AS "Employee Last Name", 
	e.first_name AS "Employee First Name", 
	d.dept_name AS "Department Name"
FROM employees AS e
JOIN dept_emp AS d_e ON (e.emp_no=d_e.emp_no)
JOIN departments AS d ON (d_e.dept_no=d.dept_no)
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- Query 8

SELECT last_name, COUNT(*) AS frequency
FROM "Employees"
GROUP BY last_name
ORDER BY frequency DESC;

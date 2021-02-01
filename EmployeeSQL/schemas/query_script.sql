-- Database query script
-- Queries saved as views, named relative to each question:
-- q1, q2, q3, q4, etc.


-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
CREATE VIEW q1 AS(
	SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
	FROM employees AS e
	LEFT JOIN salaries AS s ON
	e.emp_no = s.emp_no
);

SELECT * FROM q1;
SELECT COUNT (emp_no) FROM q1;
-- 300,024 results


-- 2. List first name, last name, and hire date for 
-- employees who were hired in 1986.
CREATE VIEW q2 AS(
	SELECT e.first_name, e.last_name, e.hire_date
	FROM employees AS e
	WHERE hire_date LIKE '%1986'
	);
SELECT * FROM q2;
SELECT COUNT (first_name) FROM q2;
-- 36,150 results


-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.
-- USE SUBQUERIES with WITH - start from largest info pools at top of code
-- join deptartments, dept manager

CREATE VIEW q3 AS (
WITH di AS (
	SELECT d.dept_no, d.dept_name, dm.emp_no
	FROM departments AS d
	INNER JOIN dept_manager AS dm
	ON d.dept_no = dm.dept_no)
-- the above block can't be an IN, must be a JOIN because 
-- more info needs to be pulled into the pool
	SELECT di.*, e.last_name, e.first_name
	FROM di
	INNER JOIN employees AS e
	ON di.emp_no = e.emp_no
);

SELECT * FROM q3;
SELECT COUNT (emp_no) FROM q3;
-- 24 results


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.
CREATE VIEW q4 AS(
WITH ei AS (
	SELECT e.emp_no, e.last_name, e.first_name, de.dept_no
	FROM employees AS e
	LEFT JOIN dept_emp AS de ON
	e.emp_no = de.emp_no
)
SELECT ei.emp_no, ei.last_name,  ei.first_name, d.dept_name
FROM ei
LEFT JOIN departments AS d ON
ei.dept_no = d.dept_no
);

SELECT * FROM q4;
SELECT COUNT (emp_no) FROM q4;
-- 331,603 results -- IS THIS CORRECT??? ( more results than employees) 
-- YES, because an employee can belong to more than one dept


-- 5. List first name, last name, and sex for employees whose first name 
-- is "Hercules" and last names begin with "B."
CREATE VIEW q5 AS(
	SELECT first_name, last_name, sex
	FROM employees
	WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
);

SELECT * FROM q5;
-- 20 results


-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.
CREATE VIEW q6 AS(
	SELECT emp_no, last_name, first_name, dept_name FROM q4
	WHERE dept_name = 'Sales'
);
SELECT * FROM q6;
SELECT COUNT(emp_no) FROM q6;
-- 52,245 results


-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.
CREATE VIEW q7 AS(
	SELECT emp_no, last_name, first_name, dept_name FROM q4
	WHERE dept_name = 'Sales' OR
	dept_name = 'Development'
);
SELECT * FROM q7;
SELECT COUNT(emp_no) FROM q7;
-- 137,952 results


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
CREATE VIEW q8 AS(
	SELECT last_name, count(last_name) AS name_count
	FROM employees
	GROUP BY last_name
	ORDER BY name_count DESC
);

SELECT * FROM q8;
SELECT COUNT(last_name) FROM q8;
-- 1,638
-- order results: Baba: 226, Gelosh 223, Coorg 223, Farris 222...

SELECT * FROM q1;

-- creating view for easy access in python for bonus
CREATE VIEW qb AS (
	WITH sal_emp AS (
		SELECT e.*, t.title
		FROM employees as e
		LEFT JOIN titles AS t ON
		e.emp_title_id = t.title_id
	)
	SELECT sal_emp.*, s.salary
	FROM sal_emp
	LEFT JOIN salaries AS s ON
	sal_emp.emp_no = s.emp_no
);

SELECT * FROM qb;




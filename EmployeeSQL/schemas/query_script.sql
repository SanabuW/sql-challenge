-- Database query script

-- 1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
LEFT JOIN salaries AS s ON
e.emp_no = s.emp_no
;

-- 2. List first name, last name, and hire date for 
-- employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date LIKE '%1986';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name.
--USE SUBQUERIES with WITH - start from smallest pools
-- SELECT dm.dept_no, dm.dept_ e.first_name, e.last_name, e.sex, s.salary
-- FROM dept_manager AS dm
-- LEFT JOIN salaries AS s ON
-- e.emp_no = s.emp_no
-- ;


-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

-- 5. List first name, last name, and sex for employees whose first name 
-- is "Hercules" and last names begin with "B."

-- 6. List all employees in the Sales department, including their 
-- employee number, last name, first name, and department name.

-- 7. List all employees in the Sales and Development departments, 
-- including their employee number, last name, first name, and department name.

-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.


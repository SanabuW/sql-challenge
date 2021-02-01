--Drop pre-existing tables
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;

--Create tables
--Build these table first (due to foreign key dependencies)
CREATE TABLE titles (
	title_id VARCHAR(10),
	title VARCHAR(30),
	CONSTRAINT pk_titles PRIMARY KEY (
		title_id
	)
);

CREATE TABLE departments (	
	dept_no VARCHAR(10),
	dept_name VARCHAR(50),
	CONSTRAINT pk_departments PRIMARY KEY (
		dept_no
	)
);

--Build these tables second
CREATE TABLE employees (
	emp_no INTEGER, 
	emp_title_id VARCHAR(10), --FK >- t.title_id, 
	birth_date VARCHAR(20), 
	first_name VARCHAR(30), 
	last_name VARCHAR(30), 
	sex VARCHAR(10), 
	hire_date VARCHAR(20),
	CONSTRAINT pk_employees PRIMARY KEY (
		emp_no
	)
);

--Build these tables third
CREATE TABLE dept_emp (	
	emp_no INTEGER, -- FK >- e.emp_no
	dept_no VARCHAR(10), --  FK >- d.dept_no
	CONSTRAINT pk_dept_emp PRIMARY KEY (
		emp_no, dept_no
	)
);

CREATE TABLE dept_manager (	
	dept_no VARCHAR(10), --FK >- d.dept_no,
	emp_no INTEGER, --FK - e.emp_no
	CONSTRAINT pk_dept_manager PRIMARY KEY (
		dept_no, emp_no
		)
);

CREATE TABLE salaries (
	emp_no INTEGER, -- FK - e.emp_no,
	salary INTEGER,
	CONSTRAINT pk_salaries PRIMARY KEY (
		emp_no
		)
);


--1/29/2021 6:10 PM TABLES CREATED, add FKs next

-----------------------------------------------
--SET KEYS
-- Build these tables first (due to foreign key dependencies)
-- titles - NO FKs
-- departments - NO FKs

-- --Build these tables second
--employees
ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY (emp_title_id)
REFERENCES titles (title_id);

-- --Build these tables third
-- dept_emp
-- add FK for employees
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);
-- add FK for departments
ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY (dept_no)
REFERENCES departments (dept_no);
-- dept_manager
ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);
-- salaries
ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY (emp_no)
REFERENCES employees (emp_no);


--1/29/2021 6:15 PM FKs ADDED import data
-----------------------------------------------
-- --IMPORT DATA
-- --Build this table first (due to foreign key dependencies)
-- titles OK
-- --Build these tables second
-- employees OK
-- departments OK
-- --Build these tables third
-- dept_emp OK
-- dept_manager OK
-- salaries OK

--1/29/2021 10:45 PM imported data



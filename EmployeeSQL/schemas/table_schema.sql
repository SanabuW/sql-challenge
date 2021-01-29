--Drop pre-existing tables
DROP TABLE IF EXISTS t;
DROP TABLE IF EXISTS e;
DROP TABLE IF EXISTS d;
DROP TABLE IF EXISTS de;
DROP TABLE IF EXISTS dm;
DROP TABLE IF EXISTS s;


--Create tables
--Build this table first (due to foreign key dependencies)
CREATE TABLE titles (
	title_id VARCHAR[10],
	title VARCHAR[30],
	CONSTRAINT pk_titles PRIMARY KEY (
		title_id
	)
);


--Build these tables second
CREATE TABLE employees (
	emp_no INTEGER, 
	emp_title_id VARCHAR[10], --FK >- t.title_id, 
	birth_date VARCHAR[20], 
	first_name VARCHAR[30], 
	last_name VARCHAR[30], 
	sex VARCHAR[10], 
	hire_date VARCHAR[20],
	CONSTRAINT pk_employees PRIMARY KEY (
		emp_no
	)
);

CREATE TABLE departments (	
	dept_no VARCHAR[10],
	dept_name VARCHAR[50],
	CONSTRAINT pk_departments PRIMARY KEY (
		dept_no
	)
);

--Build these tables third
CREATE TABLE dept_emp (	
	emp_no INTEGER, -- FK >- e.emp_no
	dept_no VARCHAR[10], --  FK >- d.dept_no
	CONSTRAINT pk_dept_emp PRIMARY KEY (
		emp_no
	)
);

CREATE TABLE dept_manager (	
	dept_no VARCHAR[10], --FK >- d.dept_no,
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


--SET KEYS




-- --IMPORT DATA
-- --Build this table first (due to foreign key dependencies)
-- titles
-- --Build these tables second
-- employees
-- departments
-- --Build these tables third
-- dept_emp
-- dept_manager
-- salaries






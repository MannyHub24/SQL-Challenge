-- PART 1. DATA ENGINEERING --

-- CREATE TABLES BASED ON CSV FILES PROVIDED. 
-- TABLE NAMES MATCH THOSE OF FILES.

-- TABLE: TITLES
CREATE TABLE titles (

	title_id VARCHAR (10) NOT NULL,
	title VARCHAR (50) NOT NULL,
	PRIMARY KEY (title_id)
);

-- TABLE: EMPLOYEES
CREATE TABLE employees (

	 emp_no INT NOT NULL, 
	 emp_title_id VARCHAR (50) NOT NULL,
	 birth_date DATE NOT NULL,
	 first_name VARCHAR (50) NOT NULL,
	 last_name VARCHAR (50) NOT NULL,
	 sex VARCHAR (1) NOT NULL,
	 hire_date DATE NOT NULL,
	 PRIMARY KEY (emp_no),
	 FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);


-- TABLE: DEPARTMENTS
CREATE TABLE departments (

	dept_no VARCHAR (4) NOT NULL,
	dept_name VARCHAR (50) NOT NULL,
	PRIMARY KEY (dept_no)
);


-- TABLE: DEPT_EMP
CREATE TABLE dept_emp (

	emp_no INT NOT NULL, 
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY (emp_no, dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);


-- TABLE: DEPT_MANAGER
CREATE TABLE dept_manager(

	dept_no VARCHAR (4) NOT NULL, 
	emp_no INT NOT NULL,
	PRIMARY KEY (dept_no, emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- TABLE: SALARIES
CREATE TABLE salaries (

	emp_no INT NOT NULL,
	salary INT NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
);


-- PART 2. DATA ANALYSIS --

-- #1 LIST EMPLOYEE #, LAST NAME, FIRST NAME, GENDER AND SALARY OF EACH EMPLOYEE. 

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary 

	FROM employees AS e

JOIN salaries AS s ON e.emp_no = s.emp_no;


-- #2 LIST FIRST NAME, LAST NAME, GENDER AND SALARY OF EACH EMPLOYEE HIRED IN 1986.

SELECT e.first_name, e.last_name, e.hire_date

	FROM employees AS e

WHERE EXTRACT(YEAR FROM e.hire_date) = 1986;


-- #3 LIST EACH DEPARTMENT'S MANAGER ALONG WITH THEIR DEPARTMENT'S #, DEPARTMENT'S
-- NAME, EMPLOYEE #, LAST NAME AND FIRST NAME. 

SELECT dm.dept_no, dm.emp_no, d.dept_name, e.last_name, e.first_name

	FROM dept_manager AS dm

JOIN departments AS d ON d.dept_no = dm.dept_no
JOIN employees AS e ON e.emp_no = dm.emp_no;


-- #4 LIST DEPARTMENT # FOR EACH EMPLOYEE ALONG WITH THE EMPLOYEE'S NUMBER, 
-- LAST NAME, FIRST NAME AND DEPARTMENT'S NAME. 


SELECT de.dept_no, e.emp_no, e.last_name, e.first_name, d.dept_name

	FROM dept_emp AS de

JOIN employees AS e ON e.emp_no = de.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no;


-- #5 LIST FIRST NAME, LAST NAME AND GENDER OF EACH EMPLOYEE WHOSE NAME IS HERCULES 
-- AND WHOSE LAST NAME BEGINS WITH THE LETTER "B".

    
SELECT e.first_name, e.last_name, e.sex

	FROM employees AS e

WHERE first_name = ‘Hercules’
AND last_name LIKE ‘B%’; 


-- #6 LIST EACH EMPLOYEE IN THE SALES DEPARTMENT, INCLUDE THEIR EMPLOYEE NUMBER, 
-- LAST NAME AND FIRST NAME. 

SELECT e.emp_no, e.last_name, e.first_name

	FROM employees AS e

JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';


-- #7 LIST EACH EMPLOYEE IN THE SALES AND DEVELOPMENT DEPARTMENTS, INCLUDE THEIR 
-- EMPLOYEE NUMBER, LAST NAME, FIRST NAME AND DEPARTMENT NAME

SELECT e.emp_no, e.last_name, e.first_name , d.dept_name

	FROM employees AS e

JOIN dept_emp AS de ON de.emp_no = e.emp_no
JOIN departments AS d ON d.dept_no = de.dept_no 
WHERE d.dept_name IN (‘Sales’, 'Development'); 


-- 8 LIST THE FREQUENCY COUNT, IN DESCENDING ORDER OF ALL EMPLOYEE LAST NAMES. 

SELECT e.last_name, COUNT(*) AS last_name_count

	FROM employees AS e

GROUP BY e.last_name
ORDER BY last_name_count
DESC;



















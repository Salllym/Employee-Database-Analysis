SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

--1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT e.emp_no,e.last_name,e.first_name,e.sex,s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees AS e
WHERE hire_date BETWEEN '1/1/1986' AND '12/31/1986'
ORDER BY hire_date;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments AS d
	JOIN dept_manager AS dm
	ON (d.dept_no=dm.dept_no)
		JOIN employees as e
		ON (dm.emp_no=e.emp_no);
		
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN departments as d
		ON (de.dept_no=d.dept_no);
		
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN departments as d
		ON (de.dept_no=d.dept_no)
		WHERE d.dept_name = 'Sales';
		
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
	JOIN dept_emp AS de
	ON (e.emp_no=de.emp_no)
		JOIN departments AS d
		ON (de.dept_no=d.dept_no)
		WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';
		
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, count(last_name) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency desc;

--BONUS
--Create a histogram to visualize the most common salary ranges for employees.
SELECT * FROM salaries;--using this query to find the most common salary in jupyter notebook

--Create a bar chart of average salary by title.
--using query below in jupyter notebook
SELECT t.title,s.salary
FROM salaries AS s
INNER JOIN employees AS e
ON (s.emp_no = e.emp_no)
INNER JOIN titles AS t
ON e.emp_title = t.title_id;

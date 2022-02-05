CREATE TABLE titles (emp_no INT Not NULL, 
	title VARCHAR NOT NULL, from_date DATE NOT NULL, to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT employees.emp_no, employees.first_name, employees.last_name
INTO retiring_employees
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
;

drop TABLE retiring_employees;

SELECT e.emp_no, e.first_name, e.last_name, t.title, t.from_date, t.to_date
INTO retiring_employees
FROM employees AS e
LEFT JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retiring_employees;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retiring_employees
WHERE to_date = ('9999-01-01')
ORDER BY emp_no, title DESC;
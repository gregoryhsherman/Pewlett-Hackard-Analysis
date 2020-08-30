create table titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, title, from_date)
);

select * from titles

drop table retirement_titles

SELECT employees.emp_no,
     employees.first_name,
	 employees.last_name,
	 titles.title,
     titles.from_date,
     titles.to_date
into retirement_titles
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31');

drop table unique_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
title

INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

-- Employee count by department number
SELECT COUNT(ut.title), rt.title
INTO retiring_titles
FROM retirement_titles as rt
LEFT JOIN unique_titles as ut
ON ut.emp_no = rt.emp_no
GROUP BY rt.title
ORDER BY rt.title DESC;


select * from unique_titles
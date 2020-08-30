create table titles (
	emp_no INT NOT NULL,
	title VARCHAR NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	PRIMARY KEY (emp_no, title, from_date)
);

select * from titles

drop table retirement_titles

-- List of managers per department
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        e.birth_date,
        de.from_date,
        de.to_date,
        tit.title
INTO new_table

FROM dept_emp AS de
    INNER JOIN employees AS e
        ON (de.emp_no = e.emp_no)
    INNER JOIN titles as tit
        ON (e.emp_no = tit.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31');

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)emp_no,
first_name,
last_name,
birth_date,
from_date,
to_date,
title 
INTO mentorship_eligibility
FROM new_table
ORDER BY emp_no, title DESC;

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


select * from new_table
-- DELIVERABLE 1
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title,
	t.from_date,
	t.to_date
-- INTO title_retirement
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;
-- Use Dictinct with Orderby to remove duplicate rows
	SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
	INTO unique_titles
	FROM title_retirement
	WHERE (to_date = '9999-01-01')
	ORDER BY emp_no ASC, to_date DESC;
	
SELECT * FROM unique_tables;

SELECT COUNT(ut.emp_no),
	ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT(ut.title) DESC;
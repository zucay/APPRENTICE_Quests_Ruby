CREATE TABLE example(
    shohin_id INTEGER,
    shohin_mei VARCHAR(100),
    shohin_bunrui VARCHAR(32)
)

ALTER TABLE example_table ADD sell_num INTEGER;

INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui)
VALUES (1,'super_t_shirts', 'cloths');

UPDATE example 
SET shohin_mei = 'SUPER_T_SHIRTS'
WHERE shohin_id = 1;

DELETE FROM example

SELECT emp_no, MAX(salary) FROM salaries GROUP BY emp_no HAVING MAX(salary) >= 140000 LIMIT 10;

SELECT emp_no, MIN(salary) 
FROM salaries 
GROUP BY emp_no 
HAVING MIN(salary) < 40000 
LIMIT 10;

SELECT emp_no, MAX(to_date)
FROM salaries 
GROUP BY emp_no 
HAVING MAX(to_date) <> '9999-01-01' AND emp_no BETWEEN 10000 AND 10100
LIMIT 100;

SELECT emp_no, MAX(to_date)
FROM salaries
WHERE emp_no BETWEEN 10000 AND 10100
GROUP BY emp_no 
HAVING MAX(to_date) <> '9999-01-01'
LIMIT 100; 

SELECT *
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
LIMIT 50;

SELECT dm.dept_no, dm.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
LIMIT 50;

SELECT dm.dept_no, dp.dept_name, dm.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
INNER JOIN departments AS dp
ON dm.dept_no = dp.dept_no
ORDER BY dept_no
LIMIT 50;


SELECT dm.dept_no, dp.dept_name, dm.emp_no, e.first_name, e.last_name, dm.to_date
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
INNER JOIN departments AS dp
ON dm.dept_no = dp.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_no
LIMIT 50;

SELECT *
FROM employees AS em
INNER JOIN salaries AS sa
ON em.emp_no = sa.emp_no
WHERE em.emp_no BETWEEN '10001' AND '10010'
ORDER BY em.emp_no
;

SELECT em.emp_no, em.first_name, em.last_name, SUM(sa.salary), MIN(sa.from_date),MAX(sa.to_date)
FROM employees AS em
INNER JOIN salaries AS sa
ON em.emp_no = sa.emp_no
WHERE em.emp_no BETWEEN '10001' AND '10010'
GROUP BY em.emp_no
ORDER BY em.emp_no
;
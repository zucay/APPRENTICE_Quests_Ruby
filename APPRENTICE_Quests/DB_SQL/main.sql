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

EXPLAIN ANALYZE
SELECT *
FROM employees
WHERE birth_date = '1961-08-03';

CREATE INDEX birth_index
ON employees (birth_date);

DROP INDEX birth_index
ON employees;

START TRANSACTION;
INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui) VALUES (1, 'T-shirt', '衣服');
INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui) VALUES (2, 'super-T-shirt', '衣服');

COMMIT;


START TRANSACTION;

SELECT *
FROM salaries
WHERE emp_no = '10001'
AND from_date = '1986-06-26'
LIMIT 50;

START TRANSACTION;

UPDATE salaries
SET salary = salary * 5
WHERE emp_no = '10001'
AND from_date = '1986-06-26';

START TRANSACTION;
UPDATE salaries
SET salary = 5000
WHERE emp_no = '10001'
AND from_date = '1986-06-26';

SELECT emp_no, salary
FROM salaries
WHERE emp_no BETWEEN '10001' AND '10010'
HAVING salary > (SELECT AVG(salary) FROM salaries)

SELECT DISTINCT(emp_no)
FROM salaries
WHERE salary > (SELECT AVG(salary) * 2 FROM salaries);

SELECT emp_no, MAX(salary) AS max_sa
FROM salaries
WHERE emp_no BETWEEN '10001' AND '10010'
GROUP BY emp_no
HAVING max_sa > (SELECT AVG(salary) FROM salaries);

EXPL

SELECT gender ,MIN(birth_date)
FROM employees
GROUP BY gender

SELECT gender, emp_no, birth_date
        FROM employees AS e1
        WHERE emp_no <= (SELECT MIN(e2.emp_no)
                            FROM employees AS e2
                        WHERE e1.hire_date = e2.hire_date);

    k,lk,lllllllll     ,cvc

SELECT emp_no
FROM dept_manager AS d1
WHERE emp_no <=(SELECT MAX(emp_no)
                FROM dept_manager AS d2
                WHERE d1.dept_no = d2.dept_no);

select emp_no, to_date,
    CASE WHEN to_date = '9999-01-01' THEN 'unemployed'
         ELSE 'employed'
    END AS "zaishoku"
FROM dept_emp
WHERE emp_no BETWEEN '10100' AND '10200';

select emp_no, birth_date,
    CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31'
         THEN '50s'
         WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31'
         THEN '60s'
         ELSE 'else'
    END AS "birth-decade"
FROM employees
WHERE emp_no BETWEEN '10001' AND '10050';

select e.birth_date, sa.salary ,
    CASE WHEN e.birth_date BETWEEN '1950-01-01' AND '1959-12-31'
         THEN '50s'
         WHEN e.birth_date BETWEEN '1960-01-01' AND '1969-12-31'
         THEN '60s'
         ELSE 'else'
    END AS birth_decade
FROM employees AS e
INNER JOIN salaries AS sa
ON e.emp_no = sa.emp_no
WHERE e.emp_no BETWEEN '10001' AND '10050'
LIMIT 100;


SELECT birth_decade, MAX(salary)
FROM
(select e.birth_date, sa.salary ,
    CASE WHEN e.birth_date BETWEEN '1950-01-01' AND '1959-12-31'
         THEN '50s'
         WHEN e.birth_date BETWEEN '1960-01-01' AND '1969-12-31'
         THEN '60s'
         ELSE 'else'
    END AS birth_decade
FROM employees AS e
INNER JOIN salaries AS sa
ON e.emp_no = sa.emp_no
WHERE e.emp_no BETWEEN '10001' AND '10050') AS sub
GROUP BY birth_decade
LIMIT 100;
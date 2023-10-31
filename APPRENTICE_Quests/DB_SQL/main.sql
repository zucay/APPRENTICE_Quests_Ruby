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
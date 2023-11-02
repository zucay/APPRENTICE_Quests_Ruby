# 条件分岐ができる

## 1. CASE

従業員番号10100から10200の従業員に対して、最終在籍日に応じて在籍中か離職済みかを出し分けたいです。従業員番号、最終在籍日 (to_date)、在職状況(employed/unemployed) を、CASE 式を使用して表示してください。

select emp_no, to_date,
    CASE WHEN to_date = '9999-01-01' THEN 'unemployed'
         ELSE 'employed'
    END AS "zaishoku"
FROM dept_emp
WHERE emp_no BETWEEN '10100' AND '10200';

## 2. 年代

従業員番号が10001から10050の従業員を対象に、従業員番号、誕生日、年代を表示してください。なお年代は、誕生日が1950年代の場合「50s」、誕生日が1960年代の場合「60s」と表記してください。

select emp_no, birth_date,
    CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31'
         THEN '50s'
         WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31'
         THEN '60s'
         ELSE 'else'
    END AS "birth-decade"
FROM employees
WHERE emp_no BETWEEN '10001' AND '10050';

## 3. 年代ごとの最大給与

年代ごとの最大給与を取得してください。なお年代は、誕生日が1950年代の場合「50s」、誕生日が1960年代の場合「60s」と表記してください。

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

+--------------+-------------+
| birth_decade | MAX(salary) |
+--------------+-------------+
| 50s          |       99651 |
| 60s          |       84169 |
+--------------+-------------+
# テーブルを結合できる

## 1. 内部結合

部署マネージャーテーブルに、従業員テーブルのデータを内部結合させた全データを取得してください。
SELECT *
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
LIMIT 50;
## 2. 列の選択

部署ごとに、部署番号、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。
SELECT dm.dept_no, dm.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
LIMIT 50;
## 3. 複数の内部結合

部署ごとに、部署番号、部署名、歴代のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。
SELECT dm.dept_no, dp.dept_name, dm.emp_no, e.first_name, e.last_name
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
INNER JOIN departments AS dp
ON dm.dept_no = dp.dept_no
ORDER BY dept_no
LIMIT 50;
## 4. 絞り込み

部署ごとに、部署番号、部署名、現在のマネージャーの従業員番号、マネージャーのファーストネーム、マネージャーのラストネームを取得してください。
SELECT dm.dept_no, dp.dept_name, dm.emp_no, e.first_name, e.last_name, dm.to_date
FROM dept_manager AS dm
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no
INNER JOIN departments AS dp
ON dm.dept_no = dp.dept_no
WHERE dm.to_date = '9999-01-01'
ORDER BY dept_no
LIMIT 50;
## 5. 給与

従業員番号10001から10010の従業員ごとに、ファーストネーム、ラストネーム、いつからいつまで給与がいくらだったかを取得してください。

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
## 6. 内部結合と外部結合の違い

INNER JOIN と OUTER JOIN の違いについて、SQL 初心者にわかるように説明してください。またどのように使い分けるのかも合わせて説明してください。

AのテーブルとBのテーブルがあるときA∩BがINNER JOIN A∪Bが OUTER JOIN
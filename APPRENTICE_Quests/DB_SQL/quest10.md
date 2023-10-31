# データを集計できる

## 1. 列の合計値

給与情報(salaries テーブル)から、全データの給与の合計値を求めてください。
SELECT SUM(salary) sum_salary FROM salaries LIMIT 10;
181480757419
## 2. 列の平均値

給与情報から、全データの給与の平均値を求めてください。
SELECT AVG(salary) avg_salary FROM salaries LIMIT 10;
| avg_salary |
+------------+
| 63810.7448
## 3. 四捨五入

給与の平均値は小数点で取得されたかと思います。給与の平均値を四捨五入して整数で求めてください。
SELECT ROUND(AVG(salary)) avg_round_salary FROM salaries LIMIT 10;
## 3. 列の最大値

給与情報から、全データの給与の最大値を求めてください。
SELECT MAX(salary) max_salary FROM salaries LIMIT 10;
## 4. 列の最小値

給与情報から、全データの給与の最小値を求めてください。
SELECT MIN(salary) min_salary FROM salaries LIMIT 10;

## 5. 行数

給与情報から、全データの行数を求めてください。
SELECT COUNT(salary)  FROM salaries LIMIT 10;

## 6. 絞り込みとの組み合わせ

from_date が1986年6月26日の従業員の最大給与を取得してください。
SELECT MAX(salary) FROM salaries WHERE from_date = '1986-06-26' ;

## 7. 少数第1桁

to_date が1991年6月26日の従業員の平均給与を少数第1桁で取得してください。
SELECT ROUND(AVG(salary),1) AS avg_19910626 FROM salaries WHERE from_date = '1991-06-26' ;


as の後のエイリアスは数字始まりダメ
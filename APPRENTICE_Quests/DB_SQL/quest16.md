# 実行計画を確認できる

## 1. 実行計画

SQL における実行計画とは何か、実行計画を確認すると何が良いのか、SQL 初心者にわかるように説明してください。

目的のデータに辿り着くための効率の良いプランのこと。
オプティマイザが統計情報を基に実行する。

実際にその計画が効率の良いものか確認出来る。

## 2. 実行計画の確認

次のクエリの実行計画を確認してください。

```sql
SELECT * FROM salaries WHERE salary = 70575;
```
EXPLAIN SELECT * FROM salaries WHERE salary = 70575;

## 3. 実行時間

次のクエリの、最初の行・全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。なお、EXPLAIN ANALYZE ステートメントを利用することで確認できます。

```sql
SELECT * FROM salaries WHERE salary = 70575;
```

## 4. 高速なクエリ

次のクエリの実行計画及び全ての行を取得するのに実際にかかった時間(ミリ秒)を確認してください。

```sql
SELECT * FROM salaries WHERE emp_no = 10100;
```
 -> Filter: (salaries.salary = 70575)  (cost=289755 rows=283843) (actual time=2.06..1009 rows=56 loops=1)
    -> Table scan on salaries  (cost=289755 rows=2.84e+6) (actual time=1.31..907 rows=2.84e+6 loops=1)
 |

このクエリは3のクエリよりも実行時間が短いはずです。なぜこのクエリの方が高速なのかを説明してください。

| -> Index lookup on salaries using PRIMARY (emp_no=10100)  (cost=1.75 rows=15) (actual time=0.0209..0.0254 rows=15 loops=1)
 
主キーでインデックスされた列の検索であるため
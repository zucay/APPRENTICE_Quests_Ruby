# トランザクションについて説明できる

## 1. トランザクション

トランザクションとは何か、何のためにあるものかを、データベース初心者にわかるように説明してください。


システムにおける特定の処理を単位時間当たりに何件処理出来たかを測る指標。

DB分野ではDBMSに対して複数のSQL文を送る場合における1つのSQL文の単位。
またその複数のSQLを送るDBMSに備わっている機能のこと。
セットで実行されるべき1つ以上の更新処理の集まりのこと。

## 2. トランザクションの実行

employees データベースに接続してください。次に、トランザクションを実行してください。
MySQLだと　START TRANSACTION

## 3. ロールバック

任意のテーブルにデータを追加してください。検索を実行し、データが追加されていることを確認してください。

次に、ロールバックを実行してください。検索を実行し、データの追加がされていないことを確認してください。

mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui) VALUES (1, 'T-shirt', '衣服');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui) VALUES (2, 'super-T-shirt', '衣服');
Query OK, 1 row affected (0.00 sec)

mysql> select * from example;
+-----------+---------------+---------------+
| shohin_id | shohin_mei    | shohin_bunrui |
+-----------+---------------+---------------+
|         1 | T-shirt       | 衣服          |
|         2 | super-T-shirt | 衣服          |
+-----------+---------------+---------------+
2 rows in set (0.01 sec)

mysql> rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from example;
Empty set (0.00 sec)

## 4. コミット

トランザクションを実行してください。任意のテーブルにデータを追加してください。検索を実行し、データが追加されていることを確認してください。

次に、コミットを実行してください。検索を実行し、データが追加されていることを確認してください。

START TRANSACTION;
INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui) VALUES (1, 'T-shirt', '衣服');
INSERT INTO example (shohin_id, shohin_mei, shohin_bunrui) VALUES (2, 'super-T-shirt', '衣服');

COMMIT;

mysql> select * from example;                                                                          
+-----------+---------------+---------------+
| shohin_id | shohin_mei    | shohin_bunrui |
+-----------+---------------+---------------+
|         1 | T-shirt       | 衣服          |
|         2 | super-T-shirt | 衣服          |
+-----------+---------------+---------------+
2 rows in set (0.00 sec)
# テーブルを定義できる

テーブル定義では各テーブルに対して、テーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、外部キー制約、ユニークキー制約を定義します。

## 1. データ型

データ型とは何か、データベース初心者にわかるように説明してください。
保持出来るデータの種類。

## 2. NULL

NULL とは何か、データベース初心者にわかるように説明してください。

型指定した変数、セルの中に何のデータも無い状態。

## 3. プライマリーキー

プライマリーキーとは何か、データベース初心者にわかるように説明してください。

主キー。テーブルのレコードを一意に特定出来るユニークな値。


## 4. 初期値

テーブル定義における初期値(デフォルト値)とは何か、データベース初心者にわかるように説明してください。

NULLなデータを参照した時に返る値。

## 5. AUTO INCREMENT

AUTO INCREMENT とは何か、データベース初心者にわかるように説明してください。

AUTO_INCREMENT 属性を使用すると、その行に値が指定されなかった場合、自動でインクリメントされたシーケンス番号の値が入る。そのため新しい行に一意の識別子を生成でき、主キーに使われることが多い。

## 6. 外部キー制約

外部キー制約とは何か、データベース初心者にわかるように説明してください。

親テーブルと子テーブルの間で、値の整合性を取ることができるようにするもの

テーブルを作成するときにカラムに FOREIGN KEY 制約(外部キー制約)を設定することで、
対象のカラムに格納できる値を他のテーブルに格納されている値だけに限定することができる

親テーブルと子テーブルの2つのテーブル間でデータの整合性を保つために設定される制約

## 7. ユニークキー制約

ユニークキー制約とは何か、データベース初心者にわかるように説明してください。

テーブルを作成するときにカラムに UNIQUE 制約をつけることでカラムに重複した値を格納することができなくなる。

UNIQUE 制約を設定すると自動的にインデックスが作成される。


## 8. テーブル定義

EC サイトの ER 図を、テーブル定義しましょう。各テーブルのテーブル名、カラム名、データ型、NULL(NULL OK の場合のみ YES と記載)、キー（キーが存在する場合、PRIMARY/INDEX のどちらかを記載）、初期値（ある場合のみ記載）、AUTO INCREMENT（ある場合のみ YES と記載）、外部キー制約、ユニークキー制約を設定してください。




テーブル：Customers

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|customer_id|bigint(20)||PRIMARY||YES|
|customer_name|varchar(100)|||||
|buy_info_id|varchar(100)||INDEX|||

- 外部キー制約：buy_info_id カラムに対して設定

テーブル：Buy_information

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|buy_info_id|bigint(20)||PRIMARY||YES|
|buy_date|date|||||
|product_id|bigint(20)||INDEX|||
|product_buy_num|bigint(20)|||||
|sum_price|bigint(20)|||||

- 外部キー制約：product_id カラムに対して設定

テーブル：Products
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|product_id|bigint(20)||PRIMARY||YES|
|product_name|varchar(100)|||||
|price|bigint(20)|||||
|product_category_id|bigint(20)||INDEX|||

- 外部キー制約：product_category_id カラムに対して設定

テーブル：Product_categories
|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|product_category_id|bigint(20)||PRIMARY||YES|
|category_name|varchar(100)|||||

 
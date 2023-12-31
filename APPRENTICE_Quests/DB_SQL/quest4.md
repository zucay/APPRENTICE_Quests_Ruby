# ユーザーを作成・権限付与・削除できる

Root権限を持つユーザーで MySQL へ接続してください。

## 1. ユーザーの作成

MySQL のユーザーを作成してください。名前とパスワードは任意、ホストは localhost を指定してください。

CREATE USER 'user_name'@'localhost';

## 2. ユーザーの表示

ユーザーを作成できたことを確認するために、ユーザーの一覧を表示してください。

SELECT  host, user FROM mysql.user;

## 3. ユーザーへの権限付与

作成したユーザーに、MySQL 内のすべてのデータベースとテーブルへの root のフルアクセス権を付与してください。

なお、ユーザーへの権限付与を学習するために本問題を用意していますが、現場ですべてのデータベースへの root のフルアクセス権限を付与することはほぼありません。データベースのセキュリティを危険にさらす可能性があるためです。

特定のユーザーの権限確認
show grants for 'ユーザー名'@'ホスト名'



## 4. 権限のリロード

ユーザーに権限を付与したら、すべての権限をリロードしてください。これにより設定が有効になります。

権限の反映
FLUSH PRIVILEGES;

※ご指摘いただき、公式ドキュメントを確認したところ、下記のような記載がありましたので、
この手順で権限を付与した場合、FLUSH PRIVILEGES;は実行する必要が無いようです。

GRANT, REVOKE, or SET PASSWORD などのステートメントを使用して、間接的に権限テーブルを変更する場合は、サーバがこれらの変更を認識し、その変更があった直後に権限テーブルをメモリへリロードします。

INSERT、UPDATE、DELETE などのステートメントを使用して、直接に権限テーブルを変更する場合は、サーバを再起動するか、またはテーブルのリロードを行なうまでその権限チェックは施行しません。手動で権限テーブルをリロードするには、FLUSH PRIVILEGES ステートメントを発行するか、mysqladmin flush-privileges または mysqladmin reload コマンドを実行します。

## 5. ユーザーの削除

権限剥奪
revoke all on *.* from 'mytest'@'localhost';
DROP USER 'taku'@'localhost'
作成したユーザーを削除してください。削除後、削除できていることを確認してください。

## 6. ユーザーの再作成

再度ユーザーを作成、権限付与、権限のリロードを行ってください。

今後は root ユーザーは基本的に使用せず、今回作成したユーザーを使用してください。
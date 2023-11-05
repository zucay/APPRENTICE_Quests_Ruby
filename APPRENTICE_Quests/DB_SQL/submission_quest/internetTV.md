
# Channels
- チャンネルID
- チャンネル名

 # Programs
- 番組ID
- 番組名
- 番組カテゴリID
- 番組詳細
- 放送チャンネルID
- 放送開始時間
- 放送終了時間
- 番組再生数

- コンテンツID
- シーズンID
- エピソードID

# Contents
- コンテンツID : integer
- コンテンツ名 : varchar (100)
- 総エピソード数
- 総シーズン数
- 作品詳細

# Program_categories
- 番組カテゴリID
- 番組カテゴリ名

# Seasons
- シーズンID
- シーズン名
- 総エピソード数

 # Episodes
- エピソードID
- コンテンツID
- シーズンID
- エピソード数
- エピソード名
- エピソード詳細
- 動画時間
- 公開日
- エピソード再生数

- 放送番組ID


さらなるサンプルデータを追加するSQLを作成してください。
ドラマ名、アニメ名、番組名、など名前は全て過去の現実のものを使用し、番組Aなどといった無機質な名前は使用しないでください。
既に既存のデータがDB内にありID系は全てプライマリキーでオートインクリメントされています。

# Channels

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|チャンネルID|bigint(20)||PRIMARY||YES|
|チャンネル名|varchar(100)|||||



# Programs

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|番組ID|bigint(20)||PRIMARY||YES|
|番組名|varchar(100)|||||
|番組カテゴリID|bigint(20)|||||
|番組詳細|varchar(255)|||||
|放送チャンネルID|bigint(20)|||||
|放送開始時間|datetime|||||
|放送終了時間|datetime|||||
|番組再生数|bigint(20)|||||
|コンテンツID|bigint(20)|||||
|シーズンID|bigint(20)|||||
|エピソードID|bigint(20)|||||



# Contents

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|コンテンツID|bigint(20)||PRIMARY||YES|
|コンテンツ名|varchar(100)|||||
|総エピソード数|bigint(20)|||||
|総シーズン数|bigint(20)|||||
|作品詳細|varchar(255)|||||


# Program_categories

|カラム名|データ型|NULL|キー|初期値|AUTO INCREMENT|
| ---- | ---- | ---- | ---- | ---- | ---- |
|番組カテゴリID|bigint(20)||PRIMARY||YES|
|番組カテゴリ名|varchar(100)|||||


# Episodes
| カラム名   | データ型     | NULL | キー | 初期値 | AUTO INCREMENT |
| ---------- | ----------- | ---- | ----- | ------ | --------------- |
| エピソードID | bigint(20)  |      | PRIMARY |        | YES             |
| コンテンツID | bigint(20)  |      |         |        |                 |
| コンテンツ名 | varchar(100) |   |         |        |                 |
| シーズンID   | bigint(20)  |      |         |        |                 |
| エピソード数 | bigint(20)  |      |         |        |                 |
| エピソード名 | varchar(100) |   |         |        |                 |
| エピソード詳細 | varchar(255) |   |         |        |                 |
| 動画時間   | time  |   |         |        |                 |
| 公開日     | date        |   |         |        |                 |
| 再生数     | bigint(20)  |   |         |        |                 |
| 放送番組ID  | bigint(20)  |   |         |        |                 |


# Seasons
| カラム名     | データ型     | NULL | キー | 初期値 | AUTO INCREMENT |
| ----------  | ----------- | ---- | ----- | ------ | --------------- |
| シーズンID   | bigint(20)  |      | PRIMARY |        | YES             |
| シーズン名   | varchar(100) |   |         |        |                 |
| 総エピソード数 | bigint(20)  |  |         |        |                 |















<!-- エンティティを定義できる
1. エンティティ
あなたはこれからAmazonのようなECサイトを新規に作成しようとしています。ユーザーが会員登録し、その後商品を購入できるサイトです。

各ユーザーは、マイページで登録情報と購入履歴を確認することができます。ECサイトのマイページには、以下の情報が表示されていました。

山浦清透のマイページ

○購入履歴
・購入商品1（4/14購入）
【商品】iPhone 13
【カテゴリー】スマートフォン
【値段】100,000円

・購入商品2（4/17購入）
【商品】キリン一番搾り生ビール10本
【カテゴリー】ビール
【値段】2,000円
ここで表示されている情報がサイトで必要となる全ての種類データであるとします（ユーザーや商品は他にも存在しています）。

このサイトの、データとして保存すべきエンティティを全て箇条書きで列挙してください。
 -->



# Customers
    - customer_id
    - customer_name
    - buy_info_id
PK:customer_id

# Buy_information
    - buy_info_id
    - buy_date
    - product_id
    - product_buy_num
    - sum_price
PK:buy_info_id

# Products
    - product_id
    - product_name
    - price
    - product_category_id
PK:product_id

# Product_categories
    - product_category_id
    - category_name
PK:product_category_id
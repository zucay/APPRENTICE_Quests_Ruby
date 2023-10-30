## 提出クエストのパス
APPRENTICE_Quests\submission_Quest  
この中にブラックジャックのプログラムがあります。  

## Rubocopに対しての修正
修正しない方が分かりやすいと感じたもの  
・冗長なreturn  
・% 記法  
・if を式と見立てて代入する手法  
改善が難しかったもの  
・循環的複雑度超過やメソッドの行超過  

## 注意
・STEP1、STEP2  
書き方のイメージが掴めず、まずオブジェクト指向を意識せず書いて整理する方針で書きました。Step2まで基本挙動を書き終えた後、クラスにまとめていったのでStep1はオブジェクト指向を意識した書き方ではありません。  
・バースト処理について  
バーストの処理が現実のブラックジャックに即した挙動になりました。自身がバーストしてもすぐに勝敗判定に入らず、ディーラーも17以上までドローをしてバーストした場合引き分けする処理にしました。  
・STEP3  
CPUプレイヤーの数を入力によって変化させました。  
・STEP4  
サレンダーやダブルダウンの概念が入るとゲーム性的にチップの概念が必要になるので追加しました。チップ数を維持して再度ゲームを開始するためにループを実装しました。  
スプリットについて未実装です。  
ハンドに対してメソッドを書いておらず、オブジェクトに対して一対一で今まで書いており修正を期限内で出来ないと判断しました。  

## 反省
最初にクラスを意識した書き方で始めることが出来ず、そのまま書いて途中からクラス化した事でオブジェクト指向のメリット、各オブジェクトの入出力の繋ぎ方を学ぶことが出来ました。
スプリットが後々追加することが難しかったので設計の重要さを身に染みて理解しました。
どこに何の責任を持たせるのかを判断するのが難しく、クラスとメソッドが肥大化しがちでした。次回oopで書くときは単一責任強く意識して書く。
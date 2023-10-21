# frozen_string_literal: true

# 〇一回しか引けない end位置変更
# 〇burstしても2重ループ抜けれない->exit?
# 日本語訳
# 被りあり
# 〇Dealerの手札隠す
# 手札を追加機能も関数にまとめる

# プレイヤークラス
class Player
  def initialize()
    #手札
    #点数
  end

end

# ディーラークラス
class Dealer

end

# 変数
deck = []
suits = ['Heart', 'Diamond', 'Club', 'Spade']
nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
used_cards = [] # 使用したカード配列


player_hand = []
dealer_hand = []

player_score = 0
dealer_score = 0

is_used_cards = false

# 得点計算関数(引数:2次元配列のみ)
def calculate(hands_arr)
  sum = 0
  hands_arr.each do |hand|
    num = hand[0]
    if num >= 10
      num = 10
    end
    sum += num
  end
  return sum
end


# 乱数カード生成（被りあり）[num, suit]
def rand_card()
  deck_suits = ["S","H","D","C"]
  card = [rand(1..13), deck_suits[rand(0..3)]]
  return card
end

# デッキ生成
def deck_making()
  suits.each do |suit|
    nums.each do |num|
      deck << [num, suit]
    end
  end
end


# デッキからカード選択(引数：デッキ、使ったカードリスト)
def select_card(deck, used_cards)
  available_cards = deck - used_cards #配列の差分
  selected_card = available_cards.sample
  used_cards << selected_card
  return selected_card
end

# # 配る クラス化したら機能出来そう
# def distribution(player_name)
#   player_name.push rand_card()
# end

# 実行部
if __FILE__ == $PROGRAM_NAME
  puts "ブラックジャックを開始します。"

  #手札配り
  player_hand.push rand_card()
  player_hand.push rand_card()

  dealer_hand.push rand_card()
  dealer_hand.push rand_card()

  # 手札、点数公開処理
  puts "あなたの手札は#{player_hand}です。"
  puts "ディーラーの引いたカードは #{dealer_hand[0]}です。"
  puts "ディーラーの引いた2枚目のカードはわかりません。"

  player_score = calculate(player_hand)
  # dealer_score = calculate(dealer_hand)
  # puts "dealer's score is #{dealer_score}"


# main loop-----------------------------
  while true
    puts "あなたの現在の得点は#{player_score}です。カードを引きますか？(y/n)"
    y_or_n = gets.chomp
    # 入力部
    case y_or_n
    when "n"
      break
    when "y"
      player_hand.push rand_card()
      player_score = calculate(player_hand)

      # 早期ループ脱出
      if player_score > 21
        puts"BURST! You Lose!"
        puts"ブラックジャックを終了します。"
        exit
      end
      if player_score == 21
        puts"You are BJ!"
        break
      end
    else
      puts "y/n を入力してください"
    end
  end

  # ディーラードロー
  while dealer_score < 17
    rand_hand = rand_card()
    dealer_hand.push rand_hand
    dealer_score = calculate(dealer_hand)
    p dealer_hand
    puts "Dealer's score is #{dealer_score}"
  end

  puts "Player's score is #{player_score}"
  puts "Dealer's score is #{dealer_score}"

  # 勝敗判定
  if ((21 - player_score) < (21 - dealer_score))
    puts "あなたの勝ちです！"
    puts "ブラックジャックを終了します。"
    exit
  elsif  22 <= dealer_score
    puts "ディーラーのバーストです。あなたの勝ちです！"
  elsif (21 - player_score) == (21 - dealer_score)
    puts "引き分けです！"
    puts "ブラックジャックを終了します。"
    exit
  else
    puts "あなたの負けです！"
    puts "ブラックジャックを終了します。"
    exit
  end


end

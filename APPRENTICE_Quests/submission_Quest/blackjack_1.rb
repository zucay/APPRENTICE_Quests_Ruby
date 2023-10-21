# frozen_string_literal: true

# 〇一回しか引けない end位置変更
# 〇burstしても2重ループ抜けれない->exit?
# 日本語訳
# 被りあり
# 〇Dealerの手札隠す


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
used_cards = []
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

# 配る クラスだったら機能
def distribution(player_name)
  player_name.push rand_card()
end

# 実行部
if __FILE__ == $PROGRAM_NAME
  puts "ブラックジャックを開始します。"

  #手札配り
  player_hand.push rand_card()
  player_hand.push rand_card()

  dealer_hand.push rand_card()
  dealer_hand.push rand_card()

# 手札、点数公開処理
  puts "Your hand is #{player_hand}"
  puts "Dealer hand is #{dealer_hand[0]}"

  player_score = calculate(player_hand)
  # dealer_score = calculate(dealer_hand)
  puts "Player's score is #{player_score}"
  # puts "dealer's score is #{dealer_score}"


# main loop-----------------------------
  while true
    puts "You wanna draw? (y/n)"
    y_or_n = gets.chomp

    case y_or_n
    when "n"
      break
    when "y"
      player_hand.push rand_card()
      player_score = calculate(player_hand)
      p player_hand
      puts "Player's score is #{player_score}"

      if player_score > 21
        puts"BURST! You Lose!"
        exit
      end

      if player_score == 21
        puts"You are BJ!"
        break
      end
    end
  end

  while dealer_score < 17
    rand_hand = rand_card()
    dealer_hand.push rand_hand
    dealer_score = calculate(dealer_hand)
    p dealer_hand
    puts "Dealer's score is #{dealer_score}"
  end

  puts "Player's score is #{player_score}"
  puts "Dealer's score is #{dealer_score}"

  if ((21 - player_score) < (21 - dealer_score))
    puts "YOU WIN!"
    exit
  elsif  22 <= dealer_score
    puts "Dealer is Bursted! YOU WIN!"
  elsif (21 - player_score) == (21 - dealer_score)
    puts "Draw!"
    exit
  else
    puts "YOU LOSE!"
    exit
  end


end

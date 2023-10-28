# frozen_string_literal: true

# 〇一回しか引けない end位置変更
# 〇burstしても2重ループ抜けれない->exit?
# 〇被りあり
# 〇Dealerの手札隠す
# 〇Aの得点場合分け

# 変数
used_cards = [] # 使用したカード配列

player_hand = []
dealer_hand = []

player_score = 0
# dealer_score = 0

is_player_bust = false
is_dealer_bust = false

# 得点計算関数(引数:2次元配列のみ)
def calculate(hand_arr)
  sum = 0
  ace_count = 0
  score_ten = ['10', 'J', 'Q', 'K']

  hand_arr.each do |hand|
    num_str = hand[0]
    if score_ten.include?(num_str)
      num = 10
    elsif num_str == 'A'
      num = 11
      ace_count += 1
    else
      num = num_str.to_i
    end
    sum += num
  end

  # Aの場合分け処理 sum > 21 ならAを1として計算
  ace_count.times do
    if sum > 21
      sum -= 10
    end
  end

  return sum
end

# デッキ生成
def deck_making
  deck = []
  suits = ['Heart', 'Diamond', 'Club', 'Spade']
  nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
  suits.each do |suit|
    nums.each do |num|
      deck << [num, suit]
    end
  end
  return deck
end

# デッキからカード選択(引数：デッキ、使ったカードリスト)
def select_card(deck, used_cards)
  available_cards = deck - used_cards # 配列の差分
  selected_card = available_cards.sample # ランダム1枚
  used_cards << selected_card # 使用したカードを記録
  return selected_card
end


# 実行部---------------------------------
if __FILE__ == $PROGRAM_NAME
  puts 'ブラックジャックを開始します。'

  # デッキ生成
  deck = deck_making

  # 手札配り
  player_hand << select_card(deck, used_cards)
  player_hand << select_card(deck, used_cards)

  dealer_hand << select_card(deck, used_cards)
  dealer_hand << select_card(deck, used_cards)

  # 手札、点数情報の公開
  puts "あなたの手札は#{player_hand}です。"
  puts "ディーラーの引いたカードは #{dealer_hand[0]}です。"
  puts 'ディーラーの引いた2枚目のカードはわかりません。'

  player_score = calculate(player_hand)
  dealer_score = calculate(dealer_hand)

  # ループ部
  loop do
    puts "あなたの現在の得点は#{player_score}です。カードを引きますか？(y/n)"
    y_or_n = gets.chomp
    # 入力部
    case y_or_n
    when 'n'
      break
    when 'y'

      player_draw_card = select_card(deck, used_cards)
      player_hand << player_draw_card
      player_score = calculate(player_hand)
      puts "あなたの引いたカードは#{player_draw_card}です。"

      # プレイヤー バースト or 21判定
      if player_score > 21
        is_player_bust = true
        puts "あなたの現在の得点は#{player_score}です"
        break
      elsif player_score == 21
        puts 'You are BJ!'
        puts "あなたの現在の得点は#{player_score}です"
        break
      end
    else
      puts 'y/n を入力してください'
    end
  end

  # ディーラードロー
  while dealer_score < 17
    dealer_draw_card = select_card(deck, used_cards)
    dealer_hand << dealer_draw_card
    dealer_score = calculate(dealer_hand)
    puts "ディーラーの引いたカードは#{dealer_draw_card}です。"
    puts "Dealer's score is #{dealer_score}"
  end

  # ディーラーバースト判定
  if dealer_score > 21
    is_dealer_bust = true
  end

  puts "ディーラーの手札は#{dealer_hand}です。"

  puts "Player's score is #{player_score}"
  puts "Dealer's score is #{dealer_score}"


  # 勝敗判定
  diff_21_player_score = 21 - player_score
  diff_21_dealer_score = 21 - dealer_score

  # バースト判定
  if is_player_bust || is_dealer_bust
    if is_player_bust && is_dealer_bust
      puts '両者バーストです！'
      puts '引き分けです！'
      puts 'ブラックジャックを終了します。'
    elsif is_player_bust
      puts 'あなたのバーストです！'
      puts 'あなたの負けです！'
      puts 'ブラックジャックを終了します。'
    elsif is_dealer_bust
      puts 'ディーラーのバーストです！'
      puts 'あなたの勝ちです！'
      puts 'ブラックジャックを終了します。'
    end
    exit
  end

  # 点数勝敗判定
  if diff_21_player_score < diff_21_dealer_score
    puts 'あなたの勝ちです！'
    puts 'ブラックジャックを終了します。'
  elsif diff_21_player_score == diff_21_dealer_score
    puts '引き分けです！'
    puts 'ブラックジャックを終了します。'
  elsif diff_21_player_score > diff_21_dealer_score
    puts 'あなたの負けです！'
    puts 'ブラックジャックを終了します。'
  end
  exit
end

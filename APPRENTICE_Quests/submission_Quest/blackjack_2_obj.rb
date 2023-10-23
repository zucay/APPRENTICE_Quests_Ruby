# frozen_string_literal: true

# 〇一回しか引けない end位置変更
# 〇burstしても2重ループ抜けれない->exit?
# 〇被りあり
# 〇Dealerの手札隠す
# 〇Aの得点場合分け

# クラス---------------------------------------------------------
# BJ_playerクラス（親クラス）
class BJ_player
  attr_accessor :name, :hand, :score, :is_bust, :is_bj

  def initialize(name)
    @name = name
    @hand = []
    @score = 0
    @is_bust = false
    @is_bj = false
  end

  # 得点計算、バースト判定
  def calculate
    sum = 0
    ace_count = 0
    score_ten = ['10', 'J', 'Q', 'K']

    @hand.each do |hand|
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
    @score = sum

    # バースト、21判定
    if @score > 21
      @is_bust = true
    elsif @score == 21
      @is_bj = true
    end
  end

  # 点数公開メソッド
  def show_score
    puts "#{@name}の現在の得点は#{@score}です。"
  end

  # 手札公開メソッド
  def show_hand
    puts "#{@name}の手札は#{@hand}です。"
  end

  # ドロー公開メソッド
  def show_latest_draw
    puts "#{@name}の引いたカードは#{@hand[-1]}です。"
  end
end

# Playerクラス-----------------------------------------------------------------------
class Player < BJ_player
  # ドローメソッド
  def player_draw(deck_obj , deck)
    while true # 'y'入力 or 21以上までループ
      puts 'カードを引きますか？(y/n)'
      y_or_n = gets.chomp
      case y_or_n
      when 'n'
        break
      when 'y'
        deck_obj.dealing(deck, self)
        show_latest_draw
        calculate
        show_score
        if @is_bj || @is_bust
          break
        end
      else
        puts 'y/n を入力してください'
      end
    end
  end
end


# Dealerクラス-----------------------------------------------------------------------
class Dealer < BJ_player
  # ドローメソッド（17以上までドロー）
  def dealer_draw(deck_obj, deck)
    show_score
    while @score < 17
      deck_obj.dealing(deck, self)
      calculate
      show_latest_draw
      show_score
    end
  end

  # 手札1枚公開
  def show_one_hand
    puts "#{@name}の引いたカードは #{@hand[0]}です。"
    puts "#{@name}の引いた2枚目のカードはわかりません。"
  end
end

# Deckクラス----------------------------------------------------------------------
class Deck
  attr_accessor :name, :used_cards

  def initialize(name)
    @name = name
    @used_cards = []
  end

  # デッキ作成メソッド
  def deck_making
    deck_arr = []
    suits = ['Heart', 'Diamond', 'Club', 'Spade']
    nums = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']
    suits.each do |suit|
      nums.each do |num|
        deck_arr << [num, suit]
      end
    end
    return deck_arr
  end

  # デッキからランダムカード排出メソッド（被り無し）
  def select_card(deck)
    available_cards = deck - @used_cards   # 配列の差分
    selected_card = available_cards.sample # ランダム1枚
    @used_cards << selected_card           # 使用したカードを記録
    return selected_card
  end

  # 配布メソッド
  def dealing(deck, bj_player_obj)
    bj_player_obj.hand << select_card(deck)
  end
end


# Gameクラス-----------------------------------------------------------------------
class Game
  def initialize(name1, name2)
    @in_game_player_name1 = name1
    @in_game_player_name2 = name2
  end

  # 開始メソッド
  def start
    puts 'ブラックジャックを開始します。'
  end

  # 終了メソッド
  def end
    puts 'ブラックジャックを終了します。'
    exit
  end

  # 勝敗判定メソッド
  def win_or_lose(player_obj, dealer_obj)
    # バースト勝敗判定
    if player_obj.is_bust || dealer_obj.is_bust
      if player_obj.is_bust && dealer_obj.is_bust
        puts '両者バーストです！'
        puts '引き分けです！'
      elsif player_obj.is_bust
        puts 'あなたのバーストです！'
        puts 'あなたの負けです！'
      elsif dealer_obj.is_bust
        puts 'ディーラーのバーストです！'
        puts 'あなたの勝ちです！'
      end

    # 点数勝敗判定
    else
      if 21 - player_obj.score < 21 - dealer_obj.score
        puts 'あなたの勝ちです！'
      elsif 21 - player_obj.score == 21 - dealer_obj.score
        puts '引き分けです！'
      elsif 21 - player_obj.score > 21 - dealer_obj.score
        puts 'あなたの負けです！'
      end
    end
  end
end

# 実行部(メインファイルなら以下実行)-----------------------------------------------------------------------
if __FILE__ == $PROGRAM_NAME
  # インスタンス化
  bj_game = Game.new('dealer', 'player')
  deck_obj = Deck.new('bj_deck')
  player = Player.new('player')
  dealer = Dealer.new('dealer')

  # BJ開始
  bj_game.start

  # デッキ生成
  bj_deck = deck_obj.deck_making

  # 手札配り(引数:デッキ,参加者)
  deck_obj.dealing(bj_deck, player)
  deck_obj.dealing(bj_deck, player)

  deck_obj.dealing(bj_deck, dealer)
  deck_obj.dealing(bj_deck, dealer)

  # 点数計算
  player.calculate
  dealer.calculate

  # 点数とハンド表示
  player.show_hand
  dealer.show_one_hand
  player.show_score
  # dealer.show_hand # debug用
  # dealer.show_score # debug用

  # プレイヤードロー 入力ループ部
  player.player_draw(deck_obj, bj_deck)

  # ディーラードロー
  dealer.dealer_draw(deck_obj, bj_deck)

  # 勝敗判定
  player.show_score
  dealer.show_score
  bj_game.win_or_lose(player, dealer)

  # BJ終了
  bj_game.end
end

# frozen_string_literal: true

# STEP1
# 〇一回しか引けない
# 〇burstしても2重ループ抜けれない
# 〇被りあり
# 〇Dealerの手札隠す

# STEP2
# 〇Aの得点場合分け

# STEP3
# 〇CPUの可変追加
# 〇CPUのインスタンス化、実行
# 〇CPUの挙動

# STEP4
# チップ概念の追加（追加 BJクラス 変数:チップ、
# メソッド チップshow、bet、チップcaluculate、各ルールの行動）
# ダブルダウン、スプリット、サレンダー
# CPUのベッティング
# ゲームのループ

# クラス---------------------------------------------------------
# BJ_playerクラス（親クラス）
class BJ_player
  BLACKJACK_SCORE = 21
  AUTO_DRAW_LIMIT_SCORE = 17

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
      if sum > BLACKJACK_SCORE
        sum -= 10
      end
    end
    @score = sum

    # バースト、21判定
    if @score > BLACKJACK_SCORE
      @is_bust = true
    elsif @score == BLACKJACK_SCORE
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
    loop do # 'y'入力 or 21以上までループ
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
        if @is_bj || @is_bust # 21以上でbreak
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
    show_hand
    show_score
    while @score < AUTO_DRAW_LIMIT_SCORE
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

# CPUクラス-----------------------------------------------------------------------
class CPU < BJ_player
  # ドローメソッド
  def cpu_draw(deck_obj, deck)
    while @score < AUTO_DRAW_LIMIT_SCORE
      deck_obj.dealing(deck, self)
      calculate
      show_latest_draw
    end
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
  attr_accessor :number_of_cpu

  def initialize
    @number_of_cpu = 0
  end

  # 開始メソッド
  def start_log
    puts 'ブラックジャックを開始します。'
  end

  # 終了メソッド
  def end_log
    puts 'ブラックジャックを終了します。'
    exit
  end

  # CPU人数確認メソッド
  def asking_cpu_num
    while true
      puts 'CPUの参加人数を選んでください(0 - 2)'
      cpu_num_str = gets.chomp
      case cpu_num_str
      when '0', '1', '2'
        puts "CPUは#{cpu_num_str}人です"
        break
      else
        puts '0~2を入力してください'
      end
    end
    @number_of_cpu = cpu_num_str.to_i
  end

  # 勝敗判定メソッド
  def win_or_lose(player_obj, dealer_obj)
    # バースト勝敗判定
    if player_obj.is_bust || dealer_obj.is_bust
      if player_obj.is_bust && dealer_obj.is_bust
        puts "両者バーストです！#{player_obj.name}は引き分けです！"
      elsif player_obj.is_bust
        puts "#{player_obj.name}のバーストです！#{player_obj.name}の負けです！"
      elsif dealer_obj.is_bust
        puts "#{dealer_obj.name}のバーストです！#{player_obj.name}の勝ちです！"
      end

    # 点数勝敗判定
    else
      diff_score_player = BJ_player::BLACKJACK_SCORE - player_obj.score
      diff_score_dealer = BJ_player::BLACKJACK_SCORE - dealer_obj.score
      if diff_score_player < diff_score_dealer
        puts "#{player_obj.name}の勝ちです！"
      elsif diff_score_player == diff_score_dealer
        puts "#{player_obj.name}は引き分けです！"
      elsif diff_score_player > diff_score_dealer
        puts "#{player_obj.name}の負けです！"
      end
    end
  end
end


# 実行部(メインファイルなら以下実行)-----------------------------------------------------------------------
if __FILE__ == $PROGRAM_NAME

  # インスタンス化
  bj_game = Game.new
  deck_obj = Deck.new('bj_deck')
  player = Player.new('Player')
  dealer = Dealer.new('Dealer')

  # BJ開始
  bj_game.start_log
  bj_game.asking_cpu_num

  # CPUを入力の数だけインスタンス化しオブジェクトをcpu_obj_arr配列に格納
  cpu_obj_arr = []
  cpu_obj_num = bj_game.number_of_cpu
  cpu_obj_num.times { |i| cpu_obj_arr << CPU.new("CPU_#{i + 1}") }

  # デッキ配列生成
  bj_deck = deck_obj.deck_making

  # 初期の2枚手札配り(引数:デッキ,参加者obj)
  2.times do
    deck_obj.dealing(bj_deck, player)
    deck_obj.dealing(bj_deck, dealer)
    cpu_obj_arr.each { |cpu| deck_obj.dealing(bj_deck, cpu) }
  end

  # 点数計算
  player.calculate
  dealer.calculate
  cpu_obj_arr.each(&:calculate)

  # 点数とハンド表示
  player.show_hand
  dealer.show_one_hand
  player.show_score

  # ドロー
  player.player_draw(deck_obj, bj_deck) # 入力部
  dealer.dealer_draw(deck_obj, bj_deck)
  cpu_obj_arr.each { |cpu| cpu.cpu_draw(deck_obj, bj_deck) }

  # CPU勝敗判定
  dealer.show_score
  cpu_obj_arr.each do |cpu|
    cpu.show_hand
    cpu.show_score
    bj_game.win_or_lose(cpu, dealer)
  end
  # プレイヤー勝敗判定
  dealer.show_score
  player.show_hand
  player.show_score
  bj_game.win_or_lose(player, dealer)

  # BJ終了
  bj_game.end_log
end

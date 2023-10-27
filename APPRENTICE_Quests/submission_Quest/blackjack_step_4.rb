# frozen_string_literal: true

# Rubocop無視したところ
# 冗長なreturn
# % 記法
# if を式と見立てて代入する手法
# 複雑数やメソッドの文量
# 循環的複雑度超過

# STEP1
# 〇一回しか引けない
# 〇burstしても2重ループ抜けれない
# 〇被りあり
# 〇Dealerの手札隠す

# STEP2
# 〇Aの得点場合分け
#   バーストの判定が現実のBJに近い挙動


# STEP3
# 〇CPUの可変追加
# 〇CPUのインスタンス化、実行
# 〇CPUの挙動

# STEP4
# 〇チップ概念の追加（追加 BJクラス 変数:チップ、
# 〇入力例外処理
# 〇メソッド
#   〇チップshow 〇betshow
#   〇チップ支払いメソッド
# 〇勝敗メソッド分割
# 〇action_statusでサレンダー管理
# 〇win_lose_statusで勝敗管理
# 〇ゲームのループ、loop初期化
# 〇ダブルダウン
# 〇サレンダー

# ダブルダウン
# CPUのチップ管理とベッティングとドローの挙動

# クラス---------------------------------------------------------
# BJ_playerクラス（親クラス）
class BJ_player
  BLACKJACK_SCORE = 21
  AUTO_DRAW_LIMIT_SCORE = 17
  DEFAULT_CHIPS = 1000

  attr_accessor :name, :hand, :score, :chips, :bets, :is_bust, :is_bj, :win_lose_draw_status, :action_status

  def initialize(name)
    # ループしても変更を保持
    @name = name
    @chips = DEFAULT_CHIPS
    # ループ毎に初期化
    @hand = []
    @score = 0
    @bets = 0
    @is_bust = false
    @is_bj = false
    @win_lose_draw_status = nil # :win or :draw or :lose
    @action_status = nil
  end

  # ループ初期化メソッド
  def loop_init
    @hand = []
    @score = 0
    @bets = 0
    @is_bust = false
    @is_bj = false
    @win_lose_draw_status = nil # :win or :draw or :lose
    @action_status = nil
  end

  # 得点計算、バースト判定メソッド
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

  # チップ公開メソッド
  def show_chips
    puts "現在の#{@name}のチップ数は#{@chips}です。"
  end

  # ベット額公開メソッド
  def show_bets
    puts "#{@name}のベット額は#{@bets}です。"
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

  # チップ空ログ
  def chips_empty_log
    puts 'チップが無くなりました！'
  end

  # 勝敗チップ支払いメソッド
  def return_chips
    # 勝敗状態とアクション状態で分岐
    back_chips = 0
    case @win_lose_draw_status
    when :win
      back_chips = @bets * 2
      puts "チップを#{back_chips}獲得しました！"
    when :lose
      case @action_status
      when :surrender
        back_chips = @bets / 2
        puts "サレンダーを選択したのでチップが#{back_chips}返却されました。"
      end
    when :draw
      back_chips = @bets
      puts "引き分けなのでチップが#{back_chips}返却されました。"
    end
    # チップに書き込む
    @chips += back_chips
  end
end

# Playerクラス-----------------------------------------------------------------------
class Player < BJ_player
  # ドロー入力受付メソッド
  def player_draw(deck_obj, deck)
    loop do # スタンド入力 or 21以上までループ
      puts 'アクションを選択してください(t:スタンド, h:ヒット,  p:スプリット（未実装）, 【以下初回のみ】d:ダブルダウン, r:サレンダー'
      action = gets.chomp
      case action
      when 't'
        puts 'スタンドです。'
        break
      when 'h'
        hit(deck_obj, deck)
        break if @is_bj || @is_bust # 21以上でbreak
      when 'd'
        if @hand.length == 2
          double_down(deck_obj, deck)
          break
        else
          puts '初回しかダブルダウン出来ません'
        end
      when 'p' # WIP
        if @hand[0][0] == @hand[1][0] && @hand.length == 2
          # split_pairs()
          puts '未実装です。' # WIP
        else
          puts '初回かペアでないとスプリット出来ません'
        end
      when 'r'
        if @hand.length == 2
          surrender
          break
        else
          puts '初回しかサレンダー出来ません'
        end
      else
        puts '無効な入力です'
      end
    end
  end

  # ヒット
  def hit(deck_obj, deck)
    puts 'ヒットです。'
    deck_obj.dealing(deck, self)
    show_latest_draw
    calculate
    show_score
  end

  # ダブルダウン
  def double_down(deck_obj, deck)
    @chips -= @bets
    @bets *= 2
    puts "ダブルダウンです。bet額を#{@bets}にします。(1度しか引けません)"
    deck_obj.dealing(deck, self)
    show_latest_draw
    calculate
    show_score
  end

  # サレンダー
  def surrender
    puts "サレンダーです。bet額の半額をチップに戻します(#{@bets / 2})"
    @action_status = :surrender
    @win_lose_draw_status = :lose
  end

  # # スプリット
  # def split_pairs(deck_obj, deck)
  #   puts 'スプリットします。'
  #   splited_hand1 = [@hand[0]]
  #   splited_hand2 = [@hand[1]]
  #   deck_obj.dealing(deck, self)
  # end
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
    # ループ毎に初期化
    @used_cards = []
  end

  # ループ初期化
  def loop_init
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
  attr_accessor :name, :number_of_cpu

  def initialize(name)
    @name = name
    @number_of_cpu = 0
  end

  # 開始ログメソッド
  def start_log
    puts 'ブラックジャックを開始します。'
  end

  # 終了ログメソッド
  def end_log
    puts 'ブラックジャックを終了します。'
  end

  # CPU人数確認メソッド
  def asking_cpu_num
    puts 'CPUの参加人数を選んでください(0 ~ 2)'
    cpu_num_str = gets.chomp
    @number_of_cpu = Integer(cpu_num_str) # to_iだと0が返ってしまう
    case @number_of_cpu
    when 0, 1, 2
      puts "CPUは#{@number_of_cpu}人です"
    else
      raise '0~2を入力してください'
    end
  rescue ArgumentError
    puts '0~2を入力してください'
    retry
  rescue StandardError => e
    puts e.message
    retry
  end

  # ベット額確認メソッド
  def asking_bet_values(player_obj)
    loop do
      puts "bet額を指定してください(1 ~ #{player_obj.chips}以下の正の10の倍数)"
      bet_values = gets.chomp.to_i
      # 文字列を整数に変換
      if bet_values <= 0
        raise '正の整数を指定してください'
      end

      if bet_values > player_obj.chips || bet_values % 10 != 0
        raise "手持ちチップの#{player_obj.chips}以下の正の10の倍数の額を指定してください"
      end

      # ここに到達すると、条件をすべて満たしている
      player_obj.bets = bet_values
      player_obj.chips -= bet_values
      break
    rescue ArgumentError
      puts '正の整数を指定してください'
    rescue StandardError => e
      puts e.message
    end
  end

  # 勝敗判定メソッド
  def win_or_lose(player_obj, dealer_obj)
    if player_obj.action_status != :surrender
      if player_obj.is_bust || dealer_obj.is_bust
        handle_bust(player_obj, dealer_obj)
      else
        handle_score(player_obj, dealer_obj)
      end
    end
  end

  # バースト勝敗判定
  def handle_bust(player_obj, dealer_obj)
    if player_obj.is_bust && dealer_obj.is_bust
      puts "両者バーストです！#{player_obj.name}は引き分けです！"
      player_obj.win_lose_draw_status = :draw
    elsif dealer_obj.is_bust
      puts "#{dealer_obj.name}のバーストです！#{player_obj.name}の勝ちです！"
      player_obj.win_lose_draw_status = :win
    elsif player_obj.is_bust
      puts "#{player_obj.name}のバーストです！#{player_obj.name}の負けです！"
      player_obj.win_lose_draw_status = :lose
    end
  end

  # 点数勝敗判定
  def handle_score(player_obj, dealer_obj)
    diff_score_player = BJ_player::BLACKJACK_SCORE - player_obj.score
    diff_score_dealer = BJ_player::BLACKJACK_SCORE - dealer_obj.score
    if diff_score_player < diff_score_dealer
      puts "#{player_obj.name}の勝ちです！"
      player_obj.win_lose_draw_status = :win
    elsif diff_score_player == diff_score_dealer
      puts "#{player_obj.name}は引き分けです！"
      player_obj.win_lose_draw_status = :draw
    elsif diff_score_player > diff_score_dealer
      puts "#{player_obj.name}の負けです！"
      player_obj.win_lose_draw_status = :lose
    end
  end
end


# 実行部(メインファイルなら以下実行)-----------------------------------------------------------------------
if __FILE__ == $PROGRAM_NAME
  # インスタンス化
  bj_game = Game.new('BJ_game')
  deck_obj = Deck.new('BJ_deck')
  player = Player.new('Player')
  dealer = Dealer.new('Dealer')
  # CPUを入力の数だけインスタンス化しオブジェクトをcpu_obj_arr配列に格納
  cpu_obj_arr = []
  bj_game.asking_cpu_num
  bj_game.number_of_cpu.times { |i| cpu_obj_arr << CPU.new("CPU_#{i + 1}") }

  # MainLoop_start-----------------------------------------------------------------------
  loop do
    bj_game.start_log
    # インスタンス変数一部 ループ開始時初期化
    deck_obj.loop_init
    player.loop_init
    dealer.loop_init
    cpu_obj_arr.each(&:loop_init)

    # デッキ配列生成
    bj_deck = deck_obj.deck_making

    # debug
    player.show_chips
    bj_game.asking_bet_values(player)
    player.show_bets

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

    # チップ支払い
    player.return_chips

    # プレイヤーのチップ有無でbreak
    if player.chips <= 0
      player.chips_empty_log
      break
    end
  end
  # MainLoop_end-----------------------------------------------------------------------

  # BJ終了
  bj_game.end_log
  exit
end

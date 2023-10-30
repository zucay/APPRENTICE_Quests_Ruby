# frozen_string_literal: true

# 自販機
class VendingMachine
  def initialize(name)
    @name = name
    @deposit = 0
    @cup_stock = 100
  end

  # privateメソッド
  def press_manufacturer_name
    if deposit >= 100
      puts(@name)
    else
      puts('100円たまっていません')
    end
  end

  private :press_manufacturer_name

  # 商品ボタン
  def press_button(name)
    if @deposit >= 100

      # サイダ―
      case name
      when 'cider'
        @deposit -= 100
        puts('ｶﾞｺﾝｯ')
        return name

      # コーラ
      when "cola"
        @deposit -= 150
        puts('ｶﾞｺﾝｯ')
        return name


      # コーヒー
      when "hot", "ice"
        if @cup_stock.positive?
          @deposit -= 100
          @cup_stock -= 1
          puts('ｶﾞｺﾝｯ')
          return name
        end

      # スナック
      when "snack"
        @deposit -= 150
        puts('ｶﾞｺﾝｯ')
        return name

      end
    else
      puts "お金が足りません"
    end
  end

  # お金(100円のみ)depositに追加
  def deposit_coin(coin)
    if coin == 100
      @deposit += coin
      puts "100円チャリン #{@deposit}"
    else
      puts("100円を入れてください")
    end
  end

  # cupを追加
  def add_cup(cups)
    @cup_stock += cups
    puts "カップを追加しました"
  end

  # 自販機のdeposit確認
  def show_deposit
    puts "deposit:残り#{@deposit}円"
  end

  # 自販機のcups確認
  def show_cups
    puts "cups:残り#{@cup_stock}個"
  end
end

# モノのクラス
class Item
  def initialize(name)
    @name = name
  end

  def item_name
    return @name
  end

end

class Drink < Item

end

class Coffee < Item

end

class Snack < Item

end


if __FILE__ == $PROGRAM_NAME
  # インスタンス化
  hot_cup_coffee = Coffee.new("hot")
  cider = Drink.new("cider")
  snack = Snack.new("snack")
  vending_machine = VendingMachine.new("サントリー")


  vending_machine.deposit_coin(100)
  vending_machine.deposit_coin(100)

  puts vending_machine.press_button(cider.item_name)

  puts vending_machine.show_deposit


  puts vending_machine.press_button(hot_cup_coffee.item_name)

  puts vending_machine.show_cups
  vending_machine.add_cup(1)
  puts vending_machine.show_deposit

  puts vending_machine.press_button(hot_cup_coffee.item_name)
  vending_machine.deposit_coin(100)
  vending_machine.deposit_coin(100)

  puts vending_machine.press_button(snack.item_name)

  puts vending_machine.show_cups
  puts vending_machine.show_deposit

  # vending_machine.press_manufacturer_name
end

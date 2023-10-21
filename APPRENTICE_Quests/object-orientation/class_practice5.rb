# frozen_string_literal: true

class VendingMachine

  def initialize(name)
    @name = name
    @deposit = 0
    @cup_stock = 100
  end

  def press_manufacturer_name()
    if deposit >= 100
      puts(@name)
    else
      puts("100円たまっていません")
    end
  end

  private :press_manufacturer_name


  def press_button(name)

    if @deposit >= 100
      if name == "cider"
        @deposit -= 100
        puts"ｶﾞｺﾝッ"
        return name
      end

      if name == "cola"
        @deposit -= 150
        puts"ｶﾞｺﾝッ"
        return name
      end

      if name == "hot" || name == "ice"
        if @cup_stock > 0
          @deposit -= 100
          @cup_stock -= 1
          puts"ｶﾞｺﾝッ"
          return name
        end
      end
    else
      puts "お金が足りません"
    end
  end

  def deposit_coin(coin)
    if coin == 100
      @deposit += coin
      #depositに100円追加
      puts "100円チャリン"
      puts @deposit
    else
      puts("100を入れてください")
    end
  end

  def add_cup(cups)
    @cup_stock += cups
    puts "カップを追加しました"
  end

  def show_deposit
    puts "自販機の中のお金#{@deposit}"
  end

  def show_cups
    puts "カップ数#{@cup_stock}"
  end

end

class Item
  def initialize(name)
    @name = name
  end

  def item_name
    return @name
  end

end

class Coffee < Item

end


if __FILE__ == $PROGRAM_NAME
  hot_cup_coffee = Coffee.new("hot")
  cider = Item.new("cider")

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

  puts vending_machine.show_cups
  puts vending_machine.show_deposit

  # vending_machine.press_manufacturer_name
end

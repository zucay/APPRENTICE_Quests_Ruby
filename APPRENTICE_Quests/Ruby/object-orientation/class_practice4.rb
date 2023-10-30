# frozen_string_literal: true

class VendingMachine
  def initialize(name)
    @name = name
    @deposit = 0
  end

  def press_manufacturer_name()
    if deposit >= 100
      puts(@name)
    else
      puts("100円たまっていません")
    end
  end

  private:press_manufacturer_name


  def press_button(name)

    if @deposit >= 100
      if name == "cider"
        @deposit -= 100
        return "cider"
      end

      if name == "cola"
        @deposit -= 150
        return "cola"
      end
    end
  end

  def deposit_coin(coin)
    if coin == 100
      @deposit += coin
      #depositに100円追加
    else
      puts("100を入れてください")
    end
  end


end

class Item
  def initialize(name)
    @item_name = name
  end

  def item_name
    return @item_name
  end

end



if __FILE__ == $PROGRAM_NAME
  item = Item.new("cola")

  vending_machine = VendingMachine.new("santory")

  vending_machine.deposit_coin(100)
  puts vending_machine.press_button(item.item_name)

  vending_machine.deposit_coin(100)
  puts vending_machine.press_button(item.item_name)
  # vending_machine.press_manufacturer_name
end

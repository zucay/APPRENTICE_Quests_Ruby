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

  def press_button()
    if @deposit >= 100
      @deposit -= 100
      return "cyder"
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

if __FILE__ == $PROGRAM_NAME
  vending_machine = VendingMachine.new("santory")
  puts vending_machine.press_button

  vending_machine.deposit_coin(150)
  puts vending_machine.press_button

  vending_machine.deposit_coin(100)
  puts vending_machine.press_button

  vending_machine.press_manufacturer_name
end

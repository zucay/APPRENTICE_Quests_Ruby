# frozen_string_literal: true

class VendingMachine
  def initialize(name)
    @name = name

  end

  def press_manufacturer_name()
    puts(@name)
  end

  def press_button()
    puts("cyder")

  end
end

if __FILE__ == $PROGRAM_NAME
  vending_machine = VendingMachine.new("santory")
  vending_machine.press_manufacturer_name
end

# frozen_string_literal: true


class VendingMachine

  def press_button()
    puts("cyder")

  end
end

if __FILE__ == $PROGRAM_NAME
  vending_machine = VendingMachine.new
  vending_machine.press_button
end

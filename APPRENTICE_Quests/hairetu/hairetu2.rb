# frozen_string_literal: true

# 整数配列の要素を2乗した配列を返す
def square(int_arr)
  return int_arr.map{|n| n**2}
end


if __FILE__ == $PROGRAM_NAME
  squared_numbers = square([5, 7, 10])
  print(squared_numbers)
end

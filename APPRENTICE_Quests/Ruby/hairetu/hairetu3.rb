def select_even_numbers(numbers)
  #出力:偶数
  numbers.select {|num| num % 2 == 0}
end


if __FILE__ == $PROGRAM_NAME
  sam_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  print(select_even_numbers(sam_arr))
end

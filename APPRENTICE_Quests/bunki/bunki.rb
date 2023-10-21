# frozen_string_literal: true

a = gets.chomp
b = gets.chomp
a = a.to_i
b = b.to_i

def greater(x, y)
  if x > y
    puts("x > y")
  elsif x < y
    puts("x < y")
  elsif x == y
    puts("x == y")
  end
end

greater(a, b)

def calculate(num1, num2, operator)
  case operator
      when "+" then
          return num1 + num2
      when "-" then
          return num1 - num2
      when "*" then
          return num1 * num2
      when "/" then
          return num1 / num2
      else
          return "該当なし"
  end
end

puts "1番目の数字を入れてください"
num1 = gets.chomp.to_i
puts "2番目の数字を入れてください"
num2 = gets.chomp.to_i
puts "演算子を入力してくだい(+、-、*、/ )"
operator = gets.chomp


begin
  result = calculate(num1,num2,operator)
  puts result

rescue NoMethodError => e
  puts e
rescue ZeroDivisionError
  puts "ゼロによる割り算は許可されていません"
end

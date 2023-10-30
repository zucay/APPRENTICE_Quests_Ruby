
# 例外処理とは
# 例外が発生した際に、その内容に応じて実行される処理のこと。

# 利点
# ・違うデータが引数に渡されて大規模な処理をしようとする際に全て実行される前に処理を止めたり、
# 逆にプログラムを例外で止めることなく通常通り進めたりなど
# ・例外に対する処理を一元管理できるようになる
# ・どこでどういうエラーが起きたか判別しやすくなる

def calculate(num1, num2, operator)

  case operator
  when "+"
    result = num1 + num2
  when "-"
    result = num1 - num2
  when "*"
    result = num1 * num2
  when "/"
    result = num1 / num2
  else
    result = "演算子には +、-、、/ のいずれかを使用してください"
  end

  return result

end


if __FILE__ == $PROGRAM_NAME
  begin
    puts "1番目の整数を入力してください:"
    num1 = gets.chomp
    fail ArgumentError unless num1 =~ /^\-*[0-9]+$/
    num1 = num1.to_i

    puts "2番目の整数を入力してください:"
    num2 = gets.chomp
    fail ArgumentError unless num2 =~ /^\-*[0-9]+$/
    num2 = num2.to_i    #ここでto_fにしてデータ型をfloatにしてしまうとinstance_of?(Integer)で整数型判定されない

    puts "演算子(+, -, *, /)を入力してください:"
    operator = gets.chomp

    puts calculate(num1, num2, operator)


  rescue ZeroDivisionError
    puts "ゼロによる割り算は許可されていません"
  rescue ArgumentError
    puts "num1、 num2 には整数を入力してください"

  end

end

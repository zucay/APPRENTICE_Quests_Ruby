def sum_1_100(n)
  sum = 0
  for i in 1..n
    sum += i
  end
  puts(sum)
  # 1 から 100 までの足し算の結果を出力
end

def sum(x, y)
  sum = 0
  for i in x..y
    sum += i
  end
  puts(sum)
end

def fibonacci(n)
  if n == 0
    return 0
  elsif n == 1
    return 1
  elsif n >= 2
    return fibonacci(n-1) + fibonacci(n-2)
  end
  #出力：整数 n に対して、n 日間お手伝いを継続した時のお小遣いの金額を算出
end


if __FILE__ == $PROGRAM_NAME
  # sum_1_100(100)

  # sum(10, 80)

  puts(fibonacci(10))
end

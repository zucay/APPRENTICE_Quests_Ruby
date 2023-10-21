def hello()
  for _ in 0..99
    puts("こんにちは！")
  end
end



def sheep(n)
  for i in 1..n
    puts("羊が#{i}匹")
  end
  #出力：羊の数　羊が〇匹
end

def sum_1_100()
  # 1 から 100 までの足し算の結果を出力
end


# if __FILE__ == $PROGRAM_NAME
#   # hello()

#   # N = gets.chomp
#   # N = N.to_i
#   # sheep(N)

# end

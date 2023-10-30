def print_names(names)
  #引数namesは配列
  #配列 eachメソッドとwith_indexメソッドを使う
  names.each_with_index do |val, i|
    puts("#{i}. #{val}")
  end
end




if __FILE__ == $PROGRAM_NAME
  print_names(['上田', '田仲', '堀田'])
end

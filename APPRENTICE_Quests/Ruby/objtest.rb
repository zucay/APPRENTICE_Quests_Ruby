

# class User

# end

# # user = User.new
# # puts user.to_s
# # puts user.nil?

# # puts User.superclass
# # # p user.methods
# # p user.instance_of?(User)
# # p user.instance_of?(String)

# # p "--------------"
# # p user.is_a?(Object)
# # p user.is_a?(User)
# # p user.is_a?(BasicObject)

# # p user.is_a?(String)
# # p BasicObject.superclass
# arr = [1,2,3,4,5]
# puts arr.join(" ")

# ベット額確認メソッド


# プレイヤーのチップ数を設定
# player = Player.new
# player.chips = 100

# # ベット額を確認
# asking_bet_values(player)
# puts "ベット額: #{player.bets}"
# # puts "残りのチップ: #{player.chips}"
# t1 = true
# t2 = true
# f1 = false
# puts (!f1 || t1)
# puts (not f1 || t1)
# puts (t1 || t2 && f1)

# puts (t1 or t2 and f1)

# $a = 1

# def inner
#   b = 2
#   print($a + b)
# end

# inner

# Ruby

# class Person
#   a = 1
#   attr_accessor :name

#   def initialize(name)
#     @name = name
#   end

#   # もしくはここで外部からの参照メソッド
#   def caluc
#     b = 2
#     return a + b
#   end
# end

# taro_obj = Person.new('taro')
# puts taro_obj.name

# s = "sample"
# # s.freeze
# s[0] = "S"
# print(s)


# def outer
#   a = 1
#   def inner
#     b = 2
#     print(a + b)
#   end

#   inner
# end

# def add(a, b)
#   a + b # return書かない
# end

# puts add(1, 2)



# a = 2
# if 0 < a < 3
#   puts a
# end

# if 0 < a && a < 3
#   puts a
# end

# sum = 0
# for i in 0...4
#   sum += i
# end

# puts sum
# puts i

# for文の中で作成したローカル変数、ループ変数がfor文の外でも使えてしまう。
#   ```ruby:Ruby
#   sum = 0
#   for i in 0...4
#     sum += i
#   end

#   puts i
#   # => 3
#   ```

arr_a = [1, 2, 3, 4]
arr_b = [3, 4]
diff_arr = arr_a - arr_b
p diff_arr

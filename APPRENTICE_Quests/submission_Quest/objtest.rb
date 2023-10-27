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
player = Player.new
player.chips = 100

# ベット額を確認
asking_bet_values(player)
puts "ベット額: #{player.bets}"
puts "残りのチップ: #{player.chips}"

# 今回の最終的な仕様のプログラムを、何も見ずに一から作成してください。以下の点に注意してください。

# 今まで作成したプログラムは見ずに作成してください
# 回答例やサンプルインプット、サンプルアウトプットも見ずに作成してください
# 何も見ずに自分で一から設計することで、オブジェクト指向の理解をより確かなものにすることが狙いです。トライしてみてください。

# 自動販売機
# 条件
# コーラ、サイダー、カップコーヒー(アイス、ホット)、ポテチが購入できる自動販売機
# コーラ150円、サイダー100円、カップコーヒー100円、ポテチ150円
# お金は100円しか対応しておらず１枚ずつしか入らない
# 商品以上のお金が、自販機内に入っている状態でボタンが押されると購入できる
# コーヒーはアイスかホットが選べ、カップとセットしていないと購入できない
# カップは最大100個、自販機内に保存されている

class VendingMachine
    # 初期値
    def initialize(campany)
        @campany = campany
        # cash
        @deposit = 0
        # cup
        @cup_inventory = 0
        @cup_storage = 100
    end

    # 入金
    def deposit_coin(coin)
        if coin == 100
            @deposit += coin
        else
            puts "100円以外には対応していません"
        end
    end

    # ボタン
    def press_button(item)
        if item.style = "cup" && @cup_inventory > 0 && @deposit >= item.price
            @deposit -= item.price
            @cup_inventory -= 1
            return item.name
        elsif item.style != "cup" && @deposit >= item.price
            @deposit -= item.price
            return item.name
        end
    end

    # カップを追加
    def add_cup(cup)
        if @cup_storage > 0
            @cup_inventory += cup
            @cup_storage -= cup
        end
    end



end

class Item
    attr_accessor :name, :price, :style
end

class Drink < Item
    @@drink_list = {
        "cola" => {name: "cola", price: 150, style: "can"},
        "cider" => {name: "cider", price: 100, style: "can"}
    }

    def initialize(item_name)
        if @@drink_list.key?(item_name)
            item_info = @@drink_list[item_name]
            self.name = item_info[:name]
            self.price = item_info[:price]
            self.style = item_info[:style]

        else
            puts "存在しません"
        end
    end
end

class Cup_coffee < Item

    @@coffee_list = {
        "hot" => {name: "hot", price: 100, style: "cup"},
        "ice" => {name: "ice", price: 100, style: "cup"}
    }

    def initialize(item_name)
        if @@coffee_list.key?(item_name)
            item_info = @@coffee_list[item_name]
            self.name = "#{item_info[:name]} cup coffee"
            self.price = item_info[:price]
            self.style = item_info[:style]
        else
            puts "存在しません"
        end
    end
end

class Snack < Item
    @@snack_list = {
        "snack" => {name: "potato chips", price: 150, style: "snack"}
    }

    def initialize(item_name)
        if @@snack_list.key?(item_name)
            item_info = @@snack_list[item_name]
            self.name = item_info[:name]
            self.price = item_info[:price]
            self.style = item_info[:style]

        else
            puts "存在しません"
        end
    end
end


# インプット
select_drink = Drink.new("cola")
select_coffee = Cup_coffee.new("hot")
select_snack = Snack.new("snack")
vending_machine = VendingMachine.new("santry")

vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)
vending_machine.deposit_coin(100)


vending_machine.add_cup(2)

puts vending_machine.press_button(select_drink)
puts vending_machine.press_button(select_coffee)
puts vending_machine.press_button(select_coffee)
puts vending_machine.press_button(select_snack)

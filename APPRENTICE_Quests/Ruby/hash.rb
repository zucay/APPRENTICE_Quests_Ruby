# #ハッシュと配列のちがい
# ハッシュは辞書型
# ”キー”とそれに一対一で対応する”値”が存在する
# 配列は要素のインデックス番号（int）を使って要素を呼び出していたが、
# ハッシュはキーとなる文字列を使って呼び出す
# ハッシュはIDなどを用いたデータ管理など、呼び出したいデータの種類がどういうものか分かっているときに使う excel的にはタテ列 column
# 配列は同じデータ型を並びに意味を持たせたいときに使う excel敵には横行 row

def print_capitals(capitals)
  #{国名}の首都は#{首都名}です
  capitals.each do |key, val|
    puts("#{key}の首都は#{val}です")
  end
end


if __FILE__ == $PROGRAM_NAME
  sam_caps = { '日本' => '東京', 'アメリカ' => 'ワシントンD.C.' }
  print_capitals(sam_caps)
end

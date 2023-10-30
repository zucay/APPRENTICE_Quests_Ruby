# シンボルとは何か
# ・文字列を省略した書き方
# 文字列と何が違うのか
# ・コーテーションで囲まずに文字列の先頭に:を書く
# シンボルがよく使われる用途
# ・楽になるげ限定的、ハッシュのキー





def convert_currency(amount, source_currency, target_currency, conversion_rates)
  # 引数として金額、変換元の通貨、変換先の通貨を受け取り、変換後の金額を出力
  # USDの倍率かけて 変換先の倍率を掛ける
  sum_target_currency = amount / (conversion_rates[source_currency]) *(conversion_rates[target_currency])
  puts(sum_target_currency)


end

if __FILE__ == $PROGRAM_NAME
  conversion_rates = {
  usd: 1.0,
  jpy: 110.0,
  eur: 0.8
}
  convert_currency(100, :usd, :jpy, conversion_rates)
end

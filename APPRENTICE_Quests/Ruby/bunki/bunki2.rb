# frozen_string_literal: true

# age = gets.chomp
# age = age.to_i

def train_fare(age)
  if age >= 12
    puts("200")
  elsif 6 <= age and age < 12
    puts("100")
  else
    puts("0")
  end

end

train_fare(12)
train_fare(6)
train_fare(5)

# frozen_string_literal: true

def xor(x, y)
  if x == true && y == true
    return(false)
  end
  if x == true && y == false
    return(true)
  end
  if x == false && y == true
    return(true)
  end
  if x == false && y == false
    return(false)
  end

end

puts(xor(true, true))
puts(xor(true, false))
puts(xor(false, true))
puts(xor(false, false))

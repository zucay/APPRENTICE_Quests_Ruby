seconds  = gets
seconds = seconds.to_i

def time(t)
  hour = t / 3600
  left_second = t % 3600
  minute = left_second / 60
  second = left_second % 60
  puts "#{hour}\:#{minute}\:#{second}"


end

time(seconds)

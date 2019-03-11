numbers = []

File.open("dayone.input").each_line do |line|
  numbers << line.to_i
end

puts numbers.sum

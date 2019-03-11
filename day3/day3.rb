require "pry-byebug"
array = []
File.open("day3.input").each_line do |line|
  array << line.scan(/\d+/)[1..-1].map(&:to_i)
end
numbers = []
array.each do |element|
  start_point = (element[1] * 1_000 + element[0]) + 1_000
  number = start_point.clone
  x_axis_numbers = [start_point]
  (element[2] - 1).times do
    x_axis_numbers << number += 1
  end
  start_numbers = x_axis_numbers.clone
  all_numbers = x_axis_numbers

  (1..(element[3]-1)).each do |num|
    modifier = 1000 * num
    all_numbers += start_numbers.map { |x| x + modifier }
  end
  numbers << all_numbers
end

all = numbers.join(",").split(",")
all_hash = Hash.new(0)
all.each do |nr|
  all_hash[nr.to_sym] += 1
end

single_patches = []

all_hash.each do |key, value|
  single_patches << key.to_s.to_i if value == 1
end

numbers.each_with_index do |array, idx|
  p idx if array.all? { |number| single_patches.include?(number) }
end
# require "pry-byebug"
# array = []
# File.open("day3.input").each_line do |line|
#   array << line.scan(/\d+/)[1..-1].map(&:to_i)
# end
# numbers = []
# array.each do |element|
#   start_point = (element[1] * 1_000 + element[0]) + 1_000
#   number = start_point.clone
#   x_axis_numbers = [start_point]
#   (element[2] - 1).times do
#     x_axis_numbers << number += 1
#   end
#   start_numbers = x_axis_numbers.clone
#   all_numbers = x_axis_numbers

#   (1..(element[3]-1)).each do |num|
#     modifier = 1000 * num
#     all_numbers += start_numbers.map { |x| x + modifier }
#   end
#   numbers << all_numbers
# end

# all = numbers.join(",").split(",")
# all_hash = Hash.new(0)
# all.each do |nr|
#   all_hash[nr.to_sym] += 1
# end
# amount = 0
# all_hash.each_value do |value|
#   amount += 1 if value > 1
# end

# puts amount

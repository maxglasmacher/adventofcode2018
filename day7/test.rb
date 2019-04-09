# TEST_ARRAY = [1, 2, 3]

# p TEST_ARRAY

# TEST_ARRAY.each_with_index do |letter, idx|
#   TEST_ARRAY[idx] = 20 if letter == 2
# end

# p TEST_ARRAY

# def find_number(number)
#   correct = []
#   TEST_ARRAY.each do |element|
#     correct << element if element == number
#   end
#   correct.join.to_i
# end

# p find_number(3)

def order_weight(strng)
  weights = Hash.new
  duplicates = []
  strng.split(" ").each do |weight|
    sum = 0
    (0...weight.chars.length).to_a.each do |idx|
      sum += weight.chars[idx].to_i
    end
    if !weights[weight].nil?
      duplicates << weight
    else
      weights[weight] = sum
    end
  end
  weights_by_integer_sum = weights.group_by { |k,v| v }

  weights_by_integer_sum.keys.each do |k|
    value = []
    weights_by_integer_sum[k].each do |array|
      value << array[0]
    end
    weights_by_integer_sum[k] = value.sort
  end

  final = weights_by_integer_sum.sort.each { |a| a.delete_at(0) }.flatten

  duplicates.each do |d|
    final.insert(final.index(d), d)
  end

  final.join(" ")
end

p order_weight("2000 10003 1234000 44444444 9999 11 11 22 123")






TEST_ARRAY = [1, 2, 3]

p TEST_ARRAY

TEST_ARRAY.each_with_index do |letter, idx|
  TEST_ARRAY[idx] = 20 if letter == 2
end

p TEST_ARRAY

def find_number(number)
  correct = []
  TEST_ARRAY.each do |element|
    correct << element if element == number
  end
  correct.join.to_i
end

p find_number(3)

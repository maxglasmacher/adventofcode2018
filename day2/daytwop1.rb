require "pry-byebug"

strings_array = []

File.open('daytwop1.file').each_line do |line|
  strings_array << line.chop
end

# sum_one = 0
# sum_two = 0

# strings_array.each do |array|
#   main_hash = Hash.new(0)

#   array.each do |letter|
#     main_hash[letter] += 1
#   end
#   sum_two += 1 if main_hash.value?(3)
#   sum_one += 1 if main_hash.value?(2)
# end
# p "#{sum_one * sum_two}"


#iterate through each word
#for each word iterate through the words above that word
#for each one of these words compare the letters
#each time you have a different letter count increases by 1
#continue loop while count < 2 elsif count == 25 break the loop and puts both words

strings_array.each_with_index do |word, idx1|
  (idx1 + 1...strings_array.length).to_a.each do |idx2|
    count = 0
      while count < 2
        (0...25).to_a.each do |idx3|
          count += 1 if word[idx3] != strings_array[idx2][idx3]
          break if count > 1
          puts "#{word}, #{strings_array[idx2]}" if idx3 == 24
        end
      end
  end
end
revtaubfniyhsgxdoajwkqilp,
revtaubfniyhpsgxdoajwkqilp



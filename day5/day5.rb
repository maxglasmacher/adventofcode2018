require "pry-byebug"
array = []

File.open("day5.input").each_line do |line|
  array << line.chop
end

string = array.join

string_main = array.join

# string = "dabAcCaCBAcCcaDA"

# string_main = "dabAcCaCBAcCcaDA"
p string

pattern_one = /Aa|Bb|Cc|Dd|Ee|Ff|Gg|Hh|Ii|Jj|Kk|Ll|Mm|Nn|Oo|Pp|Qq|Rr|Ss|Tt|Uu|Vv|Ww|Xx|Yy|Zz|aA|bB|cC|dD|eE|fF|gG|hH|iI|jJ|kK|lL|mM|nN|oO|pP|qQ|rR|sS|tT|uU|vV|wW|xX|yY|zZ|/
patterns = [/[Aa]/, /[Bb]/, /[Cc]/, /[Dd]/, /[Ee]/, /[Ff]/, /[Gg]/, /[Hh]/, /[Ii]/, /[Jj]/, /[Kk]/, /[Ll]/, /[Mm]/, /[Nn]/, /[Oo]/, /[Pp]/, /[Qq]/, /[Rr]/, /[Ss]/, /[Tt]/, /[Uu]/, /[Vv]/, /[Ww]/, /[Xx]/, /[Yy]/, /[Zz]/]
patterns_hash = Hash.new(0)

patterns.each do |pattern_two|
  string.gsub!(pattern_two, "")
  length_start = 0
  length_end = 1
  p string.match(pattern_two)
  until length_start == length_end
    length_start = string.length
    string.gsub!(pattern_one, "")
    length_end = string.length
  end
  p string
  p string.length
  patterns_hash[pattern_two] = string.length
  string = string_main.clone
end

p patterns_hash



# length_start = 0
# length_end = 1

# until length_start == length_end
#   length_start = string.length
#   string.gsub!(pattern, "")
#   length_end = string.length
# end



# 5330

# until start_length == end_length
#   start_length = string.length
#     string.each_with_index do |letter, idx|
#       if letter.downcase == previous_letter.downcase && letter != previous_letter
#         string.delete_at(idx)
#         string.delete_at(idx - 1)
#       else
#         previous_letter = letter
#       end
#     end
#   end_length = string.length
# end




# while count < string.length
#   if string[count].downcase == previous_letter.downcase && string[count] != previous_letter
#     idx_now = string.index(string[count])
#     idx_previous = string.index(previous_letter)
#     p string[count] if string.count < 30
#     p previous_letter if string.count < 30
#     p idx_now if string.count < 30
#     p idx_previous if string.count < 30
#     string.delete_at(idx_previous)
#     string.delete_at(idx_previous)
#     previous_letter = string.first
#     count = 0
#     p string.count if string.count < 30
#     p string if string.count < 30
#   else
#     previous_letter = string[count]
#     count += 1
#   end
# end



# length_start = 1
# length_end = 2

# while length_start != length_end
#   length_start = string.length
#   p string.length
#   running = true
#   while running
#     string.each_with_index do |letter, idx|
#       if letter.downcase == previous_letter.downcase && letter != previous_letter
#         string.delete_at(idx)
#         string.delete_at(idx - 1)
#         length_end = string.length
#         running = false
#       else
#         previous_letter = letter
#       end
#     end
#   end
# end

# p string.length

# p string.join



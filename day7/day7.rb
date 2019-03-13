require "pry-byebug"
array = []

File.open("day7.input").each_line do |line|
  array << line.chop
end

instructions = array.map { |instruction| Array.new(2) { |i| instruction.match(/(\s\w\s)\D+(\s\w\s)/)[i + 1].strip } }

# INITIALIZE GRID

grid = Hash.new

instructions.each do |instruction|
  if !grid[instruction[1]].nil?
    grid[instruction[1]] << instruction[0]
  else
    grid[instruction[1]] = ["#{instruction[0]}"]
  end
end

p grid

# FIND STARTERS: ["R", "N", "C", "F"]
start = []

instructions.each do |instruction_one|
  starter = true
  instructions.each do |instruction_two|
    starter = false if instruction_two[1] == instruction_one[0]
  end
  start << instruction_one[0] if starter
end

starting_points = start.uniq

# p starting_points

# FIND ENDINGS: ["E"]

endings = []

instructions.each do |instruction_one|
  ending = true
  instructions.each do |instruction_two|
    ending = false if instruction_two[0] == instruction_one[1]
  end
  endings << instruction_one[1] if ending
end

endinging_points = endings.uniq

# p endinging_points

# have an array of activated letters, to check which letter can be
#activated next(all required letters need to preexist, and it needs to come
#in alphabet before other options)


#2:
# have an options array listing letters that can come next in activation
# each time letter is activated, new options are generated if all required letters preexist

# HOW?
# search through grid all letters, which only require activated letter are new options.
# Once you have all options, earliest in alphabet is added to validated array
# and new options  are generated

# OPTIONS UPDATE SHOULD NOT CHANGE IF NEXT LETTER DOES NOT HAVE ALL PREEXISTING LETTERS YET!


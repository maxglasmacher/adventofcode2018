require "pry-byebug"
require_relative "letter.rb"

array = []

File.open("day7.input").each_line do |line|
  array << line.chop
end

INSTRUCTIONS = array.map { |instruction| Array.new(2) { |i| instruction.match(/(\s\w\s)\D+(\s\w\s)/)[i + 1].strip } }

# INITIALIZE GRID

GRID = Hash.new

INSTRUCTIONS.each do |instruction|
  if !GRID[instruction[1]].nil?
    GRID[instruction[1]] << instruction[0]
  else
    GRID[instruction[1]] = ["#{instruction[0]}"]
  end
end







# p INSTRUCTIONS

# p GRID

# # p INSTRUCTIONS.flatten.uniq.length

# # FIND STARTERS: ["R", "N", "C", "F"]
# start = []

# INSTRUCTIONS.each do |instruction_one|
#   starter = true
#   INSTRUCTIONS.each do |instruction_two|
#     starter = false if instruction_two[1] == instruction_one[0]
#   end
#   start << instruction_one[0] if starter
# end

# starting_points = start.uniq

# # p starting_points

# # FIND ENDINGS: ["E"]

# endings = []

# INSTRUCTIONS.each do |instruction_one|
#   ending = true
#   INSTRUCTIONS.each do |instruction_two|
#     ending = false if instruction_two[0] == instruction_one[1]
#   end
#   endings << instruction_one[1] if ending
# end

# ending_points = endings.uniq

# # p endinging_points

# # CREATING ORDER FOR STEPS

# ACTIVATED = ["C"]
# OPTIONS = ["N", "R", "F"]

# # GRID DOESNT CONTAIN 4 STARTING POINTS!! THEY HAVE NO BEFORE!
# # p GRID.keys.length
# # p GRID.keys
# # p GRID

# def find_options
#   GRID.each do |letter, before_array|
#     if !ACTIVATED.include?(letter) && !OPTIONS.include?(letter) && (before_array - ACTIVATED).empty?
#       OPTIONS << letter
#     end
#   end
# end

# def validate_options
#   next_letter = OPTIONS.sort.first
#   ACTIVATED << next_letter
#   OPTIONS.delete(next_letter)
# end

# until ACTIVATED.length == 26
#   find_options
#   validate_options
#   p ACTIVATED.join
# end








# have an array of activated letters, to check which letter can be
#activated next(all required letters need to preexist, and it needs to come
#in alphabet before other options)

#2:
# have an options array listing letters that can come next in activation
# each time letter is activated, new options are generated if all required letters preexist

# HOW?
# search through GRID all letters, which only require activated letter are new options.
# Once you have all options, earliest in alphabet is added to validated array
# and new options  are generated

# OPTIONS UPDATE SHOULD NOT CHANGE IF NEXT LETTER DOES NOT HAVE ALL PREEXISTING LETTERS YET!

# PART 2

ALPHABET = ("a".."z").to_a

ALL_LETTERS = []

TIME_ACTIVATED = []

WORKING_ON_ARRAY = ["n", "r", "f", "c"]

TIME_OPTIONS = []

# INITIALIZE LETTERS

("a".."z").to_a.each do |letter|
  l = Letter.new(letter: letter, left_time: 60 + ALPHABET.index(letter) + 1 )
  ALL_LETTERS << l
end

# HELPER

def find_letter(letter)
  correct = []
  ALL_LETTERS.each do |instance|
    correct << instance if instance.letter == letter
  end
  correct[0]
end

# METHODS

# UPDATE OPTIONS NOT WORKING!

def update_options
  GRID.each do |letter, before_array|
    TIME_OPTIONS << letter.downcase if !TIME_ACTIVATED.include?(letter.downcase) && !WORKING_ON_ARRAY.include?(letter.downcase) && !TIME_OPTIONS.include?(letter.downcase) && (before_array.map(&:downcase) - TIME_ACTIVATED).empty?
  end
  TIME_OPTIONS.sort!
  p TIME_OPTIONS
end

def refill_working_on
  (4 - WORKING_ON_ARRAY.count).times do
    if !TIME_OPTIONS[0].nil?
      WORKING_ON_ARRAY << TIME_OPTIONS[0]
      TIME_OPTIONS.delete_at(0)
    end
  end
  WORKING_ON_ARRAY.each do |l|
    p "#{find_letter(l).letter}, #{find_letter(l).left_time} seconds"
  end
end

def update_time(activated_letter, array)
  array.each do |instance|
    instance.left_time -= activated_letter.left_time
  end

end

def convert_working_on_array
  correct_array = []
  WORKING_ON_ARRAY.each do |letter|
    correct_array << find_letter(letter)
  end
  # p correct_array
  correct_array
end

# WARNING WITH DOWNCASE!!!!

time = 0

until TIME_ACTIVATED.length == 26

  # binding.pry
  update_options
  refill_working_on
  quickest_finished = convert_working_on_array.sort_by { |obj| obj.left_time }.first

    TIME_ACTIVATED << quickest_finished.letter
    WORKING_ON_ARRAY.delete(quickest_finished.letter)
    update_time(quickest_finished, convert_working_on_array)
    time += quickest_finished.left_time

  # binding.pry
  p TIME_ACTIVATED.join
  p time

end

p time


# TIME not added successfully


# PLAN

# Have a "seconds" count (time variable)
# Add these to the working_on_array
# each letter has a time_left attribute
# loop until activated.length == 26
# sort working_on_array, first letter is added to activated, UPDATE_TIMINGS, update options, refill working_on

# update options method:
# letters that are not in options/activated/working_on_array

# refill_working_on method:
# 4 - working_on_array.count do take the first of sorted options into working_on_array
# unless not present

# find_next_done method:
#


# update_time method:



# each time a letter is added to activated_array, 1. its time_left is added to
# time (Create letter class with time_left), 2. the time_left of that
# letter is subtracted from the members of the working_on_array (update_time method), 3. the
# options_array is updated, 4. the working on array is re-filled (update_working_on)

# each time new letter is activated update the options




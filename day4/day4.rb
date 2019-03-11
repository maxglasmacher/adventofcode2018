require "pry-byebug"
require "time"

array = []

File.open("day4.input").each_line do |line|
  array << line.chop
end
array.sort!
hash_of_guard_hashes = Hash.new(0)
current_guard_hash = nil
falls_asleep = []
wakes_up = []

array.each do |guard_row|
  match_data = guard_row.match(/(\d+):(\d+)\] (.*)/)
  if match_data[3].match(/Guard (#\d*) begins shift/) != nil
    sleeping_range_array = []
    falls_asleep.each_with_index do |sleep_minute, idx|
      range = (sleep_minute...wakes_up[idx])
      sleeping_range_array << range
    end
    if hash_of_guard_hashes.key?(current_guard_hash)
      hash_of_guard_hashes[current_guard_hash] << sleeping_range_array
    else
      hash_of_guard_hashes[current_guard_hash] = []
    end
    falls_asleep = []
    wakes_up = []
    guard_id = match_data[3].match(/Guard #(\d*) begins shift/)[1].to_i
    current_guard_hash = guard_id
  elsif match_data[3].match(/falls asleep/) != nil
    falls_asleep << match_data[2].to_i
  elsif match_data[3].match(/wakes up/) != nil
    wakes_up << match_data[2].to_i
  end
end

hash_of_guard_hashes.delete(nil)

hash_of_guard_hashes.each_value do |value|
  value.flatten!
end

hash_of_guard_hashes.each do |key, value|
  minutes = Hash.new(0)
  value.each do |range|
    range.each do |nr|
      minutes[nr] += 1
    end
  end
  hash_of_guard_hashes[key] = minutes
end
#find guard that sleeps the most, on what minute?
guards = []

hash_of_guard_hashes.each do |key, value|
  guard_info = []
  guard_info << key
  sum = 0
  value.each_value do |minutes|
    sum += minutes
  end
  guard_info << sum
  guards << guard_info
end
#[3557, 484] is biggest one
#16 times asleep on  minute 30

#PART 2: which guard is most frequently asleep on the same minute?

guards_amount_of_sleep_on_minute = []

hash_of_guard_hashes.each do |key, value|
  p key
  guard_info = []
  pair = value.max_by{ |k, v| v }
  guard_info << pair
  guard_info << key
  guards_amount_of_sleep_on_minute << guard_info
end

p guards_amount_of_sleep_on_minute
p hash_of_guard_hashes[269]

#[[39, 16], 269], [[30, 16], 3557]

#iterate over all rows
#match_data = guard_row.match(/(\d+):(\d+)] (.+)/)
#if match_data[3].match?(/Guard #(\d+) begins shift/)
#before stroing new guards id, take old id and wakes up and falls asleeparray and add minutes to that guard
#then match_data[3].match(/Guard #(\d+) begins shift/)[1].to_i is guard id
#then set id equal to that guard's id
#elseif match group 3 is falls asleep store in falls_asleep the minute
#elseif match group 3 is wakes up store in wakes_up the minute
#if group 3 match on Guard #(\d+) begins shift, check hash existence...
#if #NR field is a number, if guard hash already exists, add minutes of sleep to him
#if not exist yet, create new guard hash
#elseif = "falls asleep" HASH of that #NR create (0..25-5) add mins



#iterate over minute range asleep and add to hash, each minute and how often asleep on that minute


# [1518-11-01 00:00] Guard #10 begins shift
# [1518-11-01 00:05] falls asleep
# [1518-11-01 00:25] wakes up
# [1518-11-01 00:30] falls asleep
# [1518-11-01 00:55] wakes up
# [1518-11-01 23:58] Guard #99 begins shift
# [1518-11-02 00:40] falls asleep
# [1518-11-02 00:50] wakes up
# [1518-11-03 00:05] Guard #10 begins shift
# [1518-11-03 00:24] falls asleep
# [1518-11-03 00:29] wakes up
# [1518-11-04 00:02] Guard #99 begins shift
# [1518-11-04 00:36] falls asleep
# [1518-11-04 00:46] wakes up
# [1518-11-05 00:03] Guard #99 begins shift
# [1518-11-05 00:45] falls asleep
# [1518-11-05 00:55] wakes up

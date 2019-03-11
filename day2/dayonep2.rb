numbers = []
File.open("dayonep2.input").each_line do |line|
  numbers << line.to_i
end

sum = 0
different_sums = {}
running = true
while running
  numbers.each do |nr|
    sum += nr
    if different_sums.key?(sum)
      running = false
      puts "Part 2: "
      puts sum
      break
    end
    different_sums[sum] = true
    puts different_sums.length
  end
end

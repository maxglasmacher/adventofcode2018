a = [1, 2, 3, 4]

a.each do |nr|
  a.push(5) if nr == 3
  a.push(6) if nr == 4
  p nr
end


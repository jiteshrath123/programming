r, c, c1, c2 = gets.split.map(&:to_i)
list = Array.new(r){Array.new(c,0)}
list.each_with_index do |row, i|
  row.each_with_index do |element, j|
    a = i - c1
    b = j - c2
    list[i][j] = [a.abs, b.abs].max
  end
end

list.each do |row|
  puts row.join(' ')
end


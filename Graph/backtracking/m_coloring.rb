class Graph
  def initialize(n, m)
    @n = n
    @no_of_colors = m
    @graph = Array.new(n, 0){ Array.new(n, 0) }
    @color = Array.new(n, 0)
  end

  def add_edge(x, y)
    @graph[x][y] = 1
    @graph[y][x] = 1
  end

  def coloring
    @color[0] = 1
    if coloring_util(1)
      print_colors
    else
      puts 'not possible'
    end
  end

  def safe?(node, color)
    return false unless @color[node] == 0

    @graph[node].each_with_index do |ad_ver, index|
      next if index == node || ad_ver == 0

      return false if @color[index] == color
    end
    true
  end

  def coloring_util(count)
    return true if count >= @n

    for i in 1..@no_of_colors
      next unless safe?(count, i)

      @color[count] = i
      return true if coloring_util(count + 1)

      @color[count] = 0
    end
    false
  end

  def print_colors
    puts @color.join(' ')
  end
end

v = gets.chomp.to_i
e = gets.chomp.to_i
m = gets.chomp.to_i
graph = Graph.new(v, m)
while e > 0
    x, y = gets.split.map(&:to_i)
    graph.add_edge(x, y)       
    e -= 1
end

graph.coloring


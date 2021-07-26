class Graph
  def initialize(n)
    @v = n
    @graph = {}
    for i in 0..n-1
      @graph[i] = {}
    end
  end

  def add_new_edge(x, y, w)
    @graph[x][y] = w
  end

  def dijkshtra_algo(src)
    @not_visited = (0..@v-1).to_a
    @distance = Array.new(@v, 999999)
    @distance[src] = 0
    current = src
    while !@not_visited.empty?
      @graph[current].keys.each do |neighbour|
        next unless @distance[neighbour] > @distance[current] + @graph[current][neighbour]
        
        @distance[neighbour] = @distance[current] + @graph[current][neighbour]
      end
      @not_visited.delete(current)
      current = get_current
    end
    print_distances
  end

  def get_current
    return nil if @not_visited.empty?

    min_dis_vertice = nil
    min_dis = 9999999
    @not_visited.each do |vertice|
      next unless @distance[vertice] < min_dis

      min_dis_vertice = vertice
      min_dis = @distance[vertice]
    end
    min_dis_vertice
  end
end

def print_distances
  puts @distance.join(' ')
end
  
v = gets.chomp.to_i
e = gets.chomp.to_i
graph = Graph.new(v)
while e > 0
    x, y, w = gets.split.map(&:to_i)
    graph.add_new_edge(x, y, w)       
    e -= 1
end
graph.dijkshtra_algo(0)

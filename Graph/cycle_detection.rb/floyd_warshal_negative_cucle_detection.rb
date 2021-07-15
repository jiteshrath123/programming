class Graph
  INF = 999999
  def initialize(n)
    @v = n
    @graph = Array.new(@v, INF){ Array.new(@v, INF) }
    for i in 0...n
      @graph[i][i] = 0
    end
  end

  def add_new_edge(x, y, w)
    @graph[x][y] = w
  end

  def floyd_warshal_shor_distance_matrix
    for k in 0..@v-1
      for i in 0..@v-1
        for j in 0..@v-1
          @graph[i][j] = [@graph[i][j], @graph[i][k] + @graph[k][j]].min
        end
      end  
    end
  end

  def print_floyd_distance
    @graph.each do |row|
      puts row.join(', ')
    end
  end
end
  
v = gets.chomp.to_i
e = gets.chomp.to_i
graph = Graph.new(v)
while e > 0
    x, y, w = gets.split.map(&:to_i)
    graph.add_new_edge(x, y, w)       
    e -= 1
end
graph.floyd_warshal_shor_distance_matrix
graph.print_floyd_distance

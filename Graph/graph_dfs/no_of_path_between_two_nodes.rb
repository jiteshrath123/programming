class Graph
  def initialize(n)
      @graph = {}
      @count = 0
      @v = n
      for i in 0..n-1
        @graph[i] = []
      end
  end

  def add_new_edge(x, y)
      @graph[x] = [] unless @graph.has_key?(x)
      @graph[x].push(y)
  end

  def count_paths(src, des)
    visited = Array.new(@v, false)
    path_counter(src, des, visited)
  end

  def path_counter(src, des, visited)
    visited[src] = true
    puts src
    if src == des
      @count+=1
    else
      @graph[src].each do |node|
        path_counter(node, des, visited) unless visited[node]
      end
    end
  end

  def get_count
    @count
  end 
end

v = gets.chomp.to_i
e = gets.chomp.to_i
graph = Graph.new(v)
while e > 0
    x, y = gets.split.map(&:to_i)
    graph.add_new_edge(x, y)       
    e -= 1
end
src, des = gets.split.map(&:to_i)
graph.count_paths(src, des)
puts graph.get_count

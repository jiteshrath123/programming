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
    @graph[y][x] = w
  end

  def path_more_than_k(source, n)
    @visited = Array.new(@v, false)
    @visited[source] = true
    return path_util(n, source)
  end

  def path_util(n, vertex)
    return true if n <= 0

    @graph[vertex].keys().each do |node|
      next if @visited[node]

      @visited[node] = true
      return true if path_util(n-@graph[vertex][node], node)
      @visited[node] = false
    end
    false
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
n = gets.chomp.to_i
source = gets.chomp.to_i
puts graph.path_more_than_k(source, n)
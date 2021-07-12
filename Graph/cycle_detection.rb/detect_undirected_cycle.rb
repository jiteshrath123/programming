class Graph
  def initialize(n)
    @graph = {}
    for i in 0..n-1
      @graph[i] = []
    end
  end

  def add_new_edge(x, y)
    @graph[x].push(y)
    @graph[y].push(x)
  end

  def cyclic_util(v, parent)
    @visited[v] = true
    @graph[v].each do |vertex|
      unless @visited[vertex]
        return true if cyclic_util(vertex, v)
      else
        return true unless vertex == parent
      end
    end
    false
  end

  def has_cycle?(n)
    @visited = Array.new(n, false)
    for i in 0..n-1
      next if @visited[i]

      return true if cyclic_util(i, -1)
    end
    false
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
puts graph.has_cycle?(v)

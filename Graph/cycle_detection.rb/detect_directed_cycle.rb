class Graph
  def initialize(n)
    @graph = {}
    for i in 0..n-1
      @graph[i] = []
    end
  end

  def add_new_edge(x, y)
    @graph[x].push(y)
  end

  def cyclic_util(v)
    unless @visited[v]
      @restack[v] = true
      @visited[v] = true
      @graph[v].each do |vertex|
        return true unless @visited[vertex] || !cyclic_util(vertex)   
        return true if @restack[vertex]
      end
    end
    @restack[v] = false
    false
  end

  def has_cycle?(n)
    @visited = Array.new(n, false)
    @restack = Array.new(n, false)
    for i in 0..n-1
      return true if cyclic_util(i)
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

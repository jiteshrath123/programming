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

  def topological_util(v)
    @visited[v] = true
    @graph[v].each do |vertex|
      next if @visited[vertex]

      topological_util(vertex)
    end
    @topological_stack.push(v)
  end

  def topological_sorting(n)
    @visited = Array.new(n, false)
    @topological_stack = []
    for i in 0..n-1
      next if @visited[i]

      topological_util(i)
    end
    @topological_stack.reverse().join(' ')
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
puts graph.topological_sorting(v)

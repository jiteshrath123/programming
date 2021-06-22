class Graph
  def initialize(n)
      @graph = {}
      for i in 0..n-1
        @graph[i] = []
      end
  end

  def add_new_edge(x, y)
      @graph[x] = [] unless @graph.has_key?(x)
      @graph[x].push(y)
  end

  def dfs(v)
    @visited[v] = true
    @graph[v].each do |vertex|
      unless @visited[vertex]
        dfs(vertex)
      end
    end
  end
      
  def mother_vertex(n)
    @visited = Array.new(n, false)
    v = 0
    for i in 0..n-1
      unless @visited[i]
        dfs(i)
        v = i
      end
    end
    @visited = Array.new(n, false)
    dfs(v)
    for i in 0..n-1
      return false unless @visited[i]
    end
    v
  end
end

n = gets.chomp.to_i
k = n
graph = Graph.new(7)
while n > 0
    x, y = gets.split.map(&:to_i)
    graph.add_new_edge(x, y)       
    n -= 1
end
puts graph.mother_vertex(7)


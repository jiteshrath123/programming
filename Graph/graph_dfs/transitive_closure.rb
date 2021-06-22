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

  def dfs(v1, v2)
    @closure[v1][v2] = true
    @graph[v2].each do |vertex|
      unless @closure[v1][vertex]
        dfs(v1, vertex)
      end
    end
  end
      
  def transitive_closure(n)
    @closure = Array.new(n, false){Array.new(n, false)}
    for i in 0..n-1
      @graph[i].each do |vertex|
        dfs(i, vertex) unless @closure[i][vertex]
      end
    end
  end

  def print_closure
    @closure.each do |row|
      puts row.join(' ').to_s
    end
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
graph.transitive_closure(v)
graph.print_closure


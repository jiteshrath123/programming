class Graph
  INF = 9999999
  def initialize(n)
    @distances = Array.new(n, INF)
    @distances[0] = 0
    @edges = []
  end

  def add_new_edge(x, y, w)
    @edges.push([x, y, w])
  end

  def bellman_shortest_path(v)
    while(v>1)
      @edges.each do |edge|
        next unless (@distances[edge[0]] + edge[2]) < @distances[edge[1]]

        @distances[edge[1]] = @distances[edge[0]] + edge[2]
      end
      v -= 1
    end
  end

  def has_negative_cycle?
    @edges.each do |edge|
      return true if (@distances[edge[0]] + edge[2]) < @distances[edge[1]]
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

graph.bellman_shortest_path(v)
puts graph.has_negative_cycle?

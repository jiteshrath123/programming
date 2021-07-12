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
    @white.delete(v)
    @grey.push(v)
    @graph[v].each do |vertex|
      if @white.include?(vertex)
        return true if cyclic_util(vertex)
      else
        return true if @grey.include?(vertex)
      end
    end
    @grey.delete(v)
    @black.push(v)
    false
  end

  def has_cycle?(n)
    @white = (0..n-1).to_a
    @grey = []
    @black = []
    for i in 0..n-1
      next unless @white.include?(i)

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

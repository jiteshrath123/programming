class Graph
  def initialize(n)
    @v = n
    @weights = []
    @endpoints = []
    @set_point = Array.new(n, 0)
    @set_count = 1
    @no_of_selected_edges = 0
    @all_min_edge = []
  end

  def add_new_edge(x, y, w)
    @weights.push(w)
    @endpoints.push([x, y])
  end

  def kruskal_algo
    while @no_of_selected_edges < @v-1
      endpoints = min_edge
      weight = endpoints.last
      endpoints = endpoints.first
      if @set_point[endpoints[0]].zero? && @set_point[endpoints[1]].zero?
        @set_point[endpoints[0]] = @set_count
        @set_point[endpoints[1]] = @set_count
        @set_count += 1
        @no_of_selected_edges += 1
        @all_min_edge.push([endpoints[0], endpoints[1], weight])
      elsif @set_point[endpoints[0]].zero?
        @set_point[endpoints[0]] = @set_point[endpoints[1]]
        @no_of_selected_edges += 1
        @all_min_edge.push([endpoints[0], endpoints[1], weight])
      elsif @set_point[endpoints[1]].zero?
        @set_point[endpoints[1]] = @set_point[endpoints[0]]
        @no_of_selected_edges += 1
        @all_min_edge.push([endpoints[0], endpoints[1], weight])
      elsif @set_point[endpoints[0]] != @set_point[endpoints[1]]
        min_set_count = [@set_point[endpoints[0]], @set_point[endpoints[1]]].min
        max_set_count = [@set_point[endpoints[0]], @set_point[endpoints[1]]].max
        @set_point.each_with_index do |set_count, vertice|
          next unless @set_point[vertice] == min_set_count

          @set_point[vertice] = max_set_count
        end
        @no_of_selected_edges += 1
        @all_min_edge.push([endpoints[0], endpoints[1], weight])
      end
    end
    print_edges
  end

  def min_edge
    min_weight = @weights.min
    index = @weights.index(min_weight)
    min_weight_endpoints = @endpoints[index]
    @weights.delete_at(index)
    @endpoints.delete_at(index)
    [min_weight_endpoints, min_weight]
  end

  def print_edges
    @all_min_edge.each do |edge|
      puts edge.join(' ')
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
graph.kruskal_algo
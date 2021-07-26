require 'set'
class Graph
  INF = 9999999
  def initialize(n)
    @v = n
    @graph = {}
    for i in 0..n-1
      @graph[i] = { neighbours: [], weights: [] }
    end
    @selected_endpoints = Set.new()
    @all_min_edge = []
    @min_weight_edge = INF
  end

  def add_new_edge(x, y, w)
    @graph[x][:neighbours].push(y)
    @graph[x][:weights].push(w)
    @graph[y][:neighbours].push(x)
    @graph[y][:weights].push(w)
    return unless @min_weight_edge > w

    @min_endpoints = [x, y]
    @min_weight_edge = w
  end

  def prims_algo
    @selected_endpoints.add(@min_endpoints[0])
    @selected_endpoints.add(@min_endpoints[1])
    @all_min_edge.push([@min_endpoints[0], @min_endpoints[1], @min_weight_edge])
    remove_edge(@min_endpoints[0], @min_endpoints[1])
    for i in 0..@v-3
      @all_min_edge.push(min_edge)
    end
    print_edges
  end

  def min_edge
    @min_weight_edge = INF
    @selected_endpoints.each do |vertice|
      @graph[vertice][:neighbours].each_with_index do |node, index|
        next if @selected_endpoints.include?(node) || @min_weight_edge < @graph[vertice][:weights][index]

        @min_weight_edge = @graph[vertice][:weights][index]
        @min_endpoints = [vertice, node]
      end
    end
    @selected_endpoints.add(@min_endpoints[0])
    @selected_endpoints.add(@min_endpoints[1])
    remove_edge(@min_endpoints[0], @min_endpoints[1])
    [@min_endpoints[0], @min_endpoints[1], @min_weight_edge]
  end

  def remove_edge(x, y)
    index = @graph[x][:neighbours].index(y)
    @graph[x][:neighbours].delete_at(index)
    @graph[x][:weights].delete_at(index)
    index = @graph[y][:neighbours].index(x)
    @graph[y][:neighbours].delete_at(index)
    @graph[y][:weights].delete_at(index)
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
graph.prims_algo

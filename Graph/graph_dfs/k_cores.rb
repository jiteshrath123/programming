class Graph
  def initialize(n)
      @graph = {}
      @count = 0
      for i in 0..n-1
        @graph[i] = []
      end
  end

  def add_new_edge(x, y)
    @graph[x] = [] unless @graph.has_key?(x)
    @graph[x].push(y)
    @graph[y] = [] unless @graph.has_key?(y)
    @graph[y].push(x)
  end

  def dfs(v1, v2)
    @closure[v1][v2] = true
    @graph[v2].each do |vertex|
      unless @closure[v1][vertex]
        dfs(v1, vertex)
      end
    end
  end
      
  def k_cores_graph(v, k)
    has_nodes = true
    while has_nodes
      has_nodes = false
      @graph.keys().each do |node|
        @count+=1
        if @graph[node].length < k
          remove_node(node)
          has_nodes = true;
        end
      end
    end
    [@graph, @count]
  end

  def remove_node(i)
    attached_nodes = @graph[i]
    @graph.delete(i)
    attached_nodes.each do |node|
      @count+=1
      @graph[node].delete(i)
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
k = gets.chomp.to_i
puts graph.k_cores_graph(v, k)


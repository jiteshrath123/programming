class Graph
  def initialize(n)
      @graph = {}
      @n = n
      for i in 1..n
        @graph[i] = []
      end
  end

  def add_new_edge(x, y)
    @graph[x].push(y)
    @graph[y].push(x)
  end

  def no_unreach_nodes(k)
    @visited = Array.new(@n, false)
    st = []
    st.push(k)
    @visited[k-1] = true
    while st.length > 0
      node = st.pop()
      puts node
      @graph[node].each do |vertice|
        next if @visited[vertice-1]

        st.push(vertice)
        puts vertice
        @visited[vertice-1] = true
      end
    end
    @visited.count { |node| !node }
  end
end

v, e = gets.split.map(&:to_i)
graph = Graph.new(v)
while e > 0
  x, y = gets.split.map(&:to_i)
    graph.add_new_edge(x, y)       
    e -= 1
end
k = gets.chomp.to_i
puts graph.no_unreach_nodes(k)


class Graph
  def initialize(n)
      @v = n
      @graph = {}
      @count = 0
      for i in 0..n-1
        @graph[i] = []
      end
  end

  def add_new_edge(x, y)
    @graph[x].push(y)
  end

  def dsfUtil(v)
    @visited[v] = true
    @scc.push(v)
    @gt[v].each do |vertex|
      unless @visited[vertex]
        dsfUtil(vertex)
      end
    end
  end

  def graph_transpose
    @gt = {}
    for i in 0..@v-1
      @gt[i] = []
    end
    for i in 0..@v-1
      @graph[i].each do |node|
        @gt[node].push(i)
      end
    end
  end

  def prepare_ending_stack(i)
    @visited[i] = true
    @graph[i].each do |node|
      next if @visited[i]
      
      prepare_ending_stack(i)
    end
    @stack.push(i)
  end

  def kosaraju_algo
    @visited = Array.new(@v, false)
    @stack = []
    for i in 0..@v-1
      unless @visited[i]
        prepare_ending_stack(i)
      end
    end
    graph_transpose
    @visited = Array.new(@v, false)
    for i in 0..@v-1
      @scc = []
      unless @visited[i]
        dsfUtil(i)
      end
      puts @scc.join(' ')
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
graph.kosaraju_algo

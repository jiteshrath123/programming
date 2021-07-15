class Graph
  def initialize(n)
    @v = n
    @graph = {}
    for i in 0..n-1
      @graph[i] = []
    end
  end

  def add_new_edge(x, y)
    @graph[x].push(y)
    @graph[y].push(x)
  end

  def dfs(n, vert, start)
    @marked[vert] = true
    if n == 0
      @marked[vert] = false
      if @graph[vert].include?(start)
        @count += 1
      end
      return
    end

    for i in 0..@v-1
      if !@marked[i] && @graph[i].include?(start)
        dfs(n-1, i, start)
      end
    end
    @marked[vert] = false
  end

  def count_cycle(n)
    @count = 0
    @marked = Array.new(@v, false)
    for i in 1..@v-(n-1)
      dfs(n-1, i, i)

      @marked[i] = true
    end
    @count/2
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
n = gets.chomp.to_i
puts graph.count_cycle(n)

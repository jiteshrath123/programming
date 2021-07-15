class Graph
  def initialize(n)
    @v = n
    @graph = {}
    for i in 0..n-1
      @graph[i] = []
    end
    @indegree = Array.new(n, 0)
  end

  def add_new_edge(x, y)
    @graph[x].push(y)
    @indegree[y] += 1
  end

  def all_topological_util
    flag = false
    for i in 0..@v-1
      if !@visited[i] && @indegree[i].zero?
        @graph[i].each do |vertex|
          @indegree[vertex] -=1
        end
        @result.push(i)
        @visited[i] = true
        all_topological_util
        @result.pop()
        @visited[i] = false
        @graph[i].each do |vertex|
          @indegree[vertex] +=1
        end
        flag = true
      end
    end
    return if flag
    puts @result.join(' ')
  end

  def topological_sorting(n)
    @visited = Array.new(n, false)
    @result = []
    all_topological_util
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
puts graph.topological_sorting(v)

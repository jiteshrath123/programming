class Graph
  def initialize
      @graph = {}
  end

  def add_new_edge(x, y)
      @graph[x] = [] unless @graph.has_key?(x)
      @graph[x].push(y)
      @graph[y] = [] unless @graph.has_key?(y)
      @graph[y].push(x)
  end
      
  
  def form_level_array(n)
      @dis = (n).times.map { 0 }
      queue = []
      queue.push(1)
      @dis[0] = 1
      while(queue.length > 0)
          vertice = queue[0]
          queue.shift
          @graph[vertice].each do |node|
              if @dis[node-1] == 0
                  queue.push(node)
                  @dis[node-1] = @dis[vertice-1] + 1
              end
          end
      end
  end

  def no_of_nodes_at_level(z)
    count = 0
    @dis.each do |level|
      count += 1 if level == z
    end
    return count
  end

end

n = gets.chomp.to_i
k = n
graph = Graph.new()
while n > 1
    x, y = gets.split.map(&:to_i)
    graph.add_new_edge(x, y)       
    n -= 1
end
z = gets.chomp.to_i
graph.form_level_array(k)
puts graph.no_of_nodes_at_level(z)


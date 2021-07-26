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

  def check_bipartite_util(v)
    @color[v] = 1
    q = []
    q.push(v)
    while !q.empty?
      u = q.shift
      @graph[u].each do |node|
        if @color[node].eql?(-1)
          @color[node] = 1 - @color[u]
          q.push(node)
        elsif @color[node] == @color[u]
          return false
        end
      end
    end
    true
  end
        
  def check_bipartite
    @color = Array.new(@v, -1)
    for i in 0..@v-1
      next unless @color[i].eql?(-1)
      
      unless check_bipartite_util(i)
        return false
      end
    end
    true
  end

  def print_color
    puts @color.join(' ')
  end
end

n = gets.chomp.to_i
e = gets.chomp.to_i
graph = Graph.new(n)
while e > 0
  x, y = gets.split.map(&:to_i)
  graph.add_new_edge(x, y)       
  e -= 1
end
puts graph.check_bipartite
puts graph.print_color

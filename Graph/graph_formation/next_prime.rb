class Graph
  def initialize()
    @graph = {}
    primes
    create_graph
  end

  def create_graph
    @nodes.each do |node|
      add_node(node)
    end
    @nodes.each_with_index do |node1, index|
      @nodes[index+1..].each do |node2|
        if single_digit_different?(node1, node2)
          add_edge(node1, node2)
        end           
      end
    end
  end

  def add_node(node)
    @graph[node] = {visited: 0, nodes: []}
  end

  def add_edge(a,b)
    @graph[a][:nodes].push(b)
    @graph[b][:nodes].push(a)
  end

  def single_digit_different?(x, y)
    a  = x.to_s
    b  = y.to_s
    count = 0 
    count += 1 if a[0] == b[0]
    count += 1 if a[1] == b[1]
    count += 1 if a[2] == b[2]
    count += 1 if a[3] == b[3]
    count == 3
  end

  def primes
    @primes = Array.new(10000, true)
    for i in 2..99
      next unless @primes[i]
      
      j = i*i
      while(j <= 9999)
        @primes[j] = false
        j += i
      end
    end
    @nodes = []
    @primes.each_with_index do |is_prime, index|
      unless index < 1000
        @nodes.push(index) if is_prime
      end
    end
  end

  def shortest_path(x,y)
    stack = []
    stack.push(x)
    @graph[x][:visited] = 1
    while(stack.length > 0)
      node = stack.shift
      @graph[node][:nodes].each do |vertice|
        next unless @graph[vertice][:visited].zero?

        @graph[vertice][:visited] = @graph[node][:visited] + 1
        stack.push(vertice)
        return @graph[vertice][:visited] - 1 if vertice == y
      end
    end
  end
end

graph = Graph.new()
x, y = gets.split.map(&:to_i)

puts graph.shortest_path(x, y)



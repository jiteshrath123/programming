class Graph
    def initialize
        @graph = {1: []}
        @count = 2
    end

    def add_new_node(y)
        @graph[y].push(@count)
        @graph[@count]= [y]
        @count += 1
    end
        
    
    def largest_path(y)
        dis = (@count-1).times.map { -1 }
        queue = []
        queue.push(y)
        dis[y-1] = 0
        while(queue.length > 0)
            vertice = queue[0]
            queue.shift
            @graph[vertice].each do |node|
                if dis[node-1] == -1
                    queue.push(node)
                    dis[node-1] = dis[vertice-1] + 1
                end
            end
        end
        return dis.max;
    end

end

t = gets.chomp.to_i

while t > 0
    q = gets.chomp.to_i
    graph = Graph.new()
    while q > 0
        x, y = gets.split.map(&:to_i)
        if x == 1
            graph.add_new_node(y)       
        else
            puts graph.largest_path(y)
        end
        q -= 1
    end
    t -= 1
end

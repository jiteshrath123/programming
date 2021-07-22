class Maze
  def initialize(n)
    @n = n
    @field = Array.new(n, false){ Array.new(n, false) }
    @path = Array.new(n, 0){ Array.new(n, 0) }
    @steps = [[0,1], [1, 0]]
  end

  def add_edge(x, y)
    @field[x][y] = true
  end

  def rat_path
    @path[0][0] = 1
    if rat_path_util(0, 0)
      print_path
    else
      false
    end
  end

  def rat_path_util(x, y)
    return true if x == @n-1 && y == @n-1

    @steps.each do |step|
      x_next = x + step[0]
      y_next = y + step[1]
      next unless @field[x_next][y_next]
      
      @path[x_next][y_next] = 1
      if rat_path_util(x_next, y_next)
        return true
      else
        @path[x_next][y_next] = 0
      end
    end
    false
  end

  def print_path
    @path.each do |row|
      puts row.join(' ')
    end
  end
end

v = gets.chomp.to_i
e = gets.chomp.to_i
field = Maze.new(v)
while e > 0
    x, y = gets.split.map(&:to_i)
    field.add_edge(x, y)       
    e -= 1
end

field.rat_path



class Chess
  def initialize(n)
    @n = n
    @board = Array.new(n, 0){ Array.new(n, 0) }
  end

  def place_queen
    if place_queen_util(0)
      print_board
    else
      puts 'not_exist'
    end
  end

  def place_queen_util(col)
    return true if col >= @n
    
    for i in 0..@n-1
      next unless safe?(i, col)

      @board[i][col] = 1
      return true if place_queen_util(col + 1)
      
      @board[i][col] = 0
    end
    false
  end

  def safe?(x, y)
    return false unless safex?(x, y)
    
    return false unless lower_diagonal_safe?(x, y)
    
    return false unless upper_diagonal_safe?(x, y)

    true
  end

  def safex?(x, y)
    for i in 0..@n-1
      next if i == y

      return false if @board[x][i].eql?(1)
    end
    true
  end

  def lower_diagonal_safe?(x, y)
    i = x
    j = y
    while j >= 0 && i < @n
      return false if @board[i][j].eql?(1)
      i += 1
      j -= 1
    end
    true
  end

  def upper_diagonal_safe?(x, y)
    i = x
    j = y
    while i >= 0 && j >= 0
      return false if @board[i][j].eql?(1)
      i -= 1
      j -= 1
    end
    true
  end

  def print_board
    @board.each do |row|
      puts row.join(' ')
    end
  end
end

n = gets.chomp.to_i
board = Chess.new(n)
board.place_queen

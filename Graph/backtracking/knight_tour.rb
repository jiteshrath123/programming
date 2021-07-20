class Chess
  def initialize(n)
    @n = n
    @board = Array.new(n, -1){ Array.new(n, -1) }
    @xmoves = [2, 1, -1, -2, -2, -1, 1, 2]
    @ymoves = [1, 2, 2, 1, -1, -2, -2, -1]
    @board[0][0] = 0
  end

  def knight_tour
    return 'not solution' unless knight_tour_util(0, 0, 1)

    print_board
  end

  def knight_tour_util(x, y, count)
    return true if count == @n*@n

    for i in 0..7
      next_x = x + @xmoves[i]
      next_y = y + @ymoves[i]
      if safe?(next_x, next_y)
        @board[next_x][next_y] = count
        if knight_tour_util(next_x, next_y, count + 1)
          return true
        else
          @board[next_x][next_y] = -1
        end
      end
    end
    false
  end

  def safe?(x, y)
    return true if x >=0 && y >=0 && x < @n && y < @n && @board[x][y] == -1

    false
  end

  def print_board
    @board.each do |row|
      puts row.join(' ')
    end
  end
end

n = gets.chomp.to_i
board = Chess.new(n)
puts board.knight_tour

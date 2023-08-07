class Game
  attr_accessor :current_player

  def initialize(player_1, player_2, board)
    @player_1 = player_1
    @player_2 = player_2
    @current_player = @player_1
    @board = board
  end

  def make_move(x, y)
    if @board.is_empty(x, y)
      @board.update_state(x, y, @current_player.symbol)
      'move recorded'
    else
      'square taken'
    end
  end

  def switch_player
    @current_player = @current_player == @player_1 ? @player_2 : @player_1
  end

  def status
    if horizontal_win || vertical_win || diagonal_win
      'complete'
    else
      'incomplete'
    end
  end

  private

  def winning_line?(array)
    array.uniq.length == 1 && array.include?(nil) == false
  end

  def horizontal_win
    @board.state.any? do |row|
      winning_line?(row)
    end
  end

  def vertical_win
    @board.state[0].each_with_index.any? do |element, index|
      vertical = @board.state.map do |row|
        row[index]
      end
        winning_line?(vertical)
    end
  end

  def diagonal_win
    board_size = @board.state.size
    first_diagonal = (0...board_size).map { |i| @board.state[i][i] }
    return true if winning_line?(first_diagonal)

    second_diagonal = (0...board_size).map { |i| @board.state[i][board_size - i - 1] }
    return true if winning_line?(second_diagonal)
  false
  end

end

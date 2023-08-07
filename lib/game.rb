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

  def horizontal_win
    @board.state.any? do |row|
      row.uniq.length == 1 && row.include?(nil) == false
    end
  end

  def vertical_win
    @board.state[0].each_with_index.any? do |element, index|
      vertcial = @board.state.map do |row|
        row[index]
      end
      vertcial.uniq.length == 1 && vertcial.include?(nil) == false
    end
  end

  def diagonal_win
    
  end

end

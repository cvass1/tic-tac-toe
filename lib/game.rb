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
      "move recorded"
    else
      "square taken"
    end
  end

  def switch_player()
    @current_player == @player_1 ? @current_player = @player_2 : @current_player = @player_1
  end

  def status()
    @board.get_state
  end

end
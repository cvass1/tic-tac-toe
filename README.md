# Try our Tic Tac Toe Tech Test!

This is a very common tech test as it demonstrates a candidate's knowledge of basic data structures.

## The brief

The rules of tic tac toe are as follows:

- There are two players in the game (X and O)
- Players take turns until the game is over
- A player can claim a field if it is not already taken
- A turn ends when a player claims a field
- A player wins if they claim all the fields in a row, column or diagonal
- A game is over if a player wins
- A game is over when all fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.

## Example

```ruby
// irb
require './board.rb'
require './player.rb'
require './game.rb'

board = Board.new
player_1 = Player.new("Caz","X")
player_2 = Player.new("Pip","O")
game = Game.new(player_1,player_2,board)

game.make_move(2,2)
game.switch_player
game.make_move(1,1)
game.switch_player
game.make_move(1,2)
game.switch_player
game.make_move(2,1)
game.switch_player
game.make_move(3,2)

board.get_state // returns [[nil, nil, nil], ["X", "X", "X"], ["Y", "Y", nil]]

```

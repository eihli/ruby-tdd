require_relative "./lib/tictactoe"

# Initialize a new game.
game = TicTacToe.new
# Get player names.
game.initialize_players

# Display welcome message and game board.
puts "Good luck."

game.board.render

# Prompt player 1 for move
  # After each move, there will be internal work to check to see if
  # there is a winner.
# Prompt player 2 for move.

# When there is a winner, congratulate them and ask if they
# want to start a new game.
  # TODO: How to handle this. State check? Event listener?
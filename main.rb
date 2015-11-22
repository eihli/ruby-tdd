require "./lib/tictactoe"

game = TicTacToe.new
game.initialize_players

puts game.player1.name
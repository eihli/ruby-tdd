require "./lib/tictactoe"

puts "Enter name for player 1"
player1Name = gets.chomp()
puts "Enter name for player 2"
player2Name = gets.chomp()

game = TicTacToe.new(player1Name, player2Name)

puts game.player1.name
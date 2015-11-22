require "player"
require "board"

class TicTacToe

  attr_reader :board
  attr_reader :players

  def initialize
    @board = Board.new
    @players = []
  end

  def get_player_name(prompt)
    return $stdin.gets.chomp
  end

  def initialize_player(playerName)
    if @players.length == 2
      alertTooManyPlayers
    else
      @players << Player.new(playerName)
    end
  end

  # If there are too many players, let the user know.
  # Return control to the program.
  def alertTooManyPlayers
    # TODO: Ask if they want to change a name or start a new game.
    puts "You already have two players."
  end

end

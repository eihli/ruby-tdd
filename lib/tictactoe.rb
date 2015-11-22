require "player"
require "board"

class TicTacToe

  attr_reader :board
  attr_reader :players

  def initialize
    @board = Board.new
    @players = []
    initialize_players
  end

  def get_player_name(prompt)
    return $stdin.gets.chomp
  end

  def initialize_players
    if @players.length == 0
      @players << (Player.new(get_player_name "Enter player 1 name: "))
      @players << (Player.new(get_player_name "Enter player 2 name: "))
    end
  end

  # If there are too many players, let the user know.
  # Return control to the program.
  def alertTooManyPlayers
    # TODO: Ask if they want to change a name or start a new game.
    puts "You already have two players."
  end

end

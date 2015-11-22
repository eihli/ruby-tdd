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

class Player

  attr_reader :name

  def initialize(name)
    @name = name
  end

end

class Board

  attr_reader :state

  def initialize
    @state = Array.new(3){Array.new(3){nil}}
  end

end
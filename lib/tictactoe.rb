class TicTacToe

  attr_reader :board
  attr_reader :player1
  attr_reader :player2

  def initialize
    @board = Board.new
  end

  def get_player_name(prompt)
    puts prompt
    gets.chomp
  end

  def initialize_players
    @player1 = Player.new get_player_name("Enter name for player 1")
    @player2 = Player.new get_player_name("Enter name for player 2")
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
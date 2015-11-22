class TicTacToe

  attr_reader :board
  attr_reader :player1
  attr_reader :player2

  def initialize(player1Name, player2Name)
    @board = Board.new
    @player1 = Player.new player1Name
    @player2 = Player.new player2Name
    print @board
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
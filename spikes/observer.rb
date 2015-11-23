require "observer"

class Game

  def initialize
    @board = Board.new
    @board.add_observer(self)
  end

  def update(row, col, mark)
    puts "Board has been updated with #{row} #{col} #{mark}"
  end

  def set(row, col, mark)
    @board.set(row, col, mark)
  end

end

class Board
  include Observable

  def initialize
    @state = Array.new(3) {Array.new(3) {nil}}
  end

  def get(row, col)
    return @state[row][col]
  end

  def set(row, col, mark)
    changed
    @state[row][col] = mark
    notify_observers(row, col, mark)
  end

end

game = Game.new

game.set(1, 1, 'X')
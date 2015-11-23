require_relative "./player"
require_relative "./board"

class TicTacToe

  attr_reader :board
  attr_reader :players

  def initialize
    @board = Board.new
    @players = []
    @active_player = 0
    @winner = nil
    initialize_players
  end

  def get_player_name(prompt)
    print prompt
    return $stdin.gets.chomp
  end

  def initialize_players
    if @players.length == 0
      @players << (Player.new(get_player_name "Enter player 1 name: "))
      @players << (Player.new(get_player_name "Enter player 2 name: "))
    end
  end

  def prompt_player_for_move
    puts "Enter location you would like to claim."
    return $stdin.gets.chomp
  end

  def update_board(row, col, mark)
    board.set(row, col, mark)
  end

end

require_relative "../lib/tictactoe"

describe TicTacToe do

  before :each do
    @game = TicTacToe.new
    with_stdin do |user|
      user.puts "Eric"
      name = @game.get_player_name "Enter player name"
      @game.initialize_player(name)
    end
  end

  # TODO: http://stackoverflow.com/questions/16948645/how-do-i-test-a-function-with-gets-chomp-in-it
  # hijack and mock user input for testing
  it "returns a game" do
    expect(@game).to be_an_instance_of(TicTacToe)
    expect(@game.board).to be_an_instance_of(Board)
  end

  it "has a 3x3 nil filled matrix" do
    expect(@game.board.state[0][0]).to be_nil
    expect(@game.board.state[2][2]).to be_nil
  end

  it "has two players" do
    expect(@game.player1).to be_an_instance_of(Player)
    expect(@game.player1.name).to eq("Eric")
  end

  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

end


require_relative "../lib/tictactoe"

describe TicTacToe do

  before :each do
    @game = TicTacToe.new
    with_stdin do |user|
      user.puts "Eric"
      name = @game.get_player_name "Enter player 1 name"
      @game.initialize_player(name)
      user.puts "Taylor"
      name = @game.get_player_name "Enter player 2 name"
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
    expect(@game.players.length).to eq(2)
    expect(@game.players[0]).to be_an_instance_of(Player)
    expect(@game.players[0].name).to eq("Eric")
    expect(@game.players[1].name).to eq("Taylor")
  end

  it "won't allow more than two players" do
    with_stdin do |user|
      user.puts("Alice")
      expect {
        @game.initialize_player(@game.get_player_name "Enter player 3 name")
        }.to output("You already have two players.\n").to_stdout
      expect(@game.players.length).to eq(2)
      expect(@game.players[0].name).to eq("Eric")
      expect(@game.players[1].name).to eq("Taylor")
    end
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


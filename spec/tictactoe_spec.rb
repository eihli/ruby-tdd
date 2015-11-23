require_relative "../lib/tictactoe"

describe TicTacToe do

  before :each do
    with_stdin do |user|
      user.puts "Eric"
      user.puts "Taylor"
      @game = TicTacToe.new
      @game.initialize_players
    end
  end

  it "returns a game with board" do
    expect(@game).to be_an_instance_of(TicTacToe)
    expect(@game.board).to be_an_instance_of(Board)
  end

  it "has two players" do
    expect(@game.players.length).to eq(2)
    expect(@game.players[0]).to be_an_instance_of(Player)
    expect(@game.players[0].name).to eq("Eric")
    expect(@game.players[1].name).to eq("Taylor")
  end

  it "can prompt player for move" do
    with_stdin do |user|
      user.puts "1, 1"
      expect(@game.prompt_player_for_move).to eq('1, 1')
    end
  end

  it "is notified when a cell on board is set" do
    @game.board.set(1, 1, 'X')
  end

  # Helper function to mock input for tests.
  # http://stackoverflow.com/questions/16948645/how-do-i-test-a-function-with-gets-chomp-in-it
  def with_stdin
    stdin = $stdin
    $stdin, write = IO.pipe
    yield write
  ensure
    write.close
    $stdin = stdin
  end

end


require_relative "../lib/board"

describe Board do
  
  before :each do
    @board = Board.new
  end

  # Test that the board initializes to a 3x3 nil matrix. 
  it "should be init to 3x3 nil matrix" do
    expect(@board.state[0][0]).to be_nil
    expect(@board.state[2][2]).to be_nil
    expect(@board.state.length).to eq(3)
  end

  # Test that it can be displayed to stdout in pretty format.

  it "should display in console in pretty format" do
    output = capture_stdout {@board.render}
    expect(output).to eq("[[nil, nil, nil],\n [nil, nil, nil],\n [nil, nil, nil]]\n")
  end
  # Test that it can detect a winner. How?

  def capture_stdout
    stdout = $stdout
    $stdout = captured = StringIO.new
    begin
      yield
    ensure
      $stdout = stdout
    end
    captured.string
  end

end
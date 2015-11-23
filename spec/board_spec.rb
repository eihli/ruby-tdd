require_relative "../lib/board"

describe Board do
  
  before :each do
    @board = Board.new
  end

  it "should be init to 3x3 nil matrix" do
    expect(@board.get(0, 0)).to be_nil
    expect(@board.get(2, 2)).to be_nil
    expect(@board.state.length).to eq(3)
  end

  it "should display in console in pretty format" do
    output = capture_stdout {@board.render}
    expect(output).to eq("[[nil, nil, nil],\n [nil, nil, nil],\n [nil, nil, nil]]\n")
  end

  it "should be able to get cell" do
    expect(@board.get(1, 1)).to eq(nil)
  end

  it "should be able to set marks in cells" do
    @board.set(1, 1, 'X')
    expect(@board.get(1, 1)).to eq('X')
  end

  # Test that it can detect a winner. How?

  # Helper function to test output.
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
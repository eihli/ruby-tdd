class Board

  attr_reader :state

  def initialize
    @state = Array.new(3){Array.new(3){nil}}
  end

  # TODO: Refactor this so we can just call @board.state.to_s or something?
  def render
    output = "["
    @state.each do |row|
      output += row.to_s + ",\n "
    end
    output = output[0...-3]
    output += "]"
    puts output
  end

end
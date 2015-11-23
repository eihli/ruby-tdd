class Board

  attr_reader :state

  def initialize
    @state = Array.new(3){Array.new(3){nil}}
  end

  def render
    puts "[[nil, nil, nil],\n [nil, nil, nil],\n [nil, nil, nil]]"
  end

end
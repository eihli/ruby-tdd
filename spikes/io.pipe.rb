require_relative "./io.pipe.require.rb"

io = TestIO.new

def with_stdin
  # Save the original $stdin so we can restore it later.
  stdin = $stdin
  # IO.pipe: http://ruby-doc.org/core-2.0.0/IO.html#method-c-pipe
  $stdin, write = IO.pipe
  # Yield: https://rubymonk.com/learning/books/4-ruby-primer-ascent/chapters/18-blocks/lessons/54-yield
  yield write
  # Ensure: http://stackoverflow.com/a/2192010/3937773
ensure
  $stdin = stdin
  write.close
end

#Let's test it out! Run `ruby spikes/io.pipe.rb`!
with_stdin do |user|
  user.puts "user input"
  user.puts "user input 2"
  # Test to make sure it works if we call gets.chomp from another file.
  io.test_io_pipe
  # puts gets.chomp
end
require "spy"

class TestClass

  def initialize
  end

  def call_test_method
    test_method
    test_method
  end

  def test_method
  end

end

testObj = Spy.mock(TestClass)

Spy.on(testObj, :call_test_method).and_call_through
spy_method = Spy.on(testObj, :test_method)

testObj.call_test_method

puts spy_method.has_been_called?
puts spy_method.calls.count
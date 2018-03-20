require 'pry'

NUMBERS = [1, 2, 3]

def test
  puts NUMBERS.inspect
end

binding.pry

test
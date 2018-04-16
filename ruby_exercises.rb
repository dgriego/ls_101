num_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# num_arr.each do |num|
#   puts num
# end

# num_arr.each do |num|
#   puts num if num > 5
# end

odd_numbers = num_arr.select do |num|
  num if num.odd?
end

num_arr.push(11)

num_arr.unshift(0)

num_arr.pop
num_arr << 3

h = {a:1, b:2, c:3, d:4}

h.delete_if do |key, value|
  value < 3.5
end

def examples
  puts 'hey what is up?'
end

examples


# we want to loop through the str
# we want to start at the end of the string and retrieve the values from end to start
# using the retrieved values we want to assign them starting from the beginning of the string
# one counter, being the value passed into the block via the times method
# times method will be called by the size of the string
# on each iteration we want to convert the integer in current iteration to a negative number
# in order to retrieve the values from the end
# we will have an additional counter that will be incremented at the end of each
# iteration

def reverse_string!(str) # 'hello'
  str_copy = str + ''

  str.size.times do |num|
    str[num] = str_copy[-(num + 1)]
  end

  # counter = 0

  # loop do
  #   break if counter == str.size

  #   # counter = 0
  #   # idx = -1
  #   # o

  #   # counter = 1
  #   # idx = -2
  #   str[counter] = str_copy[-(counter + 1)]
  #   counter += 1
  # end
end

# input
#  start number
#  end number
#
# output
#   1, 2, fizz, 4, buzz, fizz, 7, 8, fizz, buzz, 11, fizz, 13, 14, fizzBuzz
#
# Array
#  [1, 2, .., 10]
#
#

def fizzbuzz(start_num, end_num)
  arr = []
  counter = start_num
  loop do
    arr << counter

    break if counter == end_num
    counter += 1
  end

  counter = 0
  loop do
    break if counter == arr.size

    if arr[counter] % 3 == 0 && arr[counter] % 5 == 0
      puts 'fizzBuzz'
    elsif arr[counter] % 3 == 0
      puts 'fizz'
    elsif arr[counter] % 5 == 0
      puts 'buzz'
    else
      puts arr[counter]
    end

    counter += 1
  end
end

def fizzbuzz(start_num, end_num)
  arr = (start_num..end_num).to_a

  arr.each do |num|
    case
    when num % 3 == 0 && num % 5 == 0 then puts 'fizzBuzz'
    when num % 3 == 0 then puts 'fizz'
    when num % 5 == 0 then puts 'buzz'
    else
      puts num
    end
  end
end

PRODUCTS = [
  { name: 'Thinkpad x210', price: 220 },
  { name: 'Thinkpad x220', price: 250 },
  { name: 'Thinkpad x250', price: 979 },
  { name: 'Thinkpad x230', price: 300 },
  { name: 'Thinkpad x230', price: 330 },
  { name: 'Thinkpad x230', price: 350 },
  { name: 'Thinkpad x240', price: 700 },
  { name: 'Macbook Leopard', price: 300 },
  { name: 'Macbook Air', price: 700 },
  { name: 'Macbook Pro', price: 600 },
  { name: 'Macbook', price: 1449 },
  { name: 'Dell Latitude', price: 650 },
  { name: 'Dell Latitude', price: 200 },
  { name: 'Dell Inspiron', price: 300 },
  { name: 'Dell Inspiron', price: 450 }
]

query = {
  price_min: 240,
  price_max: 280,
  q: 'thinkpad'
}

query2 = {
  price_min: 300,
  price_max: 450,
  q: 'dell'
}

def search(query)
  PRODUCTS.select do |product|
    product[:name].downcase.include?(query[:q]) &&
    (query[:price_min]..query[:price_max]).cover?(product[:price])
  end
end

search(query)
# [ { name: 'Thinkpad x220', price: 250 } ]

search(query2)
# [ { name: 'Dell Inspiron', price: 300 },
#   { name: 'Dell Inspiron', price: 450 } ]


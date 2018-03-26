# Even or Odd?
# Write a loop that prints numbers 1-5 and whether the number is even or odd.
# Use the code below to get started.

count = 1

loop do
  puts "#{count} is odd!" if count.odd?
  puts "#{count} is even!" if count.even?

  count += 1
  break if count > 5
end

# Catch the Number
# Modify the following code so that the loop stops if number is between 0 and 10.

loop do
  number = rand(100)
  puts number

  break if (0..10).cover?(number)
end

# Conditional Loop
# Using an if/else statement, run a loop that prints "The loop was processed!"
# one time if process_the_loop equals true. Print "The loop wasn't processed!"
# if process_the_loop equals false.

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else
  puts "The loop was not processed!"
end

# Get the Sum
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i

  if answer == 4
    puts "That's correct!"
    break
  end

  puts "Wrong answer. Try again!"
end

# Insert Numbers
# Modify the code below so that the user's input gets added to the numbers array.
# Stop the loop when the array contains 5 numbers.
numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i

  numbers << input

  break if numbers.size == 5
end

puts numbers

# Empty the Array
# Given the array below, use loop to remove and print each name.
# Stop the loop once names doesn't contain any more elements.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

while names.length > 0
  puts names.shift
end

# with loop
loop do
  puts names.shift
  break if names.empty?
end

# with until

until names.length <= 0
  puts names.shift
end

# Stop Counting
# The method below counts from 0 to 4.
# Modify the block so that it prints the current number
# and stops iterating when the current number equals 2.
5.times do |index|
  puts index
  break if index == 2
end

# First to Five
number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)

  next unless number_b == 5 || number_a == 5

  puts '5 was reached!'
  break
end

# Greeting
def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end
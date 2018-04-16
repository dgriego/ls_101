# Runaway Loop
# The code below is an example of an infinite loop.
# The name describes exactly what it does: loop infinitely.
# This loop isn't useful in a real program, though.
# Modify the code so the loop stops after the first iteration.

loop do
  puts 'Just keep printing...'
  break
end

# Loopception
# The code below is an example of a nested loop.
# Both loops currently loop infinitely.
# Modify the code so each loop stops after the first iteration.

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break
  end

  break
end

puts 'This is outside all loops.'

# Control the Loop
# Modify the following loop so it iterates 5 times instead of just once.
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"

  break if iterations == 5

  iterations += 1
end

# Say Hello
# Modify the code below so "Hello!" is printed 5 times.
say_hello = 0

while say_hello < 5
  puts 'Hello!'
  say_hello += 1
end

# Print While
numbers = (0..99).to_a
iterations = 0

while iterations < 5
  puts numbers.sample
  iterations += 1
end

# another example of doing the same thing
numbers = []

while numbers.size < 5
  numbers << rand(100)
end

puts numbers

# Count Up
# The following code outputs a countdown from 10 to 1.
# Modify the code so that it counts from 1 to 10 instead.
count = 1
until count > 10
  count += 1
  puts count
end

count = 10
until count <= 0
  puts count
  count -= 1
end

# Print Until
# Given the array of several numbers below,
# use an until loop to print each number.
numbers = [7, 9, 13, 25, 18]
count = 0

until count == numbers.size
  puts numbers[count]
  count += 1
end

# That's Odd
for i in 1..100
  # puts i if i % 2 > 0
  # or
  puts i if i.odd?
end

# Greet Your Friends
# Your friends just showed up! Given the following array of names,
# use a for loop to greet each friend individually.
friends = ['Sarah', 'John', 'Hannah', 'Dave']

for name in friends
  puts "Hello, #{name}"
end
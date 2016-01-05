# Exercises: Easy 1

# Question 1
puts "Question 1".center(30, '-')
numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers # => [1, 2, 3]

# Question 2
# Describe the difference between ! and ? in Ruby.
# And explain what would happen in the following scenarios:
# 1. what is != and where should you use it?
# 2. put ! before something, like !user_name
# 3. put ! after something, like words.uniq!
# 4. put ? before something
# 5. put ? after something
# 6. put !! before something, like !!user_name

puts "Question 2".center(30, '-')
# != you would use to check if a value is not a certain value:
loop do
  puts "Would you like to play again?(y/n)"
  play_again = gets.chomp.downcase
  break if play_again != 'y'
end

# putting ! before something would be checking if a value is falsy:
arr = nil
if !arr
  puts "This arr is empty"
end

# putting ! after something usually is part of the method name
# putting ? before is used as a ternary operator
# putting ? after something is also part of the method name
# putting !! before something is a double negative and is like saying not not
val = false
if !val
  puts "value is false"
elsif !!val
  puts "this value is true"
end

val = true
if !val
  puts "value is false"
elsif !!val
  puts "this value is true"
end

puts "Question 3".center(30, '-')
# Replace the word "important" with "urgent" in this string:
advice = "Few things in life are as important as house training your pet dinosaur."
advice.gsub!('important', 'urgent')
puts advice

puts "Question 4".center(30, '-')
# What does the follow method calls
# do (assume we reset numbers to the original array between method calls)?
numbers = [1, 2, 3, 4, 5]
numbers.delete_at(1) # deletes at index 1
puts numbers.inspect

numbers = [1, 2, 3, 4, 5]
numbers.delete(1) # deletes the value 1
puts numbers.inspect

puts "Question 5".center(30, '-')
# Programmatically determine if 42 lies between 10 and 100.
puts (10..100).cover?(42)

puts "Question 6".center(30, '-')
# show two different ways to put the expected "Four score and " in front of it.
famous_words = "seven years ago..."
famous_words.prepend("Four score and ")
puts famous_words

four_score = "Four score and "
famous_words = "seven years ago..."
puts four_score << famous_words

puts "Question 7".center(30, '-')
def add_eight(number)
  number + 8
end

number = 2

how_deep = "number"
5.times { how_deep.gsub!("number", "add_eight(number)") }

p how_deep
# If we take advantage of Ruby's Kernel#eval
# method to have it execute this string as if it were a "recursive" method call
puts eval(how_deep) # => will evaluate the methods within the string

puts "Question 8".center(30, '-')
flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]
# Make this into an un-nested array.
puts flintstones.flatten!.inspect

puts "Question 9".center(30, '-')
flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
p flintstones.assoc("Barney")

puts "Question 10".center(30, '-')
# Turn this array into a hash where the names are the
# keys and the values are the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
h = {}
flintstones.each_with_index { |v, i| h[v] = i }
puts h

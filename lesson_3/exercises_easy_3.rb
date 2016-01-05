# Exercises: Easy 3

# Question 1
# Show an easier way to write this array:
puts "Question 1".center(30, '-')
flintstones = ["Fred", "Barney", "Wilma", "Betty", "BamBam", "Pebbles"]
flintstones_simple = %w(Fred Barney Wilman Betty BamBam Pebbles)
puts " %w(Fred Barney Wilman Betty BamBam Pebbles)"

# Question 2
# How can we add the family pet "Dino" to our usual array:
puts "Question 2".center(30, '-')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones << "Dino"
p flintstones

# Question 3
# How can we add multiple items to our array? (Dino and Hoppy)
puts "Question 3".center(30, '-')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.push('Dino', 'Hoppy')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.concat(%w(Dino Hoppy))
p flintstones

# Question 4
# Shorten this sentence:
puts "Question 4".center(30, '-')
advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(39..(advice.length))

advice = "Few things in life are as important as house training your pet dinosaur."
advice.slice!(0, advice.index('house'))
puts advice

# Question 5
# Write a one-liner to count the number of
# lower-case 't' characters in the following string:
puts "Question 5".center(30, '-')
statement = "The Flintstones Rock!"
p statement.scan('t').count

# Question 6
puts "Question 6".center(30, '-')
# Back in the stone age (before CSS) we used spaces to
# align things on the screen. If we had a 40 character
# wide table of Flintstone family members,
# how could we easily center that title above the table with spaces?
title = "Flintstone Family Members"
puts title.center(40)

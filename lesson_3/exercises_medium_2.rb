# Exercises: Medium 2

# Question 1
# Figure out the total age of just the male members of the family.
puts "Question 1".center(30, '-')
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" }
}
arr = []
munsters.values.each do |person|
  arr << person["age"] if person["gender"] == "male"
end
puts arr.inject(:+)

age_total = 0
munsters.values.each do |person|
  age_total += person["age"] if person["gender"] == "male"
end

# Question 2
# Given this previously seen family hash,
# print out the name, age and gender of each family member:
# (Name) is a (age) year old (male or female).
puts "Question 2".center(30, '-')
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |person|
  puts "#{person[0]} is a #{person[1]["age"]} year old #{person[1]["gender"]}"
end

# munsters.each_pair do |name, details|
#   puts "#{name} is a #{details['age']} year old #{details['gender']}"
# end

# Question 3
# How can we refactor this exercise to make
# the result easier to predict and easier
# for the next programmer to maintain?
puts "Question 3".center(30, '-')
def add_rutabaga!(param)
  if param.class == Array
    param << "rutabaga"
  else
    param.concat(" rutabaga")
  end
end

string = "pumpkins"
add_rutabaga!(string)
puts "My string looks like this now: #{string}"

array = ["pumpkins"]
add_rutabaga!(array)
puts "My array looks like this now: #{array}"

# Question 4
# Use this technique to break up the following string
# and put it back together with the words in reverse order:
puts "Question 4".center(30, '-')
sentence = "Humpty Dumpty sat on a wall."
puts sentence
puts sentence.split(" ").reverse.join(" ")

# Question 5
# What is the output of the following code?
puts "Question 5".center(30, '-')
answer = 42

def mess_with_it(some_number)
  some_number += 8
end

new_answer = mess_with_it(answer)

p answer - 8
# guess => 34

# Question 6
# Did the family's data get ransacked, or did
# the mischief only mangle a local copy of the original hash? (why?)
puts "Question 6".center(30, '-')
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

def mess_with_demographics(demo_hash)
  demo_hash.values.each do |family_member|
    family_member["age"] += 42
    family_member["gender"] = "other"
  end
end

mess_with_demographics(munsters)
# because the each method returns a new hash

# Question 7
# Method calls can take expressions as arguments.
# Suppose we define a function called rps as follows,
# which follows the classic rules of rock-paper-scissors game,
# but with a slight twist that it declares whatever
# hand was used in the tie as the result of that tie.
puts "Question 7".center(30, '-')
def rps(fist1, fist2)
  if fist1 == "rock"
    (fist2 == "paper") ? "paper" : "rock"
  elsif fist1 == "paper"
    (fist2 == "scissors") ? "scissors" : "paper"
  else
    (fist2 == "rock") ? "rock" : "scissors"
  end
end

puts rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# paper rock
# paper
# paper

# Question 8
# What would be the output of this code:
puts "Question 8".center(30, '-')
def foo(param = "no")
  "yes"
end

def bar(param = "no")
  param == "no" ? "yes" : "no"
end

puts bar(foo)

# Exercises: Medium 1

# Question 1
# For this exercise, write a one-line program
# that creates the following output 10 times,
# with the subsequent line indented 1 space to the right:
puts "Question 1".center(30, '-')
phrase = 'The Flintstones Rock!'
indent = phrase.length
10.times do
  puts phrase.rjust(indent += 1)
end

# Question 2
# Create a hash that expresses the frequency
# with which each letter occurs in this string:
puts "Question 2".center(30, '-')
statement = "The Flintstones Rock"
flintstones_hash = {}
statement.chars.each do |c|
  flintstones_hash[c] = statement.scan(c).count
end
p flintstones_hash

# Question 3
# The result of the following statement will be an error:
puts "Question 3".center(30, '-')
# puts "the value of 40 + 2 is " + (40 + 2)
# because its implicitly trying convert an integer into a string
# fix #1
puts "the value of 40 + 2 is #{40 + 2}"
puts "the value of 40 + 2 is " + (40 + 2).to_s

# Question 4
# What happens when we modify an array while
# we are iterating over it? What would be output by this code?
puts "Question 4".center(30, '-')
numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end # => 1 3

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end # => 1 2

# Question 5
# Alan wrote the following method, which was
# intended to show all of the factors of the input number:
puts "Question 5".center(30, '-')
def factors(number)
  dividend = number
  divisors = []
  while dividend > 0 do
    divisors << number / dividend if number % dividend == 0
    dividend -= 1
    puts dividend.integer?
  end
  divisors
end
p factors(10)

# Question 7
# Alan wrote the following method, which was
# intended to show all of the factors of the input number:
puts "Question 7".center(30, '-')
limit = 15

def fib(first_num, second_num, limit)
  while second_num < limit
    sum = first_num + second_num
    first_num = second_num
    second_num = sum
  end
  sum
end

result = fib(0, 1, 20)
puts "result is #{result}"

# Question 8
# Write your own version of the rails titleize implementation.
puts "Question 8".center(30, '-')
def titleize(phrase)
  phrase.split.each do |word|
    word.capitalize!
  end.join(" ")
end

puts titleize("I ate a burrito yesterday, wait.. no I didn't.")

# Question 9
# Given the munsters hash below
# Modify the hash such that each member of the
# Munster family has an additional "age_group"
# key that has one of three values describing
# the age group the family member is in (kid, adult, or senior).
# Note: a kid is in the age range 0 - 17,
# an adult is in the range 18 - 64 and a senior is aged 65+.
puts "Question 9".center(30, '-')
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.values.each do |person|
  if person["age"] < 17
    person["age_group"] = "kid"
  elsif person["age"] > 65
    person["age_group"] = "senior"
  else
    person["age_group"] = "adult"
  end
end

puts munsters


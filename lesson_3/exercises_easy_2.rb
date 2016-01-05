# Exercises: Easy 1

# Question 1
# see if there is an age present for "Spot".
puts "Question 1".center(30, '-')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.key?("Spot")
p ages.member?("Spot")
p ages.include?("Spot")

# Question 2
# Add up all of the ages from our current Munster family hash:
puts "Question 2".center(30, '-')
ages_arr = []
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.each_value do |age|
  ages_arr << age
end
puts ages_arr.inject(:+)

ages.values.inject(:+)

# Question 3
# throw out the really old people (age 100 or older).
puts "Question 3".center(30, '-')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
p ages.select { |_, v| v < 100 }
ages.keep_if { |name, age| age < 100 }
p ages

# Question 4
puts "Question 4".center(30, '-')
munsters_description = "The Munsters are creepy in a good way."
puts munsters_description.capitalize
puts munsters_description.swapcase
puts munsters_description.downcase
puts munsters_description.upcase

# Question 5
# add ages for Marilyn and Spot to the existing hash
puts "Question 5".center(30, '-')
additional_ages = { "Marilyn" => 22, "Spot" => 237 }
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
ages.merge!(additional_ages)
p ages

# Question 6
# Pick out the minimum age from our current Munster family hash:
puts "Question 6".center(30, '-')
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
p ages.values.min

# Question 7
# See if the name "Dino" appears in the string below:
puts "Question 7".center(30, '-')
advice = "Few things in life are as important as house training your pet dinosaur."
puts advice.include?('dino')
puts advice.match('dino')

# Question 8
# Find the index of the first name that starts with "Be"
puts "Question 8".center(30, '-')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
p flintstones.index { |name| name[0, 2] == 'Be' }

# Question 9
# Using array#map!, shorten each of these names to just 3 characters:
puts "Question 9".center(30, '-')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! do |name|
  name[0, 3]
end
p flintstones

# Question 10
# Again, shorten each of these names to just
# 3 characters -- but this time do it all on one line:
puts "Question 10".center(30, '-')
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }
p flintstones

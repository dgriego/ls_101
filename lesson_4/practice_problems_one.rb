# Turn this array into a hash where the names are the keys and the values are
# the positions in the array.
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_hsh = {}
flintstones.each_with_index do |name, index|
  new_hsh[name] = index
end

# Add up all of the ages from the Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.values.sum

# throw out the really old people (age 100 or older).
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
ages.delete_if do |_, age|
  age > 100
end

ages.keep_if { |_, age| age < 100 }

# Pick out the minimum age from our current Munster family hash:
ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
ages.values.min

# Find the index of the first name that starts with "Be"
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.index { |name| name[0, 2] == 'Be' }

# Amend this array so that the names are all shortened
# to just the first three characters:
flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
flintstones.map! { |name| name[0, 3] }

# Create a hash that expresses the frequency with
# which each letter occurs in this string:
statement = "The Flintstones Rock"
statement.chars.each_with_object({}) do |char, obj|
  next if char == ' '

  if obj[char]
    obj[char] += 1
  else
    obj[char] = 1
  end
end

# Write your own version of the rails titleize implementation.
words = "the flintstones rock"

def titleize(str)
  str.split.map { |word| word.capitalize }.join(' ')
end

# Modify the hash such that each member of the Munster family has an additional
# "age_group" key that has one of three values describing the age group the
# family member is in (kid, adult, or senior).
munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |name, info|
  age_group = 'age_group'

  if info['age'] > 65
    munsters[name][age_group] = 'senior'
  elsif info['age'] < 17
    munsters[name][age_group] = 'kid'
  else
    munsters[name][age_group] = 'adult'
  end
end
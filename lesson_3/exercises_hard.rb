# Exercises: Hard

# Each UUID consists of 32 hexadecimal characters, and is
# typically broken into 5 sections
# like this 8-4-4-4-12 and represented as a string.
# It looks like this: "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"
# Write a method that returns one UUID when called with no parameters.

# attempt
def generate_uuid
  chars = ('a'..'f').to_a + ('1'..'9').to_a

  "#{chars.sample(8).join}-#{chars.sample(4).join}-#{chars.sample(4).join}-" \
  "#{chars.sample(4).join}-#{chars.sample(12).join}"
end

# solution
def generate_uuid
  characters = []
  (0..9).each { |digit| characters << digit.to_s }
  ('a'..'f').each { |digit| characters << digit }

  uuid = ''
  sections = [8, 4, 4, 4, 12]
  sections.each_with_index do |section, index|
    section.times { uuid += characters.sample }
    uuid += '-' unless index >= sections.size - 1
  end

  uuid
end

def dot_separated_ip_address?(input_string)
  (input_string =~ /\A\d+\.\d+\.\d+\.\d+$/) == 0 ? true : false
end

# "f65c57f6-a6aa-17a8-faa1-a67f2dc9fa91"

def create_uuid
  characters = [('1'..'9').to_a, ('a'..'z').to_a].flatten
  sections = [8, 4, 4, 4, 12]

  uuid = sections.map do |size|
    section = ''
    size.times { section << characters.sample }
    section
  end

  uuid.join('-')
end

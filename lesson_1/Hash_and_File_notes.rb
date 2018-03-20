# {}.each
#   - will iterate through each element in the Hash and will return
#.  - the Hash objects value that is invoking the each method
# {}.map
#.  - will iterate through each element in the Hash and will return
#.  - a new Hash object with elements being the return value evaluated block
# {}.fetch(:key)
#   - fetch will return the keys value if it exists otherwise
#     it will return a KeyError or return the Object
#     that was passed as the second argument
# {}.to_a
#.  - the to_a instanc method will convert the Hash into an array of arrays
#.    with the arrays being the key value and the value the key is storing
# {}.select
#.  - will iterate through each element in the Hash and will return a new
#.    Hash with the elements in the Hash that are returned as a result
#.    of the blocks expression evaluating to a True value
# {}.has_key?(:key)
#   - similar to fetch with the exception that has_key returns a Boolean(?)

# what is a File?
# represent digital information that exists on durable storage

# code helps us express data in memory

# Files
# JSON, CSV, XML/HTML, and XLS

# File.new(filename, mode="r")
#   - by deafult creates a File with read-only permissions
#.  - read only starts at the beginning of the file
my_file = File.new("simple_file.txt", "w+")

# always close files because if not they will occupy space in memory
my_file.close

# r: read-only - starts at beginning of file
# r+: Read-write - starts at beginning of file
# w: Write-only - erase contents of file or creates new file for writing
# w+: Read-write - erase contents of file or creates new file for reading and writing
# a: Write-only - appends data at end of file or creates new file for writing
# a+: Read-write - appends data at end of file or creates new file for reading and writing

# open a File
File.open("simple_file.txt", "w").close

# open a file and perform operations on it while it is open
File.open("simple_file.txt", "w+") do |file|
  file.write("adding first line of text\n")
  file << "hey whatsup\n"
  file.puts('another way to write text to a file')
end # file closes at the end of the block

# returns array of each line in the file
# each new line is represented by the \n character
File.readlines("simple_file.txt")
File.readlines("simple_file.txt").each { |line| puts line }
File.readlines("simple_file.txt").each_with_index { |line, line_num| puts "#{line_num}: #{line}" }

# finally we can delete a file
File.delete("simple_file.txt")

# Files rule everything!!!!!!!!!!!!

# File is a subclass of IO

# Pathname
# The goal of this class is to manipulate file path information
# in a neater way than standard Ruby provides.
# The examples below demonstrate the difference.
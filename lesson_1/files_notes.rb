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
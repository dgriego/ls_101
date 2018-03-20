num_arr = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# num_arr.each do |num|
#   puts num
# end

# num_arr.each do |num|
#   puts num if num > 5
# end

odd_numbers = num_arr.select do |num|
  num if num.odd?
end

num_arr.push(11)

num_arr.unshift(0)

num_arr.pop
num_arr << 3

num.uniq

h = {a:1, b:2, c:3, d:4}

h.delete_if do |key, value|
  value < 3.5
end

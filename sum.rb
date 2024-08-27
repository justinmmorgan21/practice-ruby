arr = [5, 2, 6, 1, 3, 4]
# sum = 0
# arr.each { |num|
#   sum += num
# }
# sum = arr.reduce(:+)
sum = arr.sum
puts "Sum: #{sum}"
puts "Average: #{sum/arr.length}, but it should be #{sum.to_f/arr.length}"

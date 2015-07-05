# The sum of the squares of the first ten natural numbers is:
# 12 + 22 + ... + 102 = 385
#
# The square of the sum of the first ten natural numbers is:
# (1 + 2 + ... + 10)2 = 552 = 3025
#
# Hence the difference between the sum of the squares of the first ten natural
# numbers and the square of the sum is 3025 − 385 = 2640.
#
# Find the difference between the sum of the squares of the first one hundred
# natural numbers and the square of the sum.

def sum_squares(n)
  (1..n).to_a.inject { |sum, i| sum += i**2 }
end

def square_sum(n)
  (1..n).to_a.inject(&:+) ** 2
end

if __FILE__ == $PROGRAM_NAME
  puts (sum_squares(100) - square_sum(100)).abs
end

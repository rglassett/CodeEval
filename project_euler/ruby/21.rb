# Let d(n) be defined as the sum of proper divisors of n (numbers less than n
# which divide evenly into n).  If d(a) = b and d(b) = a, where a ≠ b, then a and
# b are an amicable pair and each of a and b are called amicable numbers.
#
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55
# and 110; therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and
# 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

require 'set'

def proper_divisors(num)
  divisors = Set.new [1]
  (2..(num ** (0.5)).ceil).each do |i|
    if num % i == 0
      divisors.add(i)
      divisors.add(num/i)
    end
  end
  divisors.to_a
end

def d(n)
  proper_divisors(n).inject(&:+)
end

def amicable_number?(a)
  b = d(a)
  a == d(b) && a != b
end

def get_amicable_numbers(max)
  amicable_numbers = []
  (1..max).each do |i|
    amicable_numbers << i if amicable_number?(i)
  end
  amicable_numbers
end

puts get_amicable_numbers(10000).inject(&:+)

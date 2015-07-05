# A perfect number is a number for which the sum of its proper divisors is
# exactly equal to the number. For example, the sum of the proper divisors of 28
# would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n
# and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest
# number that can be written as the sum of two abundant numbers is 24. By
# mathematical analysis, it can be shown that all integers greater than 28123 can
# be written as the sum of two abundant numbers. However, this upper limit cannot
# be reduced any further by analysis even though it is known that the greatest
# number that cannot be expressed as the sum of two abundant numbers is less than
# this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of
# two abundant numbers.

def proper_divisors(number)
  return [] if number == 1
  divisors = [1]

  2.upto(number ** (0.5)) do |i|
    if number % i == 0
      divisors << i
      divisors << (number / i) unless (number / i) == i
    end
  end

  divisors
end

def is_abundant?(number)
  proper_divisors(number).inject(&:+) > number
end

if __FILE__ == $PROGRAM_NAME
  abundant_numbers = (12..28123).select { |x| is_abundant?(x) }
  possible_numbers = Set.new
  (1..28123).each { |x| possible_numbers.add(x) }

  abundant_numbers.each do |num|
    i = 0
    while num + abundant_numbers[i] <= 28123
      possible_numbers.delete(num + abundant_numbers[i])
      i += 1
    end
  end

  puts possible_numbers.to_a.inject(&:+)
end

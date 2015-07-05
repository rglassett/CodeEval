# 2520 is the smallest number that can be divided by each of the numbers from 1
# to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the
# numbers from 1 to 20?

def prime_factors(n)
  number = n
  sqrt_n = (number ** (0.5)).ceil
  factors = []
  (2..sqrt_n).to_a.each do |test|
    break if number == 1
    while number % test == 0
      factors << test
      number = number / test
    end
  end

  if factors.size == 0
    factors << 1
    factors << n
  end

  factors
end

if __FILE__ == $PROGRAM_NAME
  all_factors = []

  (1..20).to_a.each do |n|
    n_factors = prime_factors(n)
    n_factors.each do |f|
      while all_factors.count(f) < n_factors.count(f)
        all_factors << f
      end
    end
  end

  puts all_factors.inject(&:*)
end

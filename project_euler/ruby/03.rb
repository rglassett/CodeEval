# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143?

def prime_factors(num)
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
    factors << original
  end

  factors
end

if __FILE__ == $PROGRAM_NAME
  puts prime_factors(600851475143).last
end

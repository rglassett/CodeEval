# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that
# the 6th prime is 13.
#
# What is the 10 001st prime number?

def is_prime?(n)
  return true if n == 2
  sqrt_n = (n ** (0.5)).ceil
  (2..sqrt_n).to_a.each do |i|
    return false if n % i == 0
  end
  true
end

if __FILE__ == $PROGRAM_NAME
  primes = []
  i = 2

  while primes.size < 10001
    primes << i if is_prime?(i)
    i += 1
  end

  puts primes[-1]
end

require 'prime'

def prime_sum(num_primes)
  Prime.first(num_primes).inject(&:+)
end

if __FILE__ == $PROGRAM_NAME
  puts prime_sum(1000)
end

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
#
# Find the sum of all the primes below two million.

require 'prime'

def primes_upto(n)
  ary = []
  Prime.each(n) do |prime|
    ary << prime
  end
  ary
end

if __FILE__ == $PROGRAM_NAME
  puts primes_upto(2*10**6).inject(&:+)
end

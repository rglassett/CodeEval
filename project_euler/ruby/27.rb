# n**2 + an + b, where |a| < 1000 and |b| < 1000
# find the product of a and b for the expression that produces
# the maximum number of primes for consecutive values of n,
# starting with n = 0

require 'prime'

best_coefficients = [0, 0]
most_consecutive_primes = 0

(-999..999).to_a.each do |a|
  (-999..999).to_a.each do |b|
    n = 0
    consecutive_primes = 0
    while true
      res = a**2 + a*n + b
      if Prime.prime?(res)
        consecutive_primes +=1
        n += 1
      else
        break
      end
    end
    if consecutive_primes > most_consecutive_primes
      best_coefficients = [a, b]
      most_consecutive_primes = consecutive_primes
    end
  end
end

puts most_consecutive_primes
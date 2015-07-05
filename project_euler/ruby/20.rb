# n! means n × (n − 1) × ... × 3 × 2 × 1
#
# For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800, and the sum of the
# digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
#
# Find the sum of the digits in the number 100!

def factorial(n)
  if n <= 1
    n
  else
    n * factorial(n - 1)
  end
end

def sum_digits(n)
  ary = n.to_s.split(//).map { |el| el.to_i }
  ary.inject(&:+)
end

puts sum_digits(factorial(100))

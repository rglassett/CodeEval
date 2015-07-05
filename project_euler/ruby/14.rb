# The following iterative sequence is defined for the set of positive integers:
#
# n → n/2 (n is even) n → 3n + 1 (n is odd)
#
# Using the rule above and starting with 13, we generate the following sequence:
#
# 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1 It can be seen that this sequence
# (starting at 13 and finishing at 1) contains 10 terms. Although it has not been
# proved yet (Collatz Problem), it is thought that all starting numbers finish at
# 1.
#
# Which starting number, under one million, produces the longest chain?
#
# NOTE: Once the chain starts the terms are allowed to go above one million.

def collatz(n)
  ary = [n]
  while true
    return ary if ary[-1] == 1
    n.even? ? n = n / 2 : n = 3 * n + 1
    ary << n
  end
  ary
end

longest_collatz = 0
longest_start = 1

(1..10**6).each do |i|
  if collatz(i).size > longest_collatz
    longest_collatz = collatz(i).size
    longest_start = i
  end
end

puts longest_start

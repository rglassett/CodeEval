# A Pythagorean triplet is a set of three natural numbers, a < b < c, for which:
# a^2 + b^2 = c^2
# For example, 32 + 42 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.

def euler9
  (1..998).to_a.each do |a|
    sum_bc = 1000 - a
    (1..sum_bc - 1).to_a.each do |b|
      c = sum_bc - b
      if a**2 + b**2 == c**2
        return a * b * c
      end
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  puts euler9
end

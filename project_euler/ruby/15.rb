# Starting in the top left corner of a 2×2 grid, and only being able to move to
# the right and down, there are exactly 6 routes to the bottom right corner.  How
# many such routes are there through a 20×20 grid?

# It turns out that the number of lattice paths for a grid of size n can be
# found in the (2 * n)th row and the nth column of Pascal's Triangle.
#
# The number at row n and column k of the triangle is given by the polynomial
# coefficient nCk ("n choose k").

def factorial(n)
  unless n.is_a?(Integer) && n >= 0
    raise "Must take the factorial of a non-negative integer!"
  end
  return 1 if n == 0
  n.downto(1).inject(&:*)
end

def triangle_number(n)
  polynomial_coefficient(n, n / 2)
end

def polynomial_coefficient(n, k)
  factorial(n) / (factorial(n - k) * factorial(k))
end

def lattice_paths(n)
  triangle_number(2 * n)
end

if __FILE__ == $PROGRAM_NAME
  puts lattice_paths(2) # => 6
  puts lattice_paths(3) # => 20
  puts lattice_paths(20) # => 137846528820
end

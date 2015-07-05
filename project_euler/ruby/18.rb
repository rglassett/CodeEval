# By starting at the top of the triangle below and moving to adjacent numbers on
# the row below, the maximum total from top to bottom is 23.

# See sources/euler18a.txt

# That is, 3 + 7 + 4 + 9 = 23.
#
# Find the maximum total from top to bottom of the triangle below:

# See sources/euler18.txt

# NOTE: As there are only 16384 routes, it is possible to solve this problem by
# trying every route. However, Problem 67, is the same challenge with a triangle
# containing one-hundred rows; it cannot be solved by brute force, and requires a
# clever method! ;o)

def maximum_path_sum(triangle, (row, col))
  return triangle[row][col] if row == triangle.length - 1
  next_positions = [[row + 1, col], [row + 1, col + 1]]
  next_positions.select! { |x| in_range?(triangle, x) }
  next_positions.map! { |x| maximum_path_sum(triangle, x) }
  triangle[row][col] + next_positions.max
end

def in_range?(triangle, (row, col))
  row.between?(0, triangle.length) && col.between?(0, triangle[row].length)
end

def read_triangle(filename)
  File.readlines(filename).map do |line|
    line.chomp.split(" ").map { |i| i.to_i }
  end
end

if __FILE__ == $PROGRAM_NAME
  triangle = read_triangle('sources/euler18.txt')
  puts maximum_path_sum(triangle, [0, 0])
end

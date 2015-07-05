require 'byebug'
# In the 20×20 grid below, four numbers along a diagonal line have been marked
# in red.
#
# (see grid in sources/euler11.txt)
#
# The product of these numbers is 26 × 63 × 78 × 14 = 1788696.
#
# What is the greatest product of four adjacent numbers in the same direction
# (up, down, left, right, or diagonally) in the 20×20 grid?

def greatest_product(grid)
  products = all_combinations(grid).map do |combo|
    combo.inject(&:*)
  end
  products.max
end

def all_combinations(grid)
  combos = []
  combos += horizontal_combos(grid)
  combos += vertical_combos(grid)
  combos += diagonal_combos(grid)
  combos += other_diagonals(grid)
  combos
end

def horizontal_combos(grid)
  combos = []
  grid.each_with_index do |row, i|
    (0..row.length - 4).each do |j|
      combos << row[j..j + 3]
    end
  end
  combos
end

def diagonal_combos(grid)
  combos = []
  (0..grid.length - 4).each do |i|
    (0..grid[0].length - 4).each do |j|
      combos << [
        grid[i][j],
        grid[i + 1][j + 1],
        grid[i + 2][j + 2],
        grid[i + 3][j + 3]
      ]
    end
  end
  combos
end

def other_diagonals(grid)
  flipped_grid = grid.map(&:reverse)
  diagonal_combos(flipped_grid)
end

def vertical_combos(grid)
  horizontal_combos(grid.transpose)
end

def read_grid(filename)
  File.readlines(filename).map do |line|
    line.chomp.split(" ").map(&:to_i)
  end
end

if __FILE__ == $PROGRAM_NAME
  grid = read_grid('sources/euler11.txt')
  puts greatest_product(grid)
end

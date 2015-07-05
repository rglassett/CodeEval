# Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:
#
# 21 22 23 24 25
# 20  7  8  9 10
# 19  6  1  2 11
# 18  5  4  3 12
# 17 16 15 14 13
#
# It can be verified that the sum of the numbers on the diagonals is 101.
#
# What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?

def spiral_count(largest_side)
  spiral_nums = [1]
  side_length = 3
  while side_length <= largest_side
    4.times do
      spiral_nums << spiral_nums[-1] + (side_length - 1)
    end
    side_length += 2
  end
  spiral_nums
end

if __FILE__ == $PROGRAM_NAME
  p spiral_count(1001).inject(&:+)
end

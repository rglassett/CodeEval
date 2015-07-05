# def lcs(numbers)
#   # Naive solution; calculate every possible subsum
#   # O(N^2) time, O(1) memory
#   best_subsum = nil
#   (0...numbers.length - 1).each do |i|
#     (i...numbers.length).each do |j|
#       current_subsum = numbers[i..j].inject(&:+)
#       if best_subsum.nil? || current_subsum > best_subsum
#         best_subsum = current_subsum
#       end
#     end
#   end
#
#   best_subsum
# end

def lcs(numbers)
  # Optimized solution; O(n) time, O(1) memory
  best, sum = 0, 0

  numbers.each_index do |i|
    sum += numbers[i]
    if sum > best
      best = sum
    elsif sum < 0
      sum = 0
    end
  end

  best
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    numbers = line.split(",").map { |n| Integer(n) }
    puts lcs(numbers)
  end
end

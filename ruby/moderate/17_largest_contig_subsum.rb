def lcs(nums)
  # Naive solution; calculate every possible subsum
  # O(N^2) time, O(1) memory
  best_subsum = nil
  (0...nums.length - 1).each do |i|
    (i...nums.length).each do |j|
      current_subsum = nums[i..j].inject(&:+)
      if best_subsum.nil? || current_subsum > best_subsum
        best_subsum = current_subsum
      end
    end
  end

  best_subsum
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    nums = line.split(",").map(&:to_i)
    puts lcs(nums)
  end
end

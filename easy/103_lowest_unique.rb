def lowest_unique(nums)
  counts = Hash.new(0)
  nums.each do |num|
    counts[num] += 1
  end

  uniques = counts.select do |k, v|
    v == 1
  end

  if uniques.size > 0
    uniques.min_by { |k, _| k }.first
  else
    nil
  end
end

def winner(nums)
  n = lowest_unique(nums)
  if n
    nums.index(n) + 1
  else
    0
  end
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    numbers = line.split(" ").map(&:to_i)
    puts winner(numbers)
  end
end

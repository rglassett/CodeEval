def letter_counts(string)
  counts = Hash.new { |h, k| h[k] = 0 }
  string.each_char do |chr|
    counts[chr] += 1
  end
  counts
end

def first_non_repeated(string)
  counts = letter_counts(string)
  string.each_char do |chr|
    return chr if counts[chr] == 1
  end
  nil
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    puts first_non_repeated(line)
  end
end

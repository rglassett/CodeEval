def number_pairs(numbers, target)
  pairs = []

  (0...numbers.length - 1).each do |i|
    (i + 1...numbers.length).each do |j|
      if numbers[i] + numbers[j] == target
        pairs << [numbers[i], numbers[j]]
      end
    end
  end

  pairs
end

def format_pairs(pairs)
  pairs.empty? ? "NULL" : pairs.map { |pair| pair.join(",") }.join(";")
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    numbers, target = line.split(";")
    numbers = numbers.split(",").map { |n| Integer(n) }
    target = Integer(target)
    pairs = number_pairs(numbers, target)
    puts format_pairs(pairs)
  end
end

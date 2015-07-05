# numbers is an array of size n with elements from (0..n - 2)
# one element is duplicated.

def find_duplicate(length, numbers)
  expected_sum = 0
  sum = 0

  length.times do |i|
    expected_sum += i unless i == length - 1
    sum += numbers[i]
  end

  sum - expected_sum
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    length, numbers = line.split(";")
    length = Integer(length)
    numbers = numbers.split(",").map { |n| Integer(n) }
    puts find_duplicate(length, numbers)
  end
end

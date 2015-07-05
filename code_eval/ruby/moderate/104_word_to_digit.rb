CHAR_DIGITS = {
  "zero" => 0,
  "one" => 1,
  "two" => 2,
  "three" => 3,
  "four" => 4,
  "five" => 5,
  "six" => 6,
  "seven" => 7,
  "eight" => 8,
  "nine" => 9
}

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    digits = line.split(";")
    puts digits.map { |x| CHAR_DIGITS[x] }.join
  end
end

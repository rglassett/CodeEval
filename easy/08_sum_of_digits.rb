def sum_of_digits(num_string)
  num_string.split(//).map(&:to_i).inject(&:+)
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0])

  lines.each do |line|
    puts sum_of_digits(line)
  end
end

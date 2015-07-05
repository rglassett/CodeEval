if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    result = line.to_i.even? ? 1 : 0
    puts result
  end
end

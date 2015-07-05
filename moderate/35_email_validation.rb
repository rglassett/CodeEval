def valid_email?(string)
  !!string.match(Regexp.new('\w+@\w+\.\w+'))
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    puts valid_email?(line)
  end
end

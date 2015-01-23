def sum_from_file(filename)
  raise "Invalid filename" unless filename.is_a?(String)

  ints = File.readlines(filename).map do |line|
    line.chomp.to_i
  end

  ints.inject(&:+)
end

if __FILE__ == $PROGRAM_NAME
  puts sum_from_file(ARGV[0])
end

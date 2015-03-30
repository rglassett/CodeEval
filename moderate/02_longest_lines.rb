if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  count = lines.shift.to_i
  lines = lines.sort { |x, y| y.length <=> x.length }
  count.times do |i|
    puts lines[i]
  end
end

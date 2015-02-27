if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    puts line.split(" ").map(&:capitalize).join(" ")
  end
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0])

  lines.each do |line|
    puts line.downcase
  end
end

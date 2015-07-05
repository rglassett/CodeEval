if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    line = line.split(" ")
    m = line.pop.to_i

    i = line.length - m
    if i < 0
      puts
    else
      puts line[i]
    end
  end
end

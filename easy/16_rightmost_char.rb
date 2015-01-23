if __FILE__ == $PROGRAM_NAME
  File.readlines(ARGV[0]).each do |line|
    pair = line.chomp.split(',')
    result = pair[0].rindex(pair[1])
    puts result || -1
  end
end

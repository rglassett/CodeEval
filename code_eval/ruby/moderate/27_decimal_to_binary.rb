if __FILE__ == $PROGRAM_NAME
  numbers = File.readlines(ARGV[0]).map do |line|
    Integer(line.chomp)
  end

  numbers.each do |number|
    puts number.to_s(2)
  end
end

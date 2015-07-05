def one_bits(num)
  ones = 0

  until num == 0
    num, remainder = num.divmod(2)
    ones += 1 if remainder == 1
  end

  ones
end

if __FILE__ == $PROGRAM_NAME
  numbers = File.readlines(ARGV[0]).map do |line|
    Integer(line.chomp)
  end

  numbers.each do |number|
    puts one_bits(number)
  end
end

def armstrong?(number)
  num_digits = Math.log(number, 10).floor + 1
  current_number = number
  sum = 0

  until current_number == 0
    sum += (current_number % 10) ** num_digits
    current_number /= 10
  end

  number == sum
end

if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0]
  numbers = File.readlines(filename).map do |line|
    line.chomp.to_i
  end

  numbers.each do |number|
    if armstrong?(number)
      puts "True"
    else
      puts "False"
    end
  end
end

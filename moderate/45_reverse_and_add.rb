def reverse(number)
  reversed = number % 10

  until number < 10
    number /= 10
    reversed = (reversed * 10) + (number % 10)
  end

  reversed
end

def reverse_and_add(number)
  count = 0

  until number == reverse(number)
    number += reverse(number)
    count += 1
    raise "hell" if count > 1000
  end

  "#{count} #{number}"
end

if __FILE__ == $PROGRAM_NAME
  numbers = File.readlines(ARGV[0]).map do |line|
    Integer(line.chomp)
  end

  numbers.each do |number|
    puts reverse_and_add(number)
  end
end

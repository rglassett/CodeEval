def hex_to_decimal(num)
  values = {
    'a' => 10,
    'b' => 11,
    'c' => 12,
    'd' => 13,
    'e' => 14,
    'f' => 15
  }

  (0..10).each { |i| values[i.to_s] = i }

  order = 1
  decimal = 0
  num.reverse.each_char do |char|
    decimal += values[char] * order
    order *= 16
  end
  decimal
end

if __FILE__ == $PROGRAM_NAME
  nums = File.readlines(ARGV[0]).map(&:chomp)
  nums.each do |num|
    puts hex_to_decimal(num)
  end
end

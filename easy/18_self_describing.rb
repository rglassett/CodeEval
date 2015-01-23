def is_self_describing?(num)
  digits = num.to_s.split('').map(&:to_i)
  digits.each_with_index do |digit, i|
    return false unless digits.count(i) == digit
  end
  true
end

if __FILE__ == $PROGRAM_NAME
  nums = File.readlines(ARGV[0]).map { |line| line.chomp.to_i }
  nums.each do |num|
    puts is_self_describing?(num) ? 1 : 0
  end
end

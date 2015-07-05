def is_happy?(num)
  seen = Hash.new(false)

  until num == 1
    return false if seen.has_key?(num)
    seen[num] = true

    digits = num.to_s.split('').map(&:to_i)
    num = digits.inject(0) do |sum, digit|
      sum += (digit ** 2)
    end
  end

  true
end

if __FILE__ == $PROGRAM_NAME
  ints = File.readlines(ARGV[0]).map { |line| line.chomp.to_i }
  ints.each do |int|
    puts is_happy?(int) ? 1 : 0
  end
end

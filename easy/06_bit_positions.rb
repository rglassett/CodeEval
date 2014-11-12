def same_bits_at_positions(num, p1, p2)
  binary = num.to_s(2)
  p1 = binary.length - p1
  p2 = binary.length - p2

  binary[p1] == binary[p2]
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0])

  lines.each do |line|
    args = line.split(',').map(&:to_i)
    puts same_bits_at_positions(*args)
  end
end

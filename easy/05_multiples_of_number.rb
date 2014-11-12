def higher_multiple(x, n)
  while n < x
    n += n
  end
  n
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0])

  lines.each do |line|
    args = line.split(',').map(&:to_i)
    puts higher_multiple(*args)
  end
end

def n_mod_m(n, m)
  until n < m
    n -= m
  end
  n
end

if __FILE__ == $PROGRAM_NAME
  pairs = File.readlines(ARGV[0]).map do |line|
    line.chomp.split(',').map(&:to_i)
  end

  pairs.each do |n, m|
    puts n_mod_m(n, m)
  end
end

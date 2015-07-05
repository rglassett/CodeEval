def uniq_nums(filename)
  lists = File.readlines(filename).map do |line|
    line.chomp.split(',').map(&:to_i)
  end

  lists.each do |list|
    puts list.uniq.join(',')
  end
end

if __FILE__ == $PROGRAM_NAME
  uniq_nums(ARGV[0])
end

def reverse_groups(elements, group_size)
  reversed = []
  i = 0

  until i + group_size > elements.length
    reversed.concat(elements[i...i + group_size].reverse)
    i += group_size
  end

  reversed.concat(elements[i...elements.length])

  reversed
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    els, group_size = line.split(";")
    group_size = Integer(group_size)
    els = els.split(",").map { |el| Integer(el) }
    puts reverse_groups(els, group_size).join(",")
  end
end

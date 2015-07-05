def trailing_string?(str1, str2)
  return false if str2.length > str1.length

  str2.length.times do |i|
    return false unless str1[str1.length - i] == str2[str2.length - i]
  end

  true
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    str1, str2 = line.split(",")
    puts trailing_string?(str1, str2) ? 1 : 0
  end
end

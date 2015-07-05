def remove_characters(string, blacklist)
  blacklist_hash = {}
  blacklist.each_char do |chr|
    blacklist_hash[chr] = true
  end

  result = ""
  string.each_char do |chr|
    result << chr unless blacklist_hash.has_key?(chr)
  end
  result
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    string, blacklist = line.split(", ")
    puts remove_characters(string, blacklist)
  end
end

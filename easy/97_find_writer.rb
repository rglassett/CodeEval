if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    code, key = line.split("| ")
    author = ""
    key.split(" ").each do |num|
      author << code[(num.to_i - 1)]
    end
    puts author
  end
end

def reverse_words(sentence)
  sentence.split(" ").reverse.join(" ")
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0])
  lines.each do |line|
    puts reverse_words(line)
  end
end

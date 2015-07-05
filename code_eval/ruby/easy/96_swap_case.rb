CHARMAP = {}

("a".."z").each do |ltr|
  CHARMAP[ltr] = ltr.upcase
  CHARMAP[ltr.upcase] = ltr
end

def swap_case(chr)
  CHARMAP.has_key?(chr) ? CHARMAP[chr] : chr
end

def swap_sentence(sentence)
  sentence.length.times do |i|
    sentence[i] = swap_case(sentence[i])
  end
  sentence
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    puts swap_sentence(line)
  end
end

require 'set'

$ALPHABET = Set.new

("a".."z").each do |letter|
  $ALPHABET << letter
end

("A".."Z").each do |letter|
  $ALPHABET << letter
end

def maximum_beauty(sentence)
  hash = letters_by_frequency(sentence)
  pairs = hash.to_a.sort do |x, y|
    y.last <=> x.last
  end

  maximum_beauty = 0
  current_letter_value = 26

  pairs.each do |(_, count)|
    maximum_beauty += count * current_letter_value
    current_letter_value -= 1
  end

  maximum_beauty
end

def letters_by_frequency(sentence)
  freqs = Hash.new(0)
  sentence.each_char do |chr|
    if $ALPHABET.include?(chr)
      freqs[chr.downcase] += 1
    end
  end
  freqs
end

if __FILE__ == $PROGRAM_NAME
  sentences = File.readlines(ARGV[0]).map(&:chomp)
  sentences.each { |sentence| puts maximum_beauty(sentence) }
end

class PangramFinder
  ALPHABET = ("a".."z")

  attr_reader :alphabet

  def initialize
    build_alphabet
  end

  def build_alphabet
    @alphabet = Hash.new(false)
    ALPHABET.each { |ltr| @alphabet[ltr] = true }
  end

  def missing
    (alphabet.keys - seen.keys).sort
  end

  def result
    missing.empty? ? "NULL" : missing.join("")
  end

  def run(sentence)
    @seen = Hash.new(false)

    sentence.length.times do |i|
      chr = sentence[i]
      if alphabet[chr] && !seen[chr]
        seen[chr] = true
      end
    end

    self
  end

  private

  attr_reader :seen
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  finder = PangramFinder.new
  lines.each do |line|
    puts finder.run(line).result
  end
end

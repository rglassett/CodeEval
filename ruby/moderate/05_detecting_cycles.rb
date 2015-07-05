class CycleFinder
  attr_reader :sequence, :cycle

  def initialize(sequence)
    @sequence = sequence
    run
  end

  def run
    # naive approach: look for first repeat from the end
    start = sequence.length - 1
    until sequence[start - 1] == sequence.last
      start -= 1
    end

    @cycle = sequence[start..-1]
  end
end

def format_cycle(sequence)
  CycleFinder.new(sequence).cycle.join(" ")
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    sequence = line.split(" ").map(&:to_i)
    puts format_cycle(sequence)
  end
end

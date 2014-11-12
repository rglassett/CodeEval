def get_args(file)
  lines = File.readlines(file)
  lines.map do |line|
    line.chomp.split(' ').map(&:to_i)
  end
end

def fizz_buzz(x, y, count)
  result = []
  1.upto(count) do |i|
    if (i % x == 0) && (i % y == 0)
      result << "FB"
    elsif i % x == 0
     result << "F"
    elsif i % y == 0
      result << "B"
    else
      result << i
    end
  end
  puts result.join(" ")
end

if __FILE__ == $PROGRAM_NAME
  get_args(ARGV[0]).each do |line|
    fizz_buzz(*line)
  end
end

require 'byebug'

def format(float_str)
  i = float_str.index(".")
  until float_str[i..-1].length == 3
    float_str = float_str + "0"
  end
  float_str
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    floats = line.split(" ").map(&:to_f)
    output = floats.sort.map do |float|
      format(float.to_s)
    end
    puts output.join(" ")
  end
end

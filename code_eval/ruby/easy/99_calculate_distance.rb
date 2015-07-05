def distance(point1, point2)
  x1, y1 = point1
  x2, y2 = point2

  Math.sqrt((x1 - x2) ** 2 + (y1 - y2) ** 2).floor
end

def parse_points(string)
  points = []

  until string.length == 0
    i = string.index("(")
    j = string.index(")")
    points << string[i + 1...j]
    string = string[j + 1..-1]
  end

  points.map { |point| parse_point(point) }
end

def parse_point(string)
  string.split(", ").map(&:to_i)
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    p1, p2 = parse_points(line)
    puts distance(p1, p2)
  end
end

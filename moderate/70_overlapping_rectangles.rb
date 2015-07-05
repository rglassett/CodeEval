class Rectangle
  attr_reader :left, :lower, :right, :upper

  def initialize(ulx, uly, lrx, lry)
    @upper, @left = uly, ulx
    @lower, @right = lry, lrx
  end

  def overlap?(other)
    raise "hell" unless other.is_a?(self.class)
    [lower, upper].any? { |y| y.between?(other.lower, other.upper) } &&
      [left, right].any? { |x| x.between?(other.left, other.right) }
  end
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    coords = line.split(",").map { |coord| Integer(coord) }
    a = Rectangle.new(*coords.take(4))
    b = Rectangle.new(*coords.drop(4))

    if a.overlap?(b)
      puts "True"
    else
      puts "False"
    end
  end
end

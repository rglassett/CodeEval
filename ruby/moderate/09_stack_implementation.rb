class Stack
  def initialize(elements = [])
    unless elements.is_a?(Array)
      raise "Must initialize stack from an Array"
    end
    @store = elements
  end

  def empty?
    @store.empty?
  end

  def push(el)
    @store.push(el)
  end

  def pop
    @store.pop
  end
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    stack = Stack.new(line.split(" "))
    first = true
    until stack.empty?
      print " " unless first
      first = false
      print stack.pop
      !stack.empty? && stack.pop
    end
    puts
  end
end

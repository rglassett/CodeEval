class QueryBoard
  def initialize
    @board = Array.new(256) { Array.new(256, 0) }
  end

  def set_row(i, x)
    @board[i].each_index do |j|
      @board[i][j] = x
    end
  end

  def set_col(j, x)
    @board.each_index do |i|
      @board[i][j] = x
    end
  end

  def query_row(i)
    sum = 0
    @board[i].each_index do |j|
      sum += @board[i][j]
    end
    puts sum
    sum
  end

  def query_col(j)
    sum = 0
    @board.each_index do |i|
      sum += @board[i][j]
    end
    puts sum
    sum
  end

  def execute(string)
    args = parse(string)
    case args.first
    when "SetRow"
      set_row(args[1], args[2])
    when "SetCol"
      set_col(args[1], args[2])
    when "QueryRow"
      query_row(args[1])
    when "QueryCol"
      query_col(args[1])
    end
  end

  def parse(string)
    args = string.split(" ")
    args.map.with_index do |el, i|
      i == 0 ? el : el.to_i
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  query_board = QueryBoard.new
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    query_board.execute(line)
  end
end

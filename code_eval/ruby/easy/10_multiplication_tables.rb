def multiplication_tables
  nums = (1..12).to_a
  matrix = []

  nums.each do |num|
    row = nums.map { |x| format_num(x * num) }
    matrix << row.join()
  end

  matrix
end

def format_num(num)
  num = num.to_s

  until num.length == 4
    num = " " + num
  end

  num
end


if __FILE__ == $PROGRAM_NAME
  puts multiplication_tables
end

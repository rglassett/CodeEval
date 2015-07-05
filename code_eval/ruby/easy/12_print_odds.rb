def print_odds(max)
  (1..max).step(2) do |i|
    puts i
  end
end

if __FILE__ == $PROGRAM_NAME
  print_odds(100)
end

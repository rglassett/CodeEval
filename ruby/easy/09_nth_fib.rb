def fibs(n)
  fibs = [0, 1]
  return fibs.take(n + 1) if n <= 1
  
  prev_fibs = fibs(n - 1)
  prev_fibs << (prev_fibs[-1] + prev_fibs[-2])
end

def nth_fib(n)
  fibs(n).last
end

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0])

  lines.each do |line|
    puts nth_fib(line.to_i)
  end
end

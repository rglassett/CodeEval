class PrimeGenerator
  attr_reader :primes

  def initialize(n)
    generate(n)
  end

  def generate(n)
    @primes = (2...n).to_a
    (2..Math.sqrt(n)).each { |i| sieve(i) }
  end

  def sieve(n)
    primes.reject! { |num| num > n && num % n == 0 }
  end
end

if __FILE__ == $PROGRAM_NAME
  maxima = File.readlines(ARGV[0]).map do |line|
    Integer(line.chomp)
  end

  primes = PrimeGenerator.new(maxima.max).primes

  maxima.each do |max|
    nums = primes.take_while { |p| p < max }
    puts nums.join(",")
  end
end

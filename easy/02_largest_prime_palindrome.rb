def is_prime?(num)
  return true if num == 2

  sqrt = (num ** 0.5).ceil
  !(2..sqrt).any? { |n| num % n == 0 }
end

def is_palindrome?(num)
  num.to_s == num.to_s.reverse
end

def largest_prime_palindrome(ubound)
  (1..ubound).to_a.reverse.each do |n|
    return n if is_prime?(n) && is_palindrome?(n)
  end
end

if __FILE__ == $PROGRAM_NAME
  puts largest_prime_palindrome(1000)
end

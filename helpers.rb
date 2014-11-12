def is_prime?(num)
  return true if num == 2

  sqrt = (num ** 0.5).ceil
  !(2..sqrt).any? { |n| num % n == 0 }
end

def is_palindrome?(num)
  num.to_s == num.to_s.reverse
end

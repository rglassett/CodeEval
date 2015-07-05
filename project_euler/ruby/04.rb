# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(num)
  num.to_s == num.to_s.reverse
end

if __FILE__ == $PROGRAM_NAME
  palindromes = []

  (100..999).to_a.each do |x|
    (100..999).to_a.each do |y|
      if is_palindrome?(x * y)
        palindromes << x * y
      end
    end
  end

  puts palindromes.sort[-1]
end

# If the numbers 1 to 5 are written out in words: one, two, three, four, five,
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
#
# If all the numbers from 1 to 1000 (one thousand) inclusive were written out in
# words, how many letters would be used?
#
# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20
# letters. The use of "and" when writing out numbers is in compliance with
# British usage.

ONES = {
  1 => "one",
  2 => "two",
  3 => "three",
  4 => "four",
  5 => "five",
  6 => "six",
  7 => "seven",
  8 => "eight",
  9 => "nine"
}

TEENS = {
  10 => "ten",
  11 => "eleven",
  12 => "twelve",
  13 => "thirteen",
  14 => "fourteen",
  15 => "fifteen",
  16 => "sixteen",
  17 => "seventeen",
  18 => "eighteen",
  19 => "nineteen"
}

TENS = {
  2 => "twenty",
  3 => "thirty",
  4 => "forty",
  5 => "fifty",
  6 => "sixty",
  7 => "seventy",
  8 => "eighty",
  9 => "ninety"
}

LARGE_NUMBERS = {
  100 => "hundred",
  1000 => "thousand"
}

def in_words(number)
  return "one thousand" if number == 1000
  if number >= 100
    hunds = number / 100
    remainder = number % 100
    string = "#{in_words(hunds)} hundred"
    string += " and #{in_words(remainder)}" if remainder > 0
    string
  elsif number >= 20
    tens = number / 10
    remainder = number % 10
    string = "#{TENS[tens]}"
    string += " #{in_words(remainder)}" if remainder > 0
    string
  elsif number >= 10
    TEENS[number]
  else
    ONES[number]
  end
end

def count_letters(string)
  string.length - string.scan(" ").length
end

if __FILE__ == $PROGRAM_NAME
  sum = 0
  1.upto(1000) do |i|
    sum += count_letters(in_words(i))
  end
  puts sum
end

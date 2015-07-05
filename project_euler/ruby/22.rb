# Using names.txt (right click and 'Save Link/Target As...'), a 46K
# text file containing over five-thousand first names, begin by sorting
# it into alphabetical order. Then working out the alphabetical value
# for each name, multiply this value by its alphabetical position in the
# list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN,
# which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the
# list. So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

VALUES = {}
("A".."Z").each_with_index do |chr, i|
  VALUES[chr] = i + 1
end

def name_score(name, idx)
  sum = 0
  name.each_char { |c| sum += VALUES[c] }
  sum * (idx + 1)
end

def read_names(filename)
  File.readlines(filename).map do |line|
    line.chomp.gsub('"', "").split(",").sort
  end.first
end

if __FILE__ == $PROGRAM_NAME
  names = read_names('sources/euler22.txt')
  sum = 0
  names.each_with_index do |name, idx|
    sum += name_score(name, idx)
  end
  puts sum
end

require 'json'

if __FILE__ == $PROGRAM_NAME
  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    next if line.empty?
    json = JSON.parse(line)
    sum = 0
    json["menu"]["items"].each do |item|
      next if item.nil?
      sum += item["id"] if item["label"]
    end

    puts sum
  end
end

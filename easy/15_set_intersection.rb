def get_sets(filename)
  sets = File.readlines(filename).map do |line|
    line.chomp.split(';').map do |set|
      set.split(',').map(&:to_i)
    end
  end
end

def set_intersection(set1, set2)
  seen = {}
  set1.each { |el| seen[el] = true }
  set2.map { |el| el if seen.has_key?(el) }.compact
end

if __FILE__ == $PROGRAM_NAME
  get_sets(ARGV[0]).each do |pair|
    puts set_intersection(pair[0], pair[1]).join(',')
  end
end

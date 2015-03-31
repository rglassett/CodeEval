class BSTNode
  attr_accessor :parent
  attr_reader :comparator, :key, :left, :right

  def initialize(key = nil, parent = nil, &comparator)
    comparator ||= Proc.new { |x, y| x <=> y }
    @comparator = comparator
    @parent = parent
    @key = key
    unless leaf?
      @left = BSTNode.new(nil, self, &comparator)
      @right = BSTNode.new(nil, self, &comparator)
    end
  end

  def delete(delete_key)
    return if leaf?
    if delete_key < key
      left.delete(delete_key)
    elsif delete_key > key
      right.delete(delete_key)
    else
      if left.key && right.key
        # replace with next successor (min of right branch)
        successor = right.find_min
        @key = successor.key
        successor.delete(successor.key)
      elsif left.key
        replace_in_parent(left)
      elsif right.key
        replace_in_parent(right)
      else
        replace_in_parent
      end
    end
  end

  def find_min
    if left.key
      left.find_min
    else
      self
    end
  end

  def insert(new_key)
    if leaf?
      self.key = new_key
    else
      recursive_insert(new_key)
    end
  end

  def leaf?
    key.nil?
  end

  def left=(node)
    @left = node
    node && node.parent = self
  end

  def right=(node)
    @right = node
    node && node.parent = self
  end

  def recursive_insert(new_key)
    case comparator.call(new_key, key)
    when -1
      left.insert(new_key)
    when 1
      right.insert(new_key)
    end
  end

  def replace_in_parent(node = self.class.new(nil, parent, &comparator))
    return unless parent
    if parent.left == self
      parent.left = node
    else
      parent.right = node
    end
  end

  def search(search_key)
    return nil if leaf?
    return self if key == search_key
    left.search(search_key) || right.search(search_key)
  end

  def key=(new_key)
    @key = new_key
    @left ||= BSTNode.new(nil, self, &comparator)
    @right ||= BSTNode.new(nil, self, &comparator)
  end
end

#     30
#     |
#   ____
#   |   |
#   8   52
#   |
# ____
# |   |
# 3  20
#     |
#    ____
#   |   |
#   10 29

def find_ancestors(node)
  ancestors = {}
  until node.nil?
    ancestors[node] = true
    node = node.parent
  end
  ancestors
end

def find_lca(tree, key1, key2)
  node1, node2 = tree.search(key1), tree.search(key2)
  ancestors = find_ancestors(node2)
  until node1.nil?
    return node1.key if ancestors.has_key?(node1)
    node1 = node1.parent
  end
  nil
end

if __FILE__ == $PROGRAM_NAME
  tree = BSTNode.new(30)
  tree.insert(8)
  tree.insert(52)
  tree.insert(3)
  tree.insert(20)
  tree.insert(10)
  tree.insert(29)

  lines = File.readlines(ARGV[0]).map(&:chomp)
  lines.each do |line|
    nums = line.split(" ").map(&:to_i)
    puts find_lca(tree, nums[0], nums[1])
  end
end

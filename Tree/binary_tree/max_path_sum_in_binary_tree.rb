class Node
  attr_accessor :data, :left, :right
  
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
  
end

class Tree
  attr_accessor :root

  def initialize
    @root = Node.new(1)
  end

  def build_tree
    @root.left = Node.new(2)
    @root.right = Node.new(3)
    @root.left.left = Node.new(4)
    @root.left.right = Node.new(5)
    @root.right.left = Node.new(6)
    @root.right.right = Node.new(7)
  end

  def max_path_sum
    @max_sum = -999999
    sum_util(@root)
    @max_sum
  end
  
  def sum_util(node)
    return 0 if node.nil?
    
    left_sum = sum_util(node.left)
    right_sum = sum_util(node.right)
    
    sum1 = node.data
    sum1 += [left_sum, right_sum].max if [left_sum, right_sum].max > 0
    sum2 = node.data
    sum2 += left_sum if left_sum > 0
    sum2 += right_sum if right_sum > 0
    
    @max_sum = sum2 if sum2 > @max_sum
  
    sum1
  end
end

tree = Tree.new
tree.build_tree
puts "Max path sum - #{tree.max_path_sum}"

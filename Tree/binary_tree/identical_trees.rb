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
    @root1 = Node.new(1)
    @root2 = Node.new(1)
  end

  def build_tree
    @root1.left = Node.new(4)
    @root1.right = Node.new(6)
    @root1.left.left = Node.new(7)
    @root1.left.right = Node.new(8)
    @root1.right.left = Node.new(10)
    @root1.right.right = Node.new(12)
    @root1.right.left.left = Node.new(13)
    @root1.right.right.right = Node.new(14)
    @root1.right.right.right.right = Node.new(19)
    @root1.right.right.right.right.left = Node.new(19)
    @root1.right.left.left.left = Node.new(13)
    @root1.right.left.left.left.left = Node.new(13)
    @root1.right.left.left.left.left.left = Node.new(13)
    @root1.right.left.left.left.left.left.left = Node.new(13)
    @root2.left = Node.new(4)
    @root2.right = Node.new(6)
    @root2.left.left = Node.new(7)
    @root2.left.right = Node.new(8)
    @root2.right.left = Node.new(10)
    @root2.right.right = Node.new(12)
    @root2.right.left.left = Node.new(13)
    @root2.right.right.right = Node.new(14)
    @root2.right.right.right.right = Node.new(19)
    @root2.right.right.right.right.left = Node.new(19)
    @root2.right.left.left.left = Node.new(14)
    @root2.right.left.left.left.left = Node.new(13)
    @root2.right.left.left.left.left.left = Node.new(13)
    @root2.right.left.left.left.left.left.left = Node.new(13)
  end

  def is_identical
    identical_util(@root1, @root2)
  end

  def identical_util(node1, node2)
    return true if node1.nil? && node2.nil?

    return false if node1.nil? || node2.nil?

    return false unless identical_util(node1.left, node2.left) && identical_util(node1.right, node2.right)

    return true if node1.data == node2.data

    false
  end
end

tree = Tree.new
tree.build_tree
puts "Is Identical - #{tree.is_identical}"

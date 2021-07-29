class Node
  attr_accessor :data, :left, :right
  
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
  
end

class Height
  attr_accessor :h
  
  def initialize
    @h = 0
  end

end

class Tree
  attr_accessor :root

  def initialize
    @root = Node.new(5)
  end

  def build_tree
    @root.left = Node.new(4)
    @root.right = Node.new(6)
    @root.left.left = Node.new(7)
    @root.left.right = Node.new(8)
    @root.right.left = Node.new(10)
    @root.right.right = Node.new(12)
    @root.right.left.left = Node.new(13)
    @root.right.right.right = Node.new(14)
    @root.right.right.right.right = Node.new(19)
    @root.right.right.right.right.left = Node.new(19)
    @root.right.left.left.left = Node.new(13)
    @root.right.left.left.left.left = Node.new(13)
    @root.right.left.left.left.left.left = Node.new(13)
    @root.right.left.left.left.left.left.left = Node.new(13)
  end

  def height
    height_util(@root)
  end

  def height_util(node)
    return 0 if node.nil?

    h1 = height_util(node.left)
    h2 = height_util(node.right)
    [h1, h2].max + 1
  end

  def diameter
    diameter_util(@root)
  end

  def diameter_util(node)
    return 0 if node.nil?

    h1 = height_util(node.left)
    h2 = height_util(node.right)
    ldiameter = diameter_util(node.left)
    rdiameter = diameter_util(node.right)

    [h1 + h2 + 1, ldiameter, rdiameter].max
  end

  def optimize_diameter
    h = Height.new
    diameter_opt(@root, h)
  end

  def diameter_opt(node, height)
    lh = Height.new
    rh = Height.new

    if node.nil?
      height.h = 0
      return 0
    end

    ldiameter = diameter_opt(node.left, lh)
    rdiameter = diameter_opt(node.right, rh)
    puts node.data
    puts lh.h
    height.h = [lh.h, rh.h].max + 1

    [lh.h + rh.h + 1, ldiameter, rdiameter].max
  end
end

tree = Tree.new
tree.build_tree

puts "Height of Binary Tree - #{tree.height}"
puts "Diameter of Binary Tree - #{tree.diameter}"
puts "Optimize Diameter #{tree.optimize_diameter}"

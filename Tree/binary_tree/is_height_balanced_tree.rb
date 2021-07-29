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
    @root.left = Node.new(2)
    @root.right = Node.new(3)
    @root.left.left = Node.new(7)
    @root.left.right = Node.new(8)
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

  def is_balanced?
    height = Height.new()
    is_balanced_util(@root, height)
  end

  def is_balanced_util(node, height)
    return true if node.nil?

    lh = Height.new
    rh = Height.new

    a = is_balanced_util(node.left, lh)
    b = is_balanced_util(node.right, rh)

    height.h = [lh.h, rh.h].max + 1
    return false unless  a || b
    if (lh.h- rh.h).abs > 1
      @unbalanced_node = node.data if @unbalanced_node.nil?
      return false
    end
    true
  end

  def get_unbalance_node
    @unbalanced_node
  end
end

tree = Tree.new
tree.build_tree
puts "Is Tree is Balanced - #{tree.is_balanced?}"
puts tree.get_unbalance_node

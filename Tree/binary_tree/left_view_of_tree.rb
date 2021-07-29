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
  end

  def left_view_recursive
    @left_view_list = []
    @max_level = 0
    left_view_util(@root, 1)
    @left_view_list.join(' ')
  end

  def left_view_util(node, level)
    return if node.nil?

    if @max_level < level
      @left_view_list.push(node.data)
      @max_level = level
    end
    left_view_util(node.left, level + 1)
    left_view_util(node.right, level + 1)
  end

  def left_view_queue
    @left_view_list = []
    queue = []
    queue.push(@root)
    while !queue.empty?
      n = queue.length
      for i in 0..n-1
        node = queue.shift
        @left_view_list.push(node.data) if i == 0
        
        queue.push(node.left) unless node.left.nil?
        queue.push(node.right) unless node.right.nil?
      end
    end
    @left_view_list.join(' ')
  end
end

tree = Tree.new
tree.build_tree

puts "Left View - #{tree.left_view_recursive}"
puts "Left View Using Queue - #{tree.left_view_queue}"

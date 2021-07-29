class Node
  attr_accessor :data, :left, :right, :depth, :width
  
  def initialize(data)
    @data = data
    @left = nil
    @right = nil
    @width = 0
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

  def bottom_view
    @bottom_view = {}
    horizontal_dis = 0
    queue = []
    @root.width = horizontal_dis
    queue.push(@root)
    while !queue.empty?
      node = queue.shift
      horizontal_dis = node.width
      unless @bottom_view.has_key?(horizontal_dis)
        @bottom_view[horizontal_dis] = node.data
      end
      if !node.left.nil?
        node.left.width = horizontal_dis - 1
        queue.push(node.left)
      end
      if !node.right.nil?
        node.right.width = horizontal_dis + 1
        queue.push(node.right)
      end
    end
    @bottom_view = @bottom_view.sort_by { |k,y| k }
    @bottom_view.each do |k, y|
      print "#{y} "
    end
  end

  def bottom_view_util(node, depth, width)
    return if node.nil?

    node.depth = depth
    node.width = width
    @max_width = width if @max_width < width
    @min_width = width if @min_width > width
    bottom_view_util(node.left, depth + 1, width - 1)
    bottom_view_util(node.right, depth + 1, width + 1)
  end

  def get_bottom_view
    
    puts @min_width
    puts @max_width
    for i in @min_width..@max_width
      @bottom_view[i] = { :max_depth => 0, :data => 0 }
    end
    inorder_traversal(@root)
  end

  def inorder_traversal(root)
    return nil if root.nil?

    inorder_traversal(root.left)
    if @bottom_view[root.width][:max_depth] < root.depth
      @bottom_view[root.width][:data] = root.data
    end
    inorder_traversal(root.right)
  end

  def print_bottom_view
    view = []
    for i in @min_width..@max_width
      view.push(@bottom_view[i][:data])
    end
    puts view.join(' ')
  end
end

tree = Tree.new
tree.build_tree
tree.bottom_view

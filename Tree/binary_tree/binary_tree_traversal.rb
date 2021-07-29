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

  def inorder_traversal_util(root)
    return if root.nil? 

    inorder_traversal_util(root.left)
    @inorder_list.push(root.data)
    inorder_traversal_util(root.right)
  end

  def inorder_traversal
    @inorder_list = []
    root = @root
    inorder_traversal_util(root)
    @inorder_list.join(' ')
  end

  def inorder_without_recursion
    @inorder_list = []
    stack = []
    current = @root
    stack.push(@root)
    while !stack.empty?
      while !current.nil?
        current = current.left
        stack.push(current) unless current.nil?
      end
      node = stack.pop()
      @inorder_list.push(node.data)
      current = node.right
      stack.push(current) unless current.nil?
    end
    @inorder_list.join(' ')
  end

  def preorder_without_recursion
    @preorder_list = []
    stack = []
    current = @root
    stack.push(@root)
    while !stack.empty?
      node = stack.pop()
      @preorder_list.push(node.data)
      stack.push(node.right) unless node.right.nil?
      stack.push(node.left) unless node.left.nil?
    end
    @preorder_list.join(' ')
  end

  def postorder_without_recursion
    @postorder_list = []
    stack1 = []
    stack1.push(@root)
    while !stack1.empty?
      node = stack1.pop()
      @postorder_list.push(node.data)
      stack1.push(node.left) unless node.left.nil?
      stack1.push(node.right) unless node.right.nil?
    end
    @postorder_list.reverse.join(' ')
  end

  def preorder_traversal_util(root)
    return if root.nil? 

    @preorder_list.push(root.data)
    preorder_traversal_util(root.left)
    preorder_traversal_util(root.right)
  end

  def preorder_traversal
    @preorder_list = []
    root = @root
    preorder_traversal_util(root)
    @preorder_list.join(' ')
  end

  def postorder_traversal_util(root)
    return if root.nil? 

    postorder_traversal_util(root.left)
    postorder_traversal_util(root.right)
    @postorder_list.push(root.data)
  end

  def postorder_traversal
    @postorder_list = []
    root = @root
    postorder_traversal_util(root)
    @postorder_list.join(' ')
  end

  def levelorder_traversal
    @levelorder_list = []
    queue = []
    queue.push(root)
    while !queue.empty?
      node = queue.shift
      @levelorder_list.push(node.data)
      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
    end
    @levelorder_list.join(' ')
  end

  def spiral_levelorder_traversal
    @levelorder_list = []
    st1 = []
    st2 = []
    st1.push(@root)
    while !st1.empty? || !st2.empty?
      while !st1.empty?
        node = st1.pop()
        @levelorder_list.push(node.data)
        st2.push(node.right) unless node.right.nil?
        st2.push(node.left) unless node.left.nil?
      end
      
      while !st2.empty?
        node = st2.pop()
        @levelorder_list.push(node.data)
        st1.push(node.left) unless node.left.nil?
        st1.push(node.right) unless node.right.nil?
      end
    end
    @levelorder_list.join(' ')
  end
end

tree = Tree.new
tree.build_tree
puts "Inorder Traversal - #{tree.inorder_traversal}"
puts "Preorder Traversal - #{tree.preorder_traversal}"
puts "Postorder Traversal - #{tree.postorder_traversal}"
puts "Inorder Traversal -  #{tree.inorder_without_recursion}"
puts "Preorder Traversal - #{tree.preorder_without_recursion}"
puts "Postorder Traversal - #{tree.postorder_without_recursion}"
puts "Levelorder Traversal - #{tree.levelorder_traversal}"
puts "Spiral Levelorder Traversal - #{tree.spiral_levelorder_traversal}"

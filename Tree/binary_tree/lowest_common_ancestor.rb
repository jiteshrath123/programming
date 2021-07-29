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

  def lca(a, b)
    findLca(@root, a, b).data
  end

  def lca_util(node, a, b)
    return 0 if node.nil?

    return a if node.data == a

    return b if node.data == b

    llca = lca_util(node.left, a, b)
    rlca = lca_util(node.right, a, b)
    puts "#{llca} #{rlca}" 
    if (llca == a && rlca == b) || (llca == b && rlca == a)
      @lowest_common_ancestor = node.data if @lowest_common_ancestor.nil?
    end
    0 + llca + rlca
  end

  def findLca(node, a, b)
    return node if node.nil? || [a, b].include?(node.data)

    left_lca = findLca(node.left, a, b)
    right_lca = findLca(node.right, a, b)

    return node if !left_lca.nil? && !right_lca.nil?

    return left_lca.nil? ? right_lca : left_lca
  end
end

tree = Tree.new
tree.build_tree
a, b = gets.split.map(&:to_i)
puts "Lowest Common  Ancestor of #{a} and #{b} is - #{tree.lca(a, b)}"

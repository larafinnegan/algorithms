class Node
  attr_accessor :value, :left, :right, :parent

  def initialize(value, lef=nil, right=nil, parent = nil)
    @value = value
    @left = left
    @right = right
    @parent = parent
  end
end


def build_tree(array)
  root = Node.new(array.shift)
  array.each {|x| place_node(node = Node.new(x), root)}
  root
end

def place_node(node, parent)
  node.parent = parent
  if node.value > parent.value
    parent.right.nil? ? parent.right = node : place_node(node, parent.right)
  else
    parent.left.nil? ? parent.left = node : place_node(node, parent.left)
  end
end

def breadth_first_search(n, node)
  queue = [node]
  while queue.size > 0
    return queue[0] if queue[0].value == n
    queue << queue[0].right unless queue[0].right.nil?
    queue << queue[0].left unless queue[0].left.nil?
    queue.shift
  end
end


tree = build_tree([5,7,1,4,9,7,8,3])

p breadth_first_search(8, tree)


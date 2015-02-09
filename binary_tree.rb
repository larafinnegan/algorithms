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

def depth_first_search(n, node)
  visited = [node]
  stack = [node]
  while stack.size > 0
    return stack[0] if stack[0].value == n
    if !stack[0].left.nil? && !visited.include?(stack[0].left)
      stack.unshift(stack[0].left)
      visited << stack[0]
    elsif !stack[0].right.nil? && !visited.include?(stack[0].right)
      stack.unshift(stack[0].right)
      visited << stack[0]
    else
      stack.shift
    end
  end
end

def dfs_rcs(n, node, visited = [node])
  return node if node.value == n
  if !node.left.nil? && !visited.include?(node.left)
    dfs_rcs(n, node.left, visited << node.left)
  elsif !node.right.nil? && !visited.include?(node.right)
    dfs_rcs(n, node.right, visited << node.right)
  elsif node.parent != nil
    dfs_rcs(n, node.parent, visited)
  else
    nil
  end
end

tree = build_tree([5,7,1,4,9,7,8,3])

breadth_first_search(8, tree)

depth_first_search(8, tree)

p dfs_rcs(3, tree)

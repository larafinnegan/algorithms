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
end

def place_node(node, parent)
  if node.value > parent.value
    if parent.right.nil? 
      node.parent = parent
      parent.right = node
    else 
      place_node(node, parent.right)
    end
  else
    if parent.left.nil? 
      node.parent = parent
      parent.left = node
    else 
      place_node(node, parent.left)
    end
  end
end


build_tree([5,7,1,4,9,7,8,3])



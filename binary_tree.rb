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
  array.each do |x|
    node = Node.new(x)
    current_node = root
    while node.parent.nil?
     if node.value > current_node.value
        if current_node.right.nil? 
          node.parent = current_node
          current_node.right = node
          else 
            current_node = current_node.right
          end
      else
        if current_node.left.nil? 
          node.parent = current_node 
          current_node.left = node
        else 
          current_node = current_node.left
        end
      end
    end
  end
end






build_tree([5,7,1,4,9,7,8,3])



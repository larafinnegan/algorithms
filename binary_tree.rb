class Node
  attr_accessor :value, :child, :parent

  def initialize(value, child = nil, parent = nil)
    @value = value
    @parent = parent
    @child = child
  end


end


def build_tree(array)
head = Node.new(array[0])
array[1..-1].each do |x|
  node = Node.new(array[x])
  
end


end






puts build_tree([1,2,3,4,5,6,7,8,9])
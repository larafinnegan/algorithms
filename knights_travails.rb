class Node
  attr_accessor :coordinates, :parent

  def initialize(coordinates, parent = nil)
    @coordinates = coordinates
    @parent = parent
  end
end


class Board
  attr_accessor :board

  def initialize(board = Array.new(8, [0, 1, 2, 3, 4, 5, 6, 7]))
    @board = board
    
  end


  def possible_moves(node)
    node[0] = down
    node[1] = across
    moves = [[down - 2, across + 1], [down - 2, across - 1],
             [down - 1, across + 2], [down + 1, across + 2],
             [down + 2, across + 1], [down + 2, across - 1],
             [down - 1, across - 2], [down + 1, across - 2]]
    possible_moves = moves.select {|x| p x.all? {|y| y < board.length-1 && y > 0}}
  end

  def create_nodes(coordinates=nil)
    root = Node.new(coordinates)
    board.each {|x| p x.index}
  end

  def place_nodes()

  end


end


class Knight
  attr_accessor :position, :destination, :board

  def initialize(position = []. destination = [], board = Board.new)
    @position = position
    @destination = destination
    @board = board
  end

  def get_position
    puts "Please enter the knight's current coordinates:\n\nDown (0-7):"
    down = gets.chomp.to_i
    puts "Across (0-7):"
    across = gets.chomp.to_i
    position << down << across
  end

  def get_destination
    puts "Please enter the knight's destination coordinates:\n\nDown (0-7):"
    down = gets.chomp.to_i
    puts "Across (0-7):"
    across = gets.chomp.to_i
    destination << down << across
  end


end


board = Array.new(8, [0, 1, 2, 3, 4, 5, 6, 7])






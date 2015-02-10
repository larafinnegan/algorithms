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


  def possible_moves(value)
    down = value[0] 
    across = value[1]
    moves = [[down - 2, across + 1], [down - 2, across - 1],
             [down - 1, across + 2], [down + 1, across + 2],
             [down + 2, across + 1], [down + 2, across - 1],
             [down - 1, across - 2], [down + 1, across - 2]]
    possible_moves = moves.select {|x| x.all? {|y| y < board.length && y >= 0}}
  end

  def create_root(coordinates = [3,3], destination = [4,3])
    node = Node.new(coordinates)
    place_nodes(node, destination)
    node
  end

  def place_nodes(node, destination)
    queue = [node]
    created_nodes = [node]
    until created_nodes.size == board.flatten.size
      child_nodes = possible_moves(queue[0].coordinates) 
      child_nodes.each do |val| 
        if created_nodes.none? {|x| val == x.coordinates}
          node = Node.new(val, queue[0])
          created_nodes << node
          queue << node
        end
      end
      p queue[0].coordinates
      return queue[0].coordinates if queue[0].coordinates == destination
      queue.shift
    end
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


  board = Board.new
  board.create_root
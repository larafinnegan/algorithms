Node = Struct.new(:yx, :parent)

class Board
  attr_reader :board

  def initialize(board = Array.new(8) {|x| [nil, nil, nil, nil, nil, nil, nil, nil]})
    @board = board
  end

  def possible_moves(yx = [2,1])
    moves = [[yx[0] - 2, yx[1] + 1], [yx[0] - 2, yx[1] - 1],
             [yx[0] - 1, yx[1] + 2], [yx[0] + 1, yx[1] + 2],
             [yx[0] + 2, yx[1] + 1], [yx[0] + 2, yx[1] - 1],
             [yx[0] - 1, yx[1] - 2], [yx[0] + 1, yx[1] - 2]]
    illegal = moves.select {|x| x.all? {|y| y < board.length && y >= 0}}
  end

  def create_root(yx = [0,0], destination = [4,0])
    node = Node.new(yx, nil)
    board[yx[0]][yx[1]] = node
    place_nodes(node, destination)
  end

  def place_nodes(node, destination)
    q = [node]
    until board.flatten.none? {|x| x.nil?}
      possible_moves(q[0].yx).each do |val|
        if board[val[0]][val[1]].nil?
          node = Node.new(val, q[0])
          return path(node) if node.yx == destination
          board[val[0]][val[1]] = node
          q << node
        end
      end
      q.shift
    end
  end

  def path(node, list = [node.yx])
    path(node.parent, list << node.parent.yx) if node.parent
    list
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

    def play
      board.create_root(get_position, get_destination)

  end

  knight = Knight.new
  knight.play
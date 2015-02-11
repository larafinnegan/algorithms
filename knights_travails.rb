Node = Struct.new(:yx, :parent)

class Board
  attr_reader :board

  def initialize(board = Array.new(8) {|x| [nil, nil, nil, nil, nil, nil, nil, nil]})
    @board = board
  end

  def create_root(yx = [0,0], dest = [0,4])
    node = Node.new(yx, nil)
    board[yx[0]][yx[1]] = node
    place_nodes(node, dest)
  end

  private
  def possible_moves(yx = [2,1])
    moves = [[yx[0] - 2, yx[1] + 1], [yx[0] - 2, yx[1] - 1],
             [yx[0] - 1, yx[1] + 2], [yx[0] + 1, yx[1] + 2],
             [yx[0] + 2, yx[1] + 1], [yx[0] + 2, yx[1] - 1],
             [yx[0] - 1, yx[1] - 2], [yx[0] + 1, yx[1] - 2]]
    moves.select {|x| x.all? {|y| y < board.length && y >= 0}}
  end

  def place_nodes(node, dest)
    q = [node]
    until board.flatten.any? {|x| x && x.yx == dest}
      possible_moves(q[0].yx).each do |val|
        if board[val[0]][val[1]].nil?
          node = Node.new(val, q[0])
          board[val[0]][val[1]] = node
          q << node
        end
      end
      q.shift
    end
    path(board[dest[0]][dest[1]])
  end

  def path(node, list = [node.yx])
    path(node.parent, list << node.parent.yx) if node.parent
    list
  end
end

class Knight
  attr_reader :board

  def initialize(board = Board.new)
    @board = board
  end

  def play
    list = board.create_root(get_position, get_destination)
    print_list(list)
  end

  private
  def get_position
    puts "Please enter the knight's current coordinates:\n\nDown (0-7):"
    position = [gets.chomp.to_i]
    puts "Across (0-7):"
    position << gets.chomp.to_i
  end

  def get_destination
    puts "\nPlease enter the knight's destination coordinates:\n\nDown (0-7):"
    destination = [gets.chomp.to_i]
    puts "Across (0-7):"
    destination << gets.chomp.to_i
  end

  def print_list(list)
    puts "You made it in #{list.size-1} moves!  Here's your path:\n"
    list.reverse.each {|x| p x}
  end
end

knight = Knight.new
knight.play
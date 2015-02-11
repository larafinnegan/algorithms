Node = Struct.new(:yx, :parent)

class Board
  attr_reader :board

  def initialize(board = Array.new(8) {|x| [nil, nil, nil, nil, nil, nil, nil, nil]})
    @board = board
  end

  def play(start, finish)
    list = create_root(start, finish)
    print_list(list)
  end

  private
  def create_root(yx, dest)
    node = Node.new(yx, nil)
    board[yx[0]][yx[1]] = node
    knight_moves(node, dest)
  end

  def possible_moves(yx)
    moves = [[yx[0] - 2, yx[1] + 1], [yx[0] - 2, yx[1] - 1],
             [yx[0] - 1, yx[1] + 2], [yx[0] + 1, yx[1] + 2],
             [yx[0] + 2, yx[1] + 1], [yx[0] + 2, yx[1] - 1],
             [yx[0] - 1, yx[1] - 2], [yx[0] + 1, yx[1] - 2]]
    moves.select {|x| x.all? {|y| y < board.length && y >= 0}}
  end

  def knight_moves(node, dest)
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

  def print_list(list)
    puts "You made it in #{list.size-1} moves!  Here's your path:\n"
    list.reverse.each {|x| p x}
  end
end

board = Board.new
board.play([0,0], [0,2])
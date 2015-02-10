class Node
  attr_accessor :coordinates, :parent

  def initialize(coordinates, parent = nil)
    @coordinates = coordinates
    @parent = parent
  end
end


class Board
  attr_accessor :board

  def initialize(board = [[0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7],
                          [0, 1, 2, 3, 4, 5, 6, 7]])
    @board = board
  end
end


class Knight
  attr_accessor :position, :destination

  def initialize(position = []. destination = [])
    @position = position
    @destination = destination
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



down = 4
across = 4

puts board[down][across]



moves = [[down - 2][across + 1], [down - 2][across - 1],
        [down - 1][across + 2], [down + 1][across + 2],
        [down + 2][across + 1], [down + 2][across - 1],
        [down - 1][across - 2], [down + 1][across - 2]]


array = [1,2,3]

p array[8]
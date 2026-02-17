class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
  end

  def drop_chip(col, marker)
    rows = 6
    row = (rows - 1).downto(0).find { |row| @board[row][col - 1] == '' }
    @board[row][col - 1] = marker
  end
end

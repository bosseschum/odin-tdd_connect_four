class Board
  attr_accessor :board

  def initialize
    @board = Array.new(6) { Array.new(7, '') }
  end

  def display_board
    puts '  1    2    3    4    5    6    7'
    @board.each do |row|
      row.each do |cell|
        print "| #{cell.empty? ? ' ' : cell} |"
      end
      puts
    end
  end

  def drop_chip(col, marker)
    rows = 6
    row = (rows - 1).downto(0).find { |row| @board[row][col - 1] == '' }
    @board[row][col - 1] = marker
  end

  def valid_move?(col)
    board[0][col - 1] == ''
  end

  def get_valid_column
    loop do
      print 'Enter column (1-7): '
      column = gets.chomp.to_i
      return column if valid_move?(column)

      puts 'Invalid move! Try again.'
    end
  end

  def winner?
    check_horizontal || check_vertical || check_diagonal_ascending || check_diagonal_descending
  end

  def full?
    @board.flatten.none? { |cell| cell == '' }
  end

  private

  def check_horizontal
    @board.each do |row|
      row.each_cons(4) do |window|
        return true if window.all? { |cell| cell == window.first } && !window.first.empty?
      end
    end
    false
  end

  def check_vertical
    (0..6).each do |col|
      column = @board.map { |row| row[col] }
      column.each_cons(4) do |window|
        return true if window.all? { |cell| cell == window.first } && !window.first.empty?
      end
    end
    false
  end

  def check_diagonal_ascending
    (3..5).each do |row|
      (0..3).each do |col|
        window = 4.times.collect { |i| @board[row - i][col + i] }
        return true if window.all? { |cell| cell == window.first } && !window.first.empty?
      end
    end
    false
  end

  def check_diagonal_descending
    (0..2).each do |row|
      (0..3).each do |col|
        window = 4.times.collect { |i| @board[row + i][col + i] }
        return true if window.all? { |cell| cell == window.first } && !window.first.empty?
      end
    end
    false
  end
end

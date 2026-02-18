require_relative 'board'

class Game
  attr_reader :board, :player_1, :player_2, :current_player

  def initialize(player_1, player_2)
    @player_1 = player_1
    @player_2 = player_2
    @board = Board.new
    @current_player = player_1
  end

  def game_over?
    @board.winner? || @board.full?
  end

  def switch_player
    @current_player = @current_player == player_1 ? player_2 : player_1
  end

  def announce_result
    if @board.winner? && @current_player == player_1
      puts "#{player_1.name} wins!"
    elsif @board.winner? && @current_player == player_2
      puts "#{player_2.name} wins!"
    else
      puts "It's a draw!"
    end
  end

  def play
    puts "Welcome to CONNECT FOUR! Let's play!"
    puts "#{player_1.name} is #{player_1.marker} and #{player_2.name} is #{player_2.marker}."
    puts

    until game_over?
      board.display_board
      puts
      puts "#{current_player.name}'s turn."
      col = board.get_valid_column
      board.drop_chip(col, current_player.marker)
      switch_player unless game_over?
    end

    board.display_board
    announce_result
  end
end

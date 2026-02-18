require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'

puts 'Who is Player 1?'
player_1 = Player.new(gets.chomp, 'X')

puts 'Who is Player 2?'
player_2 = Player.new(gets.chomp, 'O')

game = Game.new(player_1, player_2)
game.play

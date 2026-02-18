require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }

  describe '#drop_chip' do
    context 'when the board is empty' do
      it 'falls to row 6' do
        board.drop_chip(1, 'X')
        expect(board.board[5][0]).to eq('X')
      end
    end

    context 'when a chip drops on top of another' do
      it 'falls to row 5' do
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'O')
        expect(board.board[4][0]).to eq('O')
      end
    end
  end

  describe '#valid_move?' do
    context 'when the chosen column has space' do
      it 'returns true' do
        expect(board.valid_move?(1)).to eq(true)
      end

      it 'returns true' do
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        expect(board.valid_move?(1)).to eq(true)
      end
    end

    context 'when the chosen column is full' do
      it 'returns false' do
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        expect(board.valid_move?(1)).to eq(false)
      end
    end
  end

  describe '#winner?' do
    context 'when four of the same chips are in a row' do
      it 'returns true horizontally' do
        board.drop_chip(1, 'X')
        board.drop_chip(2, 'X')
        board.drop_chip(3, 'X')
        board.drop_chip(4, 'X')
        expect(board.winner?).to eq(true)
      end

      it 'returns true vertically' do
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'X')
        expect(board.winner?).to eq(true)
      end

      it 'returns true ascending diagonally' do
        board.drop_chip(1, 'X')
        board.drop_chip(2, 'O')
        board.drop_chip(2, 'X')
        board.drop_chip(3, 'O')
        board.drop_chip(3, 'O')
        board.drop_chip(3, 'X')
        board.drop_chip(4, 'X')
        board.drop_chip(4, 'O')
        board.drop_chip(4, 'O')
        board.drop_chip(4, 'X')
        expect(board.winner?).to eq(true)
      end

      it 'returns true descendind diagonally' do
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'O')
        board.drop_chip(1, 'X')
        board.drop_chip(1, 'O')
        board.drop_chip(2, 'O')
        board.drop_chip(2, 'X')
        board.drop_chip(2, 'O')
        board.drop_chip(3, 'O')
        board.drop_chip(3, 'O')
        board.drop_chip(4, 'O')
        expect(board.winner?).to eq(true)
      end
    end

    context 'when no four of the same chip are in a row' do
      it 'returns false' do
        expect(board.winner?).to eq(false)
      end
    end
  end

  describe '#board_full?' do
    context 'when all slots are taken' do
      it 'returns true' do
        board.board = [
          %w[X X O O O X O], %w[O O X X X O X],
          %w[X O X O X O X], %w[O O X X O O X],
          %w[X X O O X O X], %w[X O X O O X O]
        ]
        expect(board.board.none? { |slot| slot == '' }).to eq(true)
      end
    end
  end
end

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
    pending 'Not implemented'
  end

  describe '#winner?' do
    pending 'Not implemented'
  end

  describe '#full?' do
    pending 'Not implemented'
  end
end

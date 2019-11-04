# frozen_string_literal: true

require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

describe Game do
  let(:first) { Player.new }
  let(:second) { Player.new(:o) }
  let(:game) { Game.new(first, second) }
  describe '#initialize' do
    it 'sets @board to a 3 by 3 matrix with nils' do
      all_nil = game.board.all? { |row| row.all?(NilClass) }
      expect(all_nil).to be_truthy
    end
    it 'sets @player to @first' do
      expect(game.player.symbol).to eq(:x)
    end
    it 'sets @moves to 0' do
      expect(game.moves).to eq(0)
    end
    it 'sets @state to :playing' do
      expect(game.state).to eq(:playing)
    end
  end
  describe '#board_string' do
    it 'gives a string representing the board' do
      board_as_string_zero = " -  -  - \n -  -  - \n -  -  - \n"
      board_as_string_one = " x  x  - \n -  o  - \n -  x  o \n"
      expect(game.board_string).to eq(board_as_string_zero)
      game.make_move(1)
      game.make_move(5)
      game.make_move(2)
      game.make_move(9)
      game.make_move(8)
      expect(game.board_string).to eq(board_as_string_one)
    end
  end
  describe '#playing' do
    it 'gives false if @state is not equal to :playing' do
      game.state = :winner
      expect(game.playing).to be_falsy
    end
    it 'gives true if @state is equal to :playing' do
      expect(game.playing).to be_truthy
    end
  end
end
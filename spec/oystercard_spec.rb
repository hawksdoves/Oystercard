require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'initializes with an empty balance' do
      expect(oystercard.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'increases balance by argument when you top up' do
      expect{ oystercard.top_up 1 }.to change{ oystercard.balance }.by 1
    end

    it 'has a maximum balance of £90' do
      error = Oystercard::MAX_BALANCE_ERROR
      expect{oystercard.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error error
    end

  end

  describe '#deduct' do
    it 'deducts fare cost from the card balance' do
      expect{ oystercard.deduct 1}.to change{oystercard.balance}.by -1
    end
  end

end

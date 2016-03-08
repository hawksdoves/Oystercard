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

  describe '#touch_in' do

  	it 'returns in travel as true' do
  		expect(subject.touch_in).to eq true
  	end

  end

  describe '#touch_out' do
  
  it 'returns in travel as false' do
  	expect(subject.touch_out).to eq false
  end

  end

  describe '#in_journey' do
  	it 'returns true when when someone has touched in' do
  		subject.touch_in
  		expect(subject).to be_in_journey
  	end
  end
end

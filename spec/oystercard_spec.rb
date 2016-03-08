require 'oystercard'

describe Oystercard do

  subject(:oystercard) { described_class.new }

  describe '#balance' do
    it 'initializes with an empty balance' do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it 'increases balance by argument when you top up' do
      expect{ subject.top_up 1 }.to change{ subject.balance }.by 1
    end

    it 'has a maximum balance of £90' do
      error = Oystercard::MAX_BALANCE_ERROR
      expect{subject.top_up(Oystercard::MAX_BALANCE + 1)}.to raise_error error
    end

  end

  describe '#touch_in' do

  	it 'returns in travel as true' do
      subject.top_up 5
  		expect(subject.touch_in).to eq true
  	end

    it 'requires a minimum balance to travel' do
      expect{ subject.touch_in }.to raise_error Oystercard::MIN_BALANCE_ERROR
    end

  end

  describe '#touch_out' do

	  it 'returns in journey to become false' do
	  	subject.top_up 10
	  	subject.touch_in
	  	subject.touch_out Oystercard::MIN_FARE
	  	expect(subject).not_to be_in_journey
	  end

	  it 'reduces the balance' do
	  	subject.top_up 10
	  	subject.touch_in
	  	expect{subject.touch_out Oystercard::MIN_FARE}.to change{subject.balance}.by -Oystercard::MIN_FARE
	  end
  end

  describe '#in_journey' do
  	it 'returns true when when someone has touched in' do
      subject.top_up 5
  		subject.touch_in
  		expect(subject).to be_in_journey
  	end
  end
end

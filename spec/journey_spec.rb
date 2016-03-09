require 'journey'
require 'oystercard'
require 'station'

describe Journey do
let(:journey) {described_class.new}
let(:station) {double :station, :name => "Old Street", :zone => 1}
let(:station2) {double :station, :name => "Kings Cross", :zone => 1}

  describe '#initialize' do
	  it '1.0 initializes with entry station as nil' do
	  	expect(journey.entry_station).to be nil
	  end

	  it '1.1 initializes with exit station as nil' do
	  	expect(journey.exit_station).to be nil
	  end
  end

  describe '#start' do

  	it '2.0 allocates an entry station' do
  		journey.start(station)
  		expect(journey.entry_station).not_to be nil
  	end

  end

  describe '#finish' do

  	it '3.0 allocates an exit station' do
  		journey.finish(station2)
  		expect(journey.exit_station).not_to be nil
  	end
  end

  describe '#fare' do

  	it '4.0 returns the minimum fare' do
  		journey.start(station)
  		journey.finish(station2)
  		expect(journey.fare).to eq Journey::MIN_FARE
  	end

  	it '4.1 returns the penalty fare' do
  		expect(journey.fare).to eq Journey::PENALTY_FARE
  	end
  end

end

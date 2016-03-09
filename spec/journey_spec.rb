require 'journey'

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

  describe '#entry' do

  	it '2.0 allocates an entry station' do
  		journey.entry(station)
  		expect(journey.entry_station).not_to be nil
  	end

  end

  describe '#exit' do

  	it '3.0 allocates an exit station' do
  		journey.exit(station2)
  		expect(journey.exit_station).not_to be nil
  	end

  end

  describe '#fare' do

  	it '4.0 returns the minimum fare' do
  		journey.entry(station)
  		journey.exit(station2)
  		expect(journey.fare).to eq Journey::MIN_FARE
  	end

  	it '4.1 returns the penalty fare' do
  		expect(journey.fare).to eq Journey::PENALTY_FARE
  	end

  end

  describe '#complete?' do

    it '5.0 returns true following tap in then tap out' do
      journey.entry(station)
      journey.exit(station2)
      expect(journey).to be_complete
    end

    it '5.1 returns false when tap in and not out' do
      journey.entry(station)
      expect(journey).not_to be_complete
    end

    it '5.2 returns false when tap out and not in' do
      journey.exit(station2)
      expect(journey).not_to be_complete
    end

  end

end

require 'journey_log'


describe Journeylog do

let(:journey_log) {described_class.new}
let(:station) {double :station, :name => "Old Street", :zone => 1}
let(:station2) {double :station, :name => "Kings Cross", :zone => 1}

	describe '#initialize' do

	  it '1.0 allows you to create new Journey instances' do
	  	expect(journey_log.journey_class.new.class).to eq Journey
	  end

	  it '1.1 creates an empty journeys array' do
	  	expect(journey_log.journeys).to be_empty
	  end

	end

	describe '#start' do

		it '2.0 allows you to put a new Journey into the journeys array' do
			journey_log.start(station)
			expect(journey_log.journeys[0]).to eq Journey
		end
	end

end

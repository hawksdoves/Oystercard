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
	  		expect(journey_log.view_journeys).to be_empty
	  	end

	end

	describe '#start' do

		it '2.0 allows you to put a new Journey into the journeys array' do
			journey_log.start(station)
			expect(journey_log.view_journeys[-1].entry_station).to eq station
		end
	end

  	describe '#finish' do

    	it '3.0 allows you to put an exit station into the current journey, when the passenger has tapped in' do
      		journey_log.start(station)
  	  		journey_log.finish(station2)
      		expect(journey_log.view_journeys[-1].exit_station).to eq station2
    	end

    	it '3.1 last journey completed, now just tap out' do
      		journey_log.start(station)
  	  		journey_log.finish(station2)
  	  		journey_log.finish(station)
  	  		expect(journey_log.view_journeys[-1].exit_station).to eq station
    	end

    	it '3.2 just tapped out' do
      		journey_log.finish(station)
      		expect(journey_log.view_journeys[-1].exit_station).to eq station
    	end

  	end
  	
end

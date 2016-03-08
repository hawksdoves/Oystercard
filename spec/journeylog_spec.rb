require 'journeylog'

describe JourneyLog do 

subject(:JourneyLog) {described_class.new}

	it 'initializes with an empty history' do
		expect(subject.journeys).to be_empty
	end

	describe '#start' do

		it 'creates a new journey in history' do
			subject.start "Euston"
			expect(subject.journeys.length).to eq 1
		end
	end

	describe '#finish' do

		it 'completes a journey' do
			subject.start "Euston"
			subject.finish "Kings Cross"
			expect(subject.journeys[0]).to eq ({"Euston" => "Kings Cross"})
		end
	end
end
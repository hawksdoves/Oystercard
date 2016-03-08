require 'journey'

describe Journey do

  subject(:journey) {described_class.new}

  it 'initializes an empty hash' do
    expect(subject.a_journey).to be_empty
  end

  describe '#begin' do

    before(:each) do
      subject.begin("Euston")
    end

    it 'will have a key when beginning journey' do
      expect(subject.a_journey.keys[0]).to eq "Euston"
    end

    it 'will have a nil value prior to touching out' do
      expect(subject.a_journey.values[0]).to eq "nil"
    end

  end

  describe '#end' do

    it 'will no longer have a nil value' do
      subject.begin("Euston")
      subject.end("Kings Cross")
      expect(subject.a_journey.values[0]).to eq "Kings Cross"
    end

  end

  describe '#incomplete?' do

    it 'will return incomplete if passenger does not touch out' do
      subject.begin("Euston")
      expect(subject).to be_incomplete
    end
  end

  describe '#fare' do

    it 'will charge the minimum fare for a journey if journey is complete' do
      subject.begin("Euston")
      subject.end("Kings Cross")
      expect(subject.fare).to eq Journey::MIN_FARE
    end

    it 'will charge the penalty fare for an incomplete journey' do
      subject.begin("Euston")
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end

  end

end

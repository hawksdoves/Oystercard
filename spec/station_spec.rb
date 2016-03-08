require 'station'

describe Station do

  it 'initializes with a name' do
    station1 = Station.new("Euston", 1)
    expect(station1.name).to eq "Euston"
  end

  it 'initializes with a zone' do
    station1 = Station.new("Euston", 1)
    expect(station1.zone).to eq 1
  end

end

require 'oystercard'

describe Oystercard do
  let(:oystercard) {described_class.new}
  let(:station) {double :station, :name => "Old Street", :zone => 1}
  let(:station2) {double :station, :name => "Kings Cross", :zone => 1}
  let(:journey) {double :journey, :start => station, :finish => station2 }

  before do
    oystercard.top_up(20)
    oystercard.tap_in(station)
  end

  describe "#balance" do
    it "1.0 has a balance of £0" do
      expect(subject.balance).to eq 0
    end
  end

  describe "#top_up" do
    it "2.0 tops up the balance by £20" do
      expect(oystercard.balance).to eq 20
    end

    it '2.1 raises error if balance exceeds £90' do
      amount = Oystercard::MAX_BALANCE + 1
      expect{oystercard.top_up(amount)}.to raise_error Oystercard::ERROR
    end
  end

  # describe '#deduct' do
  #   it '3.0 reduce balance by £2' do
      
  #     expect{oystercard.tap_out(station)}.to change(oystercard.balance).by 18
  #   end
  # end

  describe '#in_journey?' do
    it '4.0 in journey when tapped in' do
      expect(oystercard).to be_in_journey
    end
  end

  describe '#tap_in' do
    it '5.0 is in journey' do
      expect(oystercard).to be_in_journey
    end

    it '5.1 if balance < 1 ERROR - INSUFFICIENT FUNDS' do
      expect{subject.tap_in(station)}.to raise_error Oystercard::ERROR_1
    end

    it '5.2 stores entry station' do
      expect(oystercard.journey_history).not_to be_empty
    end
  end

  describe '#tap_out' do
    before do
      oystercard.tap_out(station2)
    end

    it '6.0 is not in journey' do
      expect(oystercard).not_to be_in_journey
    end

    it '6.1 deducts minimum fare from balance' do
      expect{oystercard.tap_out(station)}.to change{oystercard.balance}.by(-Journey::MIN_FARE)
    end

    it '6.2 tap out sets entry station to nil' do
      expect(oystercard).not_to be_in_journey
    end

    it '6.3 stores exit station' do
      expect(oystercard.journey_history[0].exit_station).to eq station2
    end
  end

  describe '#journey_history' do
    it '7.0 is an empty history' do
      oyster = Oystercard.new
      expect(oyster.journey_history).to be_empty
    end
  end

end

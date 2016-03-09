require 'oystercard'

describe Oystercard do
  let(:oystercard) {described_class.new}
  let(:station) {double :station, :name => "Old Street", :zone => 1}
  let(:station2) {double :station, :name => "Kings Cross", :zone => 1}
  let(:journey) {double :journey, :entry => station, :exit => station2 }

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

  describe '#tap_in' do

    it '3.1 if balance < 1 ERROR - INSUFFICIENT FUNDS' do
      expect{subject.tap_in(station)}.to raise_error Oystercard::ERROR_1
    end
  end

  describe '#tap_out' do

    before do
      oystercard.tap_out(station2)
    end


    it '4.1 deducts minimum fare from balance' do
      expect{oystercard.tap_out(station)}.to change{oystercard.balance}.by(-Journey::MIN_FARE)
    end
  end


end

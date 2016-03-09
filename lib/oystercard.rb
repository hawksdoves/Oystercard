require_relative 'station'
require_relative 'journey'

class Oystercard
  attr_reader :balance, :journey_history
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  ERROR = "Limit is £#{MAX_BALANCE}"
  ERROR_1 = "Balance less than £#{MIN_BALANCE} - NO ENTRY"

  def initialize
    @balance = 0
    @journey_history = []
  end

  def top_up(amount)
    raise ERROR if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end


  def tap_in(station)
    raise ERROR_1 if @balance < MIN_BALANCE
    @entry_station = station
    current_journey = Journey.new
    current_journey.start(station)
    journey_history << current_journey
  end

  def tap_out(station)
    deduct(Journey::MIN_FARE)
    @exit_station = station
    @journey_history[-1].finish(station)
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end


  private

  def deduct(fare)
    @balance -= fare
  end

  # def log
  #   @journey_history[:start] = @entry_station
  #   @journey_history[:end] = @exit_station
  # end

end

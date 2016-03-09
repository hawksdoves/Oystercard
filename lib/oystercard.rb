require_relative 'station'
require_relative 'journey_log'

class Oystercard
  attr_reader :balance, :journey_history
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  ERROR = "Limit is £#{MAX_BALANCE}"
  ERROR_1 = "Balance less than £#{MIN_BALANCE} - NO ENTRY"

  def initialize
    @balance = 0
    @journey_log = Journeylog.new
  end

  def top_up(amount)
    raise ERROR if (@balance + amount) > MAX_BALANCE
    @balance += amount
  end


  def tap_in(station)
    raise ERROR_1 if @balance < MIN_BALANCE
    @journey_log.start(station)
  end

  def tap_out(station)
    deduct(Journey::MIN_FARE)
    @journey_log.finish(station)
  end

  private

  def deduct(fare)
    @balance -= fare
  end

end

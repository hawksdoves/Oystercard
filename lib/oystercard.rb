require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance , :entry_station , :history

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MAX_BALANCE_ERROR = "Maximum balance is £#{MAX_BALANCE}."
  MIN_BALANCE_ERROR = "You do not have enough funds for this journey."

  def initialize
    @balance = 0
    @history = Array.new
  end

  def top_up amount
    fail MAX_BALANCE_ERROR if (balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in at_station
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
    journey = Journey.new
    journey.begin(at_station)
   	@history << journey.a_journey
  end

  def touch_out exit_station
    journey = Journey.new
  	deduct journey.fare
    my_key = @history[-1].keys[0]
    @history[-1][my_key] = exit_station
  end

  private

  def deduct amount
    @balance -= amount
  end

end

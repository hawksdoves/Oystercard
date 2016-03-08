require_relative 'journey'
require_relative 'station'

class Oystercard

  attr_reader :balance , :entry_station , :history

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2
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
  	deduct MIN_FARE
    @history[-1][@history[-1].keys[0]] = exit_station
  end

  private

  def deduct amount
    @balance -= amount
  end

end

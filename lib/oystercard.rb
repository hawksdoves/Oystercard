class Oystercard

  attr_reader :balance , :entry_station

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MIN_FARE = 2
  MAX_BALANCE_ERROR = "Maximum balance is £#{MAX_BALANCE}."
  MIN_BALANCE_ERROR = "You do not have enough funds for this journey."

  def initialize
    @balance = 0
  end

  def top_up amount
    fail MAX_BALANCE_ERROR if (balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def touch_in station
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
    @entry_station = station
  end

  def touch_out
  	deduct MIN_FARE
    @entry_station = nil
  end

  private

  def deduct amount
    @balance -= amount
  end

end

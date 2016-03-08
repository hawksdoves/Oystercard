class Oystercard

  attr_reader :balance

  MAX_BALANCE = 90
  MIN_BALANCE = 1
  MAX_BALANCE_ERROR = "Maximum balance is £#{MAX_BALANCE}."
  MIN_BALANCE_ERROR = "You do not have enough funds for this journey."

  def initialize
    @balance = 0
  end

  def top_up amount
    fail MAX_BALANCE_ERROR if (balance + amount) > MAX_BALANCE
    @balance += amount
  end

  def deduct amount
    @balance -= amount
  end

  def touch_in
    fail MIN_BALANCE_ERROR if @balance < MIN_BALANCE
  	@in_travel = true
  end

  def touch_out
  	@in_travel = false
  end

  def in_journey?
  	@in_travel
  end

end

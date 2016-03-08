class Oystercard

  attr_reader :balance
  MIN_FARE = 1
  CARD_LIMIT = 90

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(amount)
    raise "TOO MUCH MONEY - limit is £#{CARD_LIMIT}" if balance + amount > CARD_LIMIT
    @balance += amount
  end

  def touch_in
    raise "YOU TOO PO" if balance < MIN_FARE
    @in_journey = true
  end

  def touch_out
    deduct(MIN_FARE)
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

private

  def deduct(amount)
    @balance -= amount
  end

end

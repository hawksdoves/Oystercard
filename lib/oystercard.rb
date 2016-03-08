class Oystercard

  attr_reader :balance
  MIN_BALANCE = 1
  CARD_LIMIT = 90

  def initialize
    @in_journey = false
    @balance = 0
  end

  def top_up(amount)
    raise "TOO MUCH MONEY - limit is £#{CARD_LIMIT}" if balance + amount > CARD_LIMIT
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    raise "YOU TOO PO" if balance < MIN_BALANCE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

  def in_journey?
    @in_journey
  end

end

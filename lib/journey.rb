 class Journey

    MIN_FARE = 2
    PENALTY_FARE = 6

attr_reader :a_journey

 	def initialize
 		@a_journey = Hash.new
 	end

 	def begin entry_station
 		@a_journey[entry_station] = "nil"
 	end

 	def end exit_station
    my_key = @a_journey.keys[0]
 		@a_journey[my_key] = exit_station
 	end

  def fare
    incomplete? ? PENALTY_FARE : MIN_FARE
  end

  private

  def incomplete?
    a_journey.has_key?("nil") || a_journey.has_value?("nil")
  end

 end

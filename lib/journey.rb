 class Journey

attr_reader :a_journey

 	def initialize
 		@a_journey = Hash.new
 	end

 	def begin entry_station
 		@a_journey[entry_station] = "nil"
 	end

 	def end exit_station
 		@a_journey.keys[0] = exit_station
 	end

 end

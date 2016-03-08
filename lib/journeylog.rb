require_relative 'journey'

class JourneyLog

	attr_reader :journey

	def initialize
		@history = []
	end

	def start entry_station
		journey = Journey.new
	  journey.begin(entry_station)
	   @history << journey
	end

	def finish exit_station
		current_journey
		my_key = @history[-1].a_journey.keys[0]
  	@history[-1].a_journey[my_key] = exit_station
	end

	def journeys
		@history
	end



	def current_journey
		@history[-1].incomplete? ?  @history[-1] : Journey.new
	end

end

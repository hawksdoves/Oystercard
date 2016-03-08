
require_relative 'journey'

class JourneyLog

	def initialize
		@history = []
	end

	def start entry_station
		journey = Journey.new
	    journey.begin(entry_station)
	   	@history << journey.a_journey
	end

	def end exit_station
		 my_key = @history[-1].keys[0]
    	@history[-1][my_key] = exit_station
	end

	def journeys
		@history
	end

	private

	def current_journey
		incomplete? ?  "blah" : Journey.new
	end
end
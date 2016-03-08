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
		current_journey = journey_status
		if current_journey.a_journey.empty? 
			current_journey.end(exit_station)
			@history << current_journey
		else	
			my_key = @history[-1].a_journey.keys[0]
	  		@history[-1].a_journey[my_key] = exit_station
  		end
	end

	def journeys
		@history.map! { |journey| journey.a_journey }
	end

private

	def journey_status
		@history[-1].incomplete? ?  @history[-1] : Journey.new
	end

end

require_relative 'journey'

class Journeylog

  	attr_reader :journey_class

    def initialize(journey_class: Journey)
      	@journey_class = journey_class
      	@journeys = []
    end

    def start(at)
    	my_journey = @journey_class.new
      	my_journey.entry(at)
      	@journeys << my_journey
    end

    def finish(at)
   		if !latest_journey.complete? && !latest_journey.exit_station
     	  	my_journey = @journey_class.new
     	  	my_journey.exit(at)
     	  	@journeys << my_journey
   		elsif !latest_journey.complete? && !latest_journey.entry_station
     	  	current_journey.exit(at)
   		else
	        something = current_journey
	        something.exit(at)
	        @journeys << something
      	end
    end

    def view_journeys
      	@journeys.dup
    end

  	private

    def current_journey
      	latest_journey.complete? ? @journey_class.new  : latest_journey
    end

    def latest_journey
    	@journeys[-1] || @journey_class.new
    end
    
end

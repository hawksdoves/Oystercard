# require_relative 'station'
# require_relative 'oystercard'
require_relative 'journey'

class Journeylog

  attr_reader :journey_class, :journeys

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
 	if !latest_journey.complete? && latest_journey.exit_station !=nil
 	  my_journey = @journey_class.new
 	  my_journey.exit(at)
 	  @journeys << my_journey
 	elsif !latest_journey.complete? && latest_journey.entry_station !=nil
 	  current_journey.exit(at)
 	else
      current_journey.exit(at)
      @journeys << current_journey
    end
  end

  def current_journey
    latest_journey.complete? ? @journey_class.new  : latest_journey
  end

private 

  def latest_journey
  	@journeys[-1]
  end
end

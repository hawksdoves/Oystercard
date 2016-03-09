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
    if @journeys[-1].entry_station == nil
      anything = current_journey
      @journeys << anything
    end
      @journeys[-1].exit(at)
  end

  def current_journey
    @journeys[-1].complete? ? @journey_class.new  : @journeys[-1]
  end
end

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
  	@journey_class.new.entry(at)
  	@journeys << @journey_class
  end

end

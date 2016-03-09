require_relative 'station'
require_relative 'oystercard'
require_relative 'journey'

class Journeylog
  def initialize(journey_class: )
    @journey_class = journey_class
    @journeys = []
  end
end

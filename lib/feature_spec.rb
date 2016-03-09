require_relative 'oystercard'
require_relative 'station'
require_relative 'oystercard'
require_relative 'journey'
require_relative 'journey_log'

p journey = Journey.new

p jlog = Journeylog.new(Journey)



p jlog.store

require_relative 'oystercard'
require_relative 'station'
require_relative 'oystercard'
require_relative 'journey'
require_relative 'journey_log'
hello = Station.new("hello", 1)
bye = Station.new("bye", 5)

journey = Journey.new

journey.entry(hello)
journey.exit(bye)

p journey.fare
p jlog.view_journeys[0]

p '************* HAS TAPPED IN **************'

p '************* HAS TAPPED OUT **************'

jlog.finish(bye)


p '*************** INCORRECT TAP OUT************'

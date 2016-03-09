require_relative 'oystercard'
require_relative 'station'
require_relative 'oystercard'
require_relative 'journey'
require_relative 'journey_log'
hello = Station.new("hello", 7)
bye = Station.new("bye", 9)

jlog = Journeylog.new

jlog.journeys

jlog.start(hello)

p jlog.journeys[0]

p '************* HAS TAPPED IN **************'
p jlog.current_journey
p '************* HAS TAPPED OUT **************'

jlog.finish(bye)

p jlog.journeys[0]

p '*************** INCORRECT TAP OUT************'

p jlog.current_journey
 jlog.finish(hello)

p jlog.journeys

require_relative 'oystercard'
require_relative 'station'
require_relative 'oystercard'
require_relative 'journey'
require_relative 'journey_log'
hello = Station.new("hello", 7)
bye = Station.new("bye", 9)

jlog = Journeylog.new

jlog.view_journeys

jlog.start(hello)

p jlog.view_journeys[0]

p '************* HAS TAPPED IN **************'

p '************* HAS TAPPED OUT **************'

jlog.finish(bye)

p jlog.view_journeys[0]

p '*************** INCORRECT TAP OUT************'


 jlog.finish(hello)

p jlog.view_journeys << "this is going to fuck shit up"
p jlog.view_journeys

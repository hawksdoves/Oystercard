require_relative 'station'
require_relative 'oystercard'


class Journey

	MIN_FARE = 2
	PENALTY_FARE = 6

	attr_reader :entry_station , :exit_station

	def initialize
		@entry_station = nil
		@exit_station = nil
	end

	def start(station)
		@entry_station = station
	end

	def finish(station)
		@exit_station = station
	end

	def fare
		!@entry_station || !@exit_station ? PENALTY_FARE : MIN_FARE
	end
end

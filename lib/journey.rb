require_relative 'station'
require_relative 'oystercard'


class Journey

	MIN_FARE = 1
	PENALTY_FARE = 6

	attr_reader :entry_station , :exit_station

	def initialize
		@entry_station = nil
		@exit_station = nil
  end

	def entry(at)
		@entry_station = at
	end

	def exit(at)
		@exit_station = at
	end

	def fare
		!@entry_station || !@exit_station ? PENALTY_FARE : charge
	end

  def zones_crossed
    @exit_station.zone - @entry_station.zone
  end

  def charge
    MIN_FARE + zones_crossed
  end

  def complete?
    !!@entry_station && !!@exit_station
  end
end

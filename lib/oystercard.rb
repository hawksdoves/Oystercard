
require_relative 'journeylog'
require_relative 'station'

class Oystercard

  	attr_reader :balance

  	CARD_LIMIT = 90
  	MAX_LIMIT_ERROR = "Balance would be above card limit of £#{CARD_LIMIT}."
  	MIN_BAL_ERROR = "Balance is below minimum fare."

  	def initialize(journeylog=JourneyLog)
    	@journeylog = journeylog.new
    	@balance = 0
  	end

  	def top_up(amount)
	    raise MAX_LIMIT_ERROR if balance + amount > CARD_LIMIT
	    @balance += amount
  	end

  	def touch_in(station)
	    raise MIN_BAL_ERROR if balance < Journey::SINGLE_ZONE_FARE 
	    if !@journeylog.history.empty? && !@journeylog.history[-1].journey_complete?   
	        deduct     
	    end
	    @journeylog.start(station)
  	end

  	def touch_out(exit_station)
	    @journeylog.finish(exit_station) 
	    deduct
  	end
    
	private

  	def deduct
    	@balance -= (@journeylog.history[-1].fare) 
  	end
  
end

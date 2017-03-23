#adds all trips (both complete and incomplete) to journey history 
class Log

  attr_reader :journey_history

  def initialize
    @journey_history = []
  end

  def add_trip(trip)
    journey_history << trip
  end

end

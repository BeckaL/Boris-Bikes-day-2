require_relative 'bike'
require 'pry'

class DockingStation
  attr_reader  :rack, :CAPACITY

  def initialize(capacity = 20)
    @rack = []
    @CAPACITY = capacity

  end

  def release_bike
    fail 'There are no bikes available at this station' unless !(@rack.empty?)
    working_bikes = @rack.map.select { |bike| bike.working? }
    fail 'No working bikes available' unless !(working_bikes.empty?)
    # Need to remember to come back to this to fix for multiple bikes
    working_bikes.pop
  end

  def dock(bike)
    fail 'Rack full' unless !full?
    @rack.push(bike)
  end

private
def full?
  @rack.length >= @CAPACITY ? true : false
end

end

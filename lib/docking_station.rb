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
    @rack.delete(working_bikes.first)
  end

  def dock(bike)
    fail 'Rack full' unless !full?
    @rack.push(bike)
    return 'Broken bike has been reported' if !(bike.working?)
  end

private
def full?
  @rack.length >= @CAPACITY ? true : false
end

end

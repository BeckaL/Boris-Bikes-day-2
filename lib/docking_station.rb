require_relative 'bike'

class DockingStation
  attr_reader  :rack, :DEFAULT_CAPACITY

  def initialize
    @rack = []
    @DEFAULT_CAPACITY = 20

  end

  def release_bike
    fail 'There are no bikes available at this station' unless !(@rack.empty?)
    Bike.new
  end

  def dock(bike)
    fail 'Rack full' unless !full?
    @rack.push(bike)
  end

private
def full?
  @rack.length >= @DEFAULT_CAPACITY ? true : false
end

end

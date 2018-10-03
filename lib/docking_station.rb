require_relative 'bike'

class DockingStation
  attr_reader  :rack

  def initialize
    @rack = []
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
  @rack.length >= 20 ? true : false
end

end

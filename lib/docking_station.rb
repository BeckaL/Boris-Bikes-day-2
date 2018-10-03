require_relative 'bike'

class DockingStation
  attr_reader  :rack

  def initialize
    @rack = []
  end

  def release_bike
    if @rack.length == 0
      raise 'There are no bikes available at this station'
    else
      Bike.new
    end
  end

  def dock(bike)
    fail 'Rack full' unless rack.length < 20
    @rack.push(bike)
  end
end

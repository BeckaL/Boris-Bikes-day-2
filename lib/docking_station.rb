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
    @rack.pop
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

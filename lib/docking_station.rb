require_relative 'bike'

class DockingStation
  attr_reader  :rack

  def initialize
    @rack = []
  end

  def release_bike
    Bike.new
  end

  def dock(bike)
    true
  end
end

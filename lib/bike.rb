class Bike
  attr_reader :working


  def initialize(working = true)
    @working = working
  end


  def working?
    return @working
  end
end

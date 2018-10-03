require 'docking_station'

describe DockingStation do
  it 'responds to release bike' do
    expect(DockingStation.new).respond_to?(:release_bike)
  end
end

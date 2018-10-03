require 'docking_station'
require 'bike'

describe DockingStation do
  it 'responds to release bike' do
    expect(DockingStation.new).respond_to?(:release_bike)
  end
  it 'gets a bike and expects it to be working' do
    bike = DockingStation.new.release_bike
    expect(bike.working?).to eq true
  end
end

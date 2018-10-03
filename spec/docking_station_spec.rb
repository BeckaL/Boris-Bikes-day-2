require 'docking_station'
require 'bike'
require 'pry'

describe DockingStation do

  it 'responds to release bike' do
    expect(DockingStation.new).respond_to?(:release_bike)
  end

  it 'does not release a bike if the rack is empty' do
    ds = DockingStation.new
    # binding.pry
    expect { ds.release_bike }.to raise_error 'There are no bikes available at this station'
  end

  it 'gets a bike and expects it to be working' do
    bike = DockingStation.new.release_bike
    expect(bike.working?).to eq true
  end

  it 'docks bike' do
    ds = DockingStation.new
    bike = Bike.new
    expect(ds.dock(bike)).to eq true
  end


end

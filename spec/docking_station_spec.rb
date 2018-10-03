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
    ds = DockingStation.new
    ds.rack.push(Bike.new)
    bike = ds.release_bike
    expect(bike.working?).to eq true
  end

  it 'docks bike' do
    ds = DockingStation.new
    bike = Bike.new
    ds.dock(bike)
    expect(ds.rack.length).to eq 1
  end

  it 'does not dock bike when rack is full' do
    ds = DockingStation.new
    bike = Bike.new
    ds.dock(bike)
    second_bike = Bike.new
    expect { ds.dock(second_bike) }.to raise_error 'Rack full'
  end


end

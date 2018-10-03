require 'docking_station'
require 'bike'
require 'pry'

describe DockingStation do

  it 'responds to release bike' do
    expect(DockingStation.new).respond_to?(:release_bike)
  end

  it 'does not release a bike if the rack is empty' do
    ds = DockingStation.new
    expect { ds.release_bike }.to raise_error 'There are no bikes available at this station'
  end

  it 'gets a bike and expects it to be working' do
    ds = DockingStation.new
    ds.rack.push(Bike.new)
    bike = ds.release_bike
    expect(bike.working?).to eq true
  end

  it 'docks working bike' do
    ds = DockingStation.new
    bike = Bike.new
    ds.dock(bike)
    expect(ds.rack.length).to eq 1
  end

  it 'docks broken bike' do
    ds = DockingStation.new
    bike = Bike.new(false)
    ds.dock(bike)
    expect(ds.rack.length).to eq 1
  end

  it 'does not dock bike when rack is full' do
    ds = DockingStation.new
    ds.CAPACITY.times { ds.dock(Bike.new) }
    expect { ds.dock(Bike.new) }.to raise_error 'Rack full'
  end

  it 'set custom capacity for docking station' do
    ds = DockingStation.new(1)
    expect(ds.CAPACITY).to eq 1
  end

  it 'no capacity specified, default capacity is 20' do
    ds = DockingStation.new
    expect(ds.CAPACITY).to eq 20
  end

  it 'does not release a broken bike' do
    ds = DockingStation.new
    broken_bike = Bike.new(false)
    ds.dock(broken_bike)
    expect { ds.release_bike }.to raise_error 'No working bikes available'
  end

  it 'releases bike when working and non working bike both in dock' do
    ds = DockingStation.new
    working_bike = Bike.new
    broken_bike = Bike.new(false)
    ds.dock(broken_bike)
    ds.dock(working_bike)
    expect(ds.release_bike.working?).to eq true
  end

  it 'reports a broken bike when returned to docking station' do
    ds = DockingStation.new
    broken_bike = Bike.new(false)
    expect(ds.dock(broken_bike)).to eq 'Broken bike has been reported'
  end

end

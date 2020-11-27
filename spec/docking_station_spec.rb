require "../lib/docking_station"

describe DockingStation do
  it { is_expected.to respond_to(:release_bike)} 
  
  it 'gets a bike' do
    subject = DockingStation.new
    subject.dock
    expect(subject.release_bike).to be_instance_of Bike
  end 

  it 'docking station allows a bike to be docked' do
    expect(subject).to respond_to :dock
  end

  it 'raises an error if station does not have bike' do
    docking_station = DockingStation.new
    expect {docking_station.release_bike}.to raise_error 'no bikes'
  end

  it 'raises an error if the capacity(1) if full' do
    docking_station = DockingStation.new
    21.times {docking_station.dock}
    expect {docking_station.dock}.to raise_error 'station full'
  end

  it 'checks that a new docking station take a capacity argument' do
    expect(DockingStation).to respond_to(:new).with(1).argument
  end

  it 'checks that the default capacity is 20' do
    ds = DockingStation.new 
    expect(ds.default_capacity).to eq 20
  end

  it 'allows user to dock a broken bike' do
    subject = Bike.new
    subject.report_broken
    expect(subject).to be_broken
  end
  
end



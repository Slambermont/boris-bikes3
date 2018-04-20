require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  describe '#initialize' do
    it 'should have allow the maintainer to set the capacity' do
      station = DockingStation.new(30)
      expect(station.capacity).to eq 30
    end
    it 'should have a capacity of the DefaultCapacity if the maitainer fails to set one' do
    station = DockingStation.new
    expect(station.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end
end

  describe '#release_bike' do
    it 'releases a working bike' do
      bike = Bike.new
      expect(bike.working).to eq true
    end
    it 'raises an error when dock is empty' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

  describe '#dock' do
    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq [bike]
    end
    it 'raises an error message when dock is full' do
      bike = Bike.new
      subject.dock(bike)
      expect { DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) } }.to raise_error("Dock is full")
    end
#    it 'Allows the user to tell the station that the bike is broken' do
#      subject.dock(Bike.new, 'broken')
#      expect(subject.docks).to eq [Bike.new 'broken']
#    end

  end

  describe '#bike' do
    it 'returns docked bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.docks).to eq [bike]
    end
  end

end

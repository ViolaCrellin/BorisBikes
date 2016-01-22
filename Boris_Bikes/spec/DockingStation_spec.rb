require 'DockingStation'

describe DockingStation do
  let(:dummy_bike) { double :bike }
  subject(:DockingStation) {described_class.new}


# INITIALIZE TESTS

  describe "#initialize" do
    it "gives the docking station a default capacity of 20 when initializing a docking station" do
      expect(subject.capacity).to eq (20)
    end
    it "allows the user to set a default capacity when initializing a docking station" do
      station = DockingStation.new(45)
      45.times {station.dock dummy_bike}
      expect{station.dock dummy_bike}.to raise_error("Docking station full")
    end
  end

# DOCKING BIKE TESTS

  describe "#dock(bike)" do
    context 'responds to "dock" with one argument'
      it { is_expected.to respond_to(:dock).with(1).argument}

      it 'raises error "Docking Station Full" when docking station capacity is reached' do
        DockingStation::DEFAULT_CAPACITY.times {subject.dock(dummy_bike)}
        expect {subject.dock(dummy_bike)}.to raise_error("Docking station full")
      end
    end

# ATTR_ READER TEST

  context 'responds to "bikes"'
    it { is_expected.to respond_to(:bikes)}



# RELEASE BIKES TESTS

  describe '#release_bike' do
    it 'expects "release_bike" to get a working bike' do
      # allow(dummy_bike).to receive(:broken?).and_return(false)
      bike = double(:dummy_bike, broken?: false)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises error "No Bikes Available" when docking station is empty' do
      expect { subject.release_bike }.to raise_error("No Bikes Available")
    end

    it 'raises error "Sorry, this Bike is Broken" when asked to release a broken bike.' do
      # allow(dummy_bike).to receive(:report_broken).and_return(true)
      # allow(dummy_bike).to receive(:broken?).and_return(true)
      bike = double(:dummy_bike, broken?: true, report_broken: true)
      bike.report_broken
      subject.dock(bike)
      expect(subject.release_bike).to eq("Sorry, this Bike is Broken")

    end
  end

    describe "#replenish_bikes" do

      it {is_expected.to respond_to(:replenish_bikes).with(1).argument}

      it "can accept bikes fixed at the garage to replenish the docking station" do
        bike = Bike.new
        station = DockingStation.new
        van = Van.new
        10.times do
          van.cargo << bike
        end

      expect(station.replenish_bikes(van.cargo)).to eq station.bikes

      end
    end
end

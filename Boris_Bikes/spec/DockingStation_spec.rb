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

  context 'responds to "dock" with one argument'
    it { is_expected.to respond_to(:dock).with(1).argument}

  it 'raises error "Docking Station Full" when docking station capacity is reached' do
    DockingStation::DEFAULT_CAPACITY.times {subject.dock(dummy_bike)}
    expect {subject.dock(dummy_bike)}.to raise_error("Docking station full")
  end

# ATTR_ READER TEST

  context 'responds to "bikes"'
    it { is_expected.to respond_to(:bikes)}



# RELEASE BIKES TESTS

  it { should respond_to(:release_bike) }

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

    #RELEASE BROKEN BIKES

    describe '#release broken bikes' do
      it {is_expected.to respond_to (:release_broken_bikes).with(1).argument }
    end

end

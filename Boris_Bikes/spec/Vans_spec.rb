require 'Vans'

describe Van do
  subject(:van) {described_class.new}
  # let(:dummy_dockingstation) { double :DockingStation }
# INITIALIZE TESTS

  describe "#Initialize" do

      it "Expects a new van to return an empty array" do
      expect(subject.cargo).to eq []
    end
  end

#PICKUP BROKEN BIKES FROM DOCKING STATION TESTS

describe "#pickup_broken_bikes" do

    it { should respond_to(:pickup_broken_bikes) }

    it "Picks up broken bikes from DockingStation" do
      #STUB MOCK ME UP! BABY
      station = DockingStation.new
      bike = Bike.new
      bike.report_broken
      station.dock(bike)
      station.find_working_bikes
      expect(subject.pickup_broken_bikes(station.broken_bikes)).to eq [bike]
    end
  end

  describe "#pickup_working_bikes" do

    it {is_expected.to respond_to(:pickup_working_bikes).with(1).argument}

    it "can pick up working bikes from the garage" do
      garage = Garages.new
      van = Van.new

      10.times do
        garage.bikes_at_garage <<  bike = Bike.new
      end

      garage.fix_broken_bikes
      expect(van.pickup_working_bikes(garage.fix_broken_bikes)[0]).to be false
    end


  end

end

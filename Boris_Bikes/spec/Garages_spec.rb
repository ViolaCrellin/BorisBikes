require 'Garages'

describe Garages do
let(:bike) {Bike.new}
let(:station) {DockingStation.new}
let(:van) {Van.new}

#UNLOADS TESTS
  describe "#unloads" do
    context "It should respond to #unload with one argument"
    it { is_expected.to respond_to(:unload).with(1).argument}

    it "#unloads a van with broken_bikes in it" do
      station.dock(bike)
      station.find_working_bikes
      expect(van.pickup_broken_bikes(station.broken_bikes)).to eq subject.unload(van.cargo)
    end
  end

  describe "#fixes_broken_bikes" do
    it "Fixes broken bikes" do
      bike.report_broken
      station.dock(bike)
      station.find_working_bikes
      van.pickup_broken_bikes(station.broken_bikes)
      subject.unload(van.cargo)
      expect(subject.fix_broken_bikes[0]).to be false
    end
  end

end

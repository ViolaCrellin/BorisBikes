require 'Bike'

#CHECK METHODS EXIST

describe Bike do
  subject(:bike) { described_class.new }

  it { should respond_to(:working?) }

#BROKEN TESTS


  describe '#report_broken' do
    it 'allows user to report a broken bike' do
      expect(bike.report_broken).to be true
    end
  end

  describe '#broken?' do
    it 'returns true when bike is broken' do
      bike.report_broken
      expect(bike.broken?).to be true
    end
  end

  describe "#fix" do
    it 'returns false when bike is fixed' do
      bike.fix
      expect(bike.broken?).to be false
    end
  end

end

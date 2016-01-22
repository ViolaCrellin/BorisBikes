require_relative 'Bike'

class DockingStation

DEFAULT_CAPACITY = 20
attr_reader :capacity, :bikes

  def initialize (capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "No Bikes Available" if @bikes.empty?
    if find_working_bikes.is_a? String
      return find_working_bikes
    else
      find_working_bikes.pop
    end
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike # => Shovelling a bike into the array
  end

  def replenish_bikes(working_bikes)
    raise "Docking station full" if full?
    @bikes << working_bikes
    @bikes.flatten!
  end


  def find_working_bikes
    working_bikes = []
    @bikes.each do |bike|
      if bike.broken?
        return "Sorry, this Bike is Broken"
      else
        working_bikes << bike
      end
    end
    working_bikes
  end

  def broken_bikes
    broken_bikes = @bikes.select {|bike| bike.broken?}
  end

private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

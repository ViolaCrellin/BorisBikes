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

    for i in 0..@bikes.size
      bike = @bikes[i]
        return @bikes.delete_at(i) if bike.broken? == false
      end
        fail "Sorry, this Bike is Broken"
  end

  def dock(bike)
    raise "Docking station full" if full?
    @bikes << bike # => Shovelling a bike into the array
  end

  def sort_broken_bikes
    @bikes.select! {|bike| bike.broken? == true }
    @bikes.flatten!
  end

private

  def full?
    @bikes.size >= @capacity
  end

  def empty?
    @bikes.empty?
  end
end

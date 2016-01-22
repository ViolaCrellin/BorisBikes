require_relative 'DockingStation'
require_relative 'Garages'

class Van

attr_reader :cargo

  def initialize
    @cargo = []
  end

  def pickup_broken_bikes(broken_bikes) #dockingstation.broken_bikes
    @cargo << broken_bikes
    @cargo.flatten!
  end

#van.pickup_broken_bikes(station.broken_bikes)

  def pickup_working_bikes(working_bikes) #station.broken_bikes
    @cargo << working_bikes
    @cargo.flatten!
  end

end

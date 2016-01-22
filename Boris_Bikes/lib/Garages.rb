require_relative 'Vans'

class Garages

attr_reader :bikes_at_garage

  def initialize(bikes_at_garage=[])
    @bikes_at_garage = bikes_at_garage
  end

  def unload(cargo)  # van.cargo
    @bikes_at_garage << cargo
    @bikes_at_garage.flatten!
  end

  def fix_broken_bikes
    @bikes_at_garage.map {|bike| bike.fix}
  end


end

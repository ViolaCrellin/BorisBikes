class Bike

  def initialize(broken=false)
    @broken = broken
  end

  def working?
    if @broken == false
      true
    end
  end

  def report_broken
    @broken = true
  end

  def broken?
    @broken
  end

end

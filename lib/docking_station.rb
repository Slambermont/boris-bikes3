class DockingStation
  def dock_bike(bike)
    @bike = bike
  end

  def release_bike
    Bike.new
  end

  attr_reader :bike
end

require_relative 'bike'

class DockingStation
  attr_reader :docks, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docks = []
    @capacity = capacity
  end

  def release_bike
    raise "No bikes available" if empty?
    @docks.pop
  end

  def dock(bike)
    raise "Dock is full" if full?
    @docks << bike
  end

  private

  def full?
    @docks.count >= DEFAULT_CAPACITY
  end

  def empty?
    @docks.empty?
  end

end

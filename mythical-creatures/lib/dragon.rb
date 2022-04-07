# lib/dragon.rb

class Dragon
  attr_reader :name, :color, :rider

  def initialize(name, color, rider, tummy = 0)
    @name = name
    @color = color
    @rider = rider
    @tummy = tummy
  end

  def hungry?
    @tummy < 3
  end

  def eat
    @tummy += 1
  end
end

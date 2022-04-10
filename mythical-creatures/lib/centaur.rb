# lib/centaur.rb
require 'pry'

class Centaur
  attr_reader :name, :breed, :cranky, :standing, :energy

  def initialize(name, breed, cranky = false, standing = true)
    @name = name
    @breed = breed
    @cranky = cranky
    @standing = standing
    @energy = 3
  end

  def shoot
    if @energy > 0 && @standing
    energy_expend
    'Twang!!!'
    else
     'NO!'
    end
  end

  def run
    if @energy > 0 && @standing
    energy_expend
    'Clop clop clop clop!'
    else
     'NO!'
    end
  end

  def cranky?
    @cranky
  end

  def standing?
    @standing
  end

  def laying?
    !@standing
  end

  def energy_expend
    @energy -= 1
    if @energy == 0
      @cranky = !@cranky
    end
  end

  def sleep
    if !@standing
      @energy = 3
      @cranky = !@cranky
    else
      'NO!'
    end
  end

  def lay_down
    @standing = !@standing
  end

  def stand_up
    @standing = !@standing
  end

  def drink_potion
    if @energy == 0 && @standing
      @energy = 3
      @cranky = !@cranky
      'glug glug'
    else
     'Sickness has set in!'
    end
  end

end

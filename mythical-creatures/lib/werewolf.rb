# lib/werewolf.rb
require 'pry'

class Werewolf
  attr_reader :name, :location, :human, :hungry, :consumed_victims

  def initialize(name, location = 'London', human = true, hungry = false)
    @name = name
    @location = location
    @human = human
    @hungry = hungry
    @consumed_victims = []
  end

  def human?
    @human
  end

  def wolf?
    !@human
  end

  def hungry?
    @hungry
  end

  def change!
    @human = !@human
    @hungry = !@hungry
  end

  def feed(victim)
    if wolf? && hungry?
      @consumed_victims << victim
      @hungry = !@hungry
      victim.status = :dead
    else
      "humans can't feed"
    end
  end
end


class Victim
  attr_accessor :status

  def initialize
    @status = :alive
  end
end

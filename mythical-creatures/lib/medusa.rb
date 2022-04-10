# lib/medusa.rb
require 'pry'

class Medusa
  attr_reader :name, :statues
  def initialize(name)
    @name = name
    @statues = []
  end

  def stare(victim)
    @statues << victim
    victim.stone
    @extra = @statues.shift if statue_limit?
    extra_victim
  end

  def statue_count
    @statues.length
  end

  def statue_limit?
    statue_count > 3
  end

  def extra_victim
    @extra.un_stone if !@extra.nil?
  end

end

class Person
  attr_reader :name, :stoned
  def initialize(name, stoned = false)
    @name = name
    @stoned = stoned
  end

  def stone
    @stoned = true
  end

  def un_stone
    @stoned = false
  end

  def stoned?
    @stoned
  end

end

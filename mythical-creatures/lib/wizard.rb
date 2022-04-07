# lib/wizard.rb

class Wizard
  attr_reader :name, :rested, :spells

  def initialize(name, bearded: true)
    @name = name
    @beard = bearded
    @rested = 0
  end

  def bearded?
    @beard
  end

  def incantation(command)
   "sudo #{command}"
  end

  def rested?
    @rested < 3
  end

  def cast
    @rested += 1
    "MAGIC MISSILE!"
  end
end

# lib/pirate.rb

class Pirate
  attr_reader :name, :job, :karma, :booty

  def initialize(name, job = 'Scallywag', booty = 0)
    @name = name
    @job = job
    @karma = 0
    @booty = booty
  end

  def cursed?
    @karma >= 3
  end

  def commit_heinous_act
    @karma += 1
  end

  def plunder
    @booty += 100
  end
end

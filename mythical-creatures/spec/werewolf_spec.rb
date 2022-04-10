require 'rspec'
require './lib/werewolf'

RSpec.describe Werewolf do
  it 'has a name' do
    werewolf = Werewolf.new('David')
    expect(werewolf.name).to eq('David')
  end

  it 'has a location' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.location).to eq('London')
  end

  it 'is by default human' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true
  end

  it 'when starting as a human, changing makes it turn into a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    expect(werewolf.wolf?).to be true
    expect(werewolf.human?).to be false
  end

  it 'when starting as a human, changing again makes it be human again' do
    werewolf = Werewolf.new('David', 'London')
    expect(werewolf.human?).to be true

    werewolf.change!

    expect(werewolf.human?).to be false

    werewolf.change!

    expect(werewolf.human?).to be true
  end

  it 'when starting as a werewolf, changing a second time makes it a werewolf' do
    werewolf = Werewolf.new('David', 'London')

    werewolf.change!
    expect(werewolf.wolf?).to be true

    werewolf.change!
    werewolf.change!

    expect(werewolf.wolf?).to be true
  end

  it 'is not hungry by default' do
    werewolf = Werewolf.new('David', 'London')

    expect(werewolf.hungry?).to eq false
  end

  it 'becomes hungry after changing to a werewolf' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!

    expect(werewolf.hungry?).to eq true
  end

  it 'consumes a victim' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    victim = Victim.new
    werewolf.feed(victim)

    expect(werewolf.consumed_victims).to eq [victim]
  end

  it 'cannot consume a victim if it is in human form' do
    werewolf = Werewolf.new('David', 'London')
    victim = Victim.new

    expect(werewolf.feed(victim)).to eq "humans can't feed"
  end

  it 'a werewolf that has consumed a human being is no longer hungry' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    victim = Victim.new
    werewolf.feed(victim)

    expect(werewolf.hungry?).to eq false
  end

  it 'a werewolf who has consumed a victim makes the victim dead' do
    werewolf = Werewolf.new('David', 'London')
    werewolf.change!
    victim = Victim.new
    werewolf.feed(victim)

    expect(victim.status).to eq :dead
  end
end

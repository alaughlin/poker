require 'hand.rb'

class Player
  attr_reader :name
  attr_accessor :bankroll

  def initialize(name, game, bankroll = 100)
    @name, @game, @bankroll = name, game, bankroll
  end

end


require 'hand.rb'

class Player
  attr_reader :name
  attr_accessor :bankroll
  attr_writer :game

  def initialize(name, bankroll = 100)
    @name, @bankroll = name, bankroll
  end

end


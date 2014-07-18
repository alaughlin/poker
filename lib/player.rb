class Player
  attr_reader :name
  attr_accessor :bankroll, :hand
  attr_writer :game

  def initialize(name, bankroll = 100)
    @name, @bankroll = name, bankroll
  end

  def inspect
    p @name
  end
end


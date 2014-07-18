class Card
  SUITS = {
    :s => "♠",
    :d => "♦",
    :c => "♣",
    :h => "♥"
  }

  VALUES = {
    2 => "2",
    3 => "3",
    4 => "4",
    5 => "5",
    6 => "6",
    7 => "7",
    8 => "8",
    9 => "9",
    10 => "10",
    11 => "J",
    12 => "Q",
    13 => "K",
    14 => "A"
  }

  attr_reader :suit, :value

  def initialize(suit, value)
    @suit, @value = suit, value
  end

  def inspect
    "#{SUITS[suit]}#{VALUES[value]}"
  end
end
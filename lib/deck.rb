require_relative 'card'

class Deck < Array
  SUITS = [:s, :d, :c, :h]
  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

  def initialize
    super
    populate_deck
  end

  def populate_deck
    SUITS.each do |suit|
      VALUES.each do |value|
        self << Card.new(suit, value)
      end
    end
  end
end
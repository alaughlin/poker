require_relative 'deck'

class Hand < Array
  attr_accessor :contents
  def initialize(deck)
    super([])

   # @contents = []
    5.times do
      self << deck.pop
    end
  end



end
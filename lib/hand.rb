require_relative 'deck'

class Hand < Array

  def initialize(deck)
    @deck = deck

    super([])

    5.times do
      self << deck.pop
    end

  end

  def return_cards(returned card indices)
    #give certain cards
    #take same number from @deck
  end

end
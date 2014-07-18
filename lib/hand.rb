require_relative 'deck'

class Hand < Array

  def initialize(deck, cards = false)
    @deck = deck

    super([])


    unless cards
      5.times do
        self << @deck.pop
      end
    else
      self.concat(cards)
    end


  end

  def exchange_cards(*indices)
    return_cards(indices)
    take_cards(indices.length)
  end

  def hand_strength
    if is_straight_flush?
      8
    elsif is_four_of_a_kind?
      7
    elsif is_full_house?
      6
    elsif is_flush?
      5
    elsif is_straight?
      4
    elsif is_three_of_a_kind?
      3
    elsif is_two_pair?
      2
    elsif one_pair?
      1
    else
      0
    end
  end

  private

  def return_cards(indices)
    indices.each do |idx|
      @deck.unshift(self[idx])
    end

    indices.sort.reverse.each do |idx|
      self.delete_at(idx)
    end
  end

  def take_cards(num)
    num.times do
      self << @deck.pop
    end
  end

  def is_straight_flush?
    self.is_flush? && self.is_straight?
  end

  def is_four_of_a_kind?
    counts = Hash.new(0)

    self.each do |card|
      counts[card.value] += 1
    end

    counts.values.include?(4)
  end

  def is_full_house?
    counts = Hash.new(0)

    self.each do |card|
      counts[card.value] += 1
    end

    counts.values.include?(2) && counts.values.include(3)
  end

  def is_flush?
    self.each do |card|
      if card.suit != self.first.suit
        return false
      end
    end

    true
  end

  def is_straight?
    self.sort_by!{ |card| card.value }
    values_arr = self.map { |card| card.value }

    (self.last.value - self.first.value) == 4 && values_arr.uniq.length == 5
  end

  def is_three_of_a_kind?
    counts = Hash.new(0)

    self.each do |card|
      counts[card.value] += 1
    end

    counts.values.include?(3)
  end

  def is_two_pair?
    counts = Hash.new(0)
    value_counts = Hash.new(0)

    self.each do |card|
      counts[card.value] += 1
    end

    counts.values.each do |value|
      value_counts[value] += 1
    end

    value_counts[2] == 2
  end

  def is_pair?
    self.map { |card| card.value }.uniq == 4
  end

end
require 'deck'

describe "Deck" do
  subject(:deck) { Deck.new }

  it "contains 52 cards initially" do
    expect(deck.length).to eq(52)
  end

  it "contains only unique cards" do
    expect(deck.uniq).to eq(deck)
  end
end
require 'rspec'
require 'card'

describe "Card" do

  subject(:card) { Card.new(:s, 1) }

  it "has a suit" do
    expect(card.suit).to eq(:s)
  end

  it "has a value" do
    expect(card.value).to eq(1)
  end

end
require 'hand'

describe "Hand" do
  let(:deck) { [1,2,3,4,5] }
  subject(:hand) { Hand.new(deck) }

  it "should contain five cards" do
    expect(hand.length).to eq(5)
  end

  it "identify hand value"






end
require 'hand'

describe "Hand" do
  let(:deck) { [1,2,3,4,5,6,7,8,9,10] }
  subject(:hand) { Hand.new(deck) }

  it "should contain five cards" do
    expect(hand.length).to eq(5)
  end

  it "can exchange cards with deck" do

    expect(deck).to_receive(:unshift)

  end

  it "should accurately identify hand value"






end
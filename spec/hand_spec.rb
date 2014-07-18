require 'hand'

describe "Hand" do
  let(:deck) { [1,2,3,4,5,6,7,8,9,10] }
  subject(:hand) { Hand.new(deck) }

  it "should contain five cards" do
    expect(hand.length).to eq(5)
  end

  context "exchanges card with deck" do
    it "hand is different after exchange" do
      expect(hand.exchange_cards(3,4)).to_not eq([6,7,8,9,10])
    end

    it "deck is different after exchange" do
      expect(hand.exchange_cards(3,4)).to_not eq([1,2,3,4,5])
    end
  end

  context "working with hand stength"
    it "should accurately identify hand strength" do

    end

    it "should find a straight flush" do
      straight_flush = Hand.new(:deck, [Card.new(:s, 2),
                                        Card.new(:s, 3),
                                        Card.new(:s, 4),
                                        Card.new(:s, 5),
                                        Card.new(:s, 6)] )


      expect(straight_flush.is_straight_flush?).to eq(true)
    end

    it "doesn't falsely identify a straight flush" do
      straight_flush = Hand.new(:deck, [Card.new(:s, 2),
                                        Card.new(:s, 3),
                                        Card.new(:s, 4),
                                        Card.new(:s, 5),
                                        Card.new(:s, 7)] )


      expect(straight_flush.is_straight_flush?).to eq(false)

    end
end
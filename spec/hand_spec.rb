require 'hand'

describe "Hand" do
  let(:deck) { [1,2,3,4,5,6,7,8,9,10] }
  subject(:hand) { Hand.new(deck) }

  it "should contain five cards" do
    expect(hand.length).to eq(5)
  end

  context "exchanges card with deck" do
    it "hand is different after exchange" do
      expect(hand.exchange_cards([3,4])).to_not eq([6,7,8,9,10])
    end

    it "deck is different after exchange" do
      expect(hand.exchange_cards([3,4])).to_not eq([1,2,3,4,5])
    end
  end

  context "working with hand stength" do

    it "accurately identifies hand strength" do
      two_pair = Hand.new(:deck, [Card.new(:s, 2),
                                  Card.new(:h, 2),
                                  Card.new(:s, 3),
                                  Card.new(:h, 3),
                                  Card.new(:s, 6)] )
      expect(two_pair.hand_strength).to eq(2)
    end

    it "handles aces in straights" do
      ace_straight = Hand.new(:deck, [Card.new(:s, 2),
                                      Card.new(:h, 3),
                                      Card.new(:s, 4),
                                      Card.new(:h, 5),
                                      Card.new(:s, 14)] )
      expect(ace_straight.hand_strength).to eq(4)
    end

    it "should prioritize stronger hands I" do
      straight_flush = Hand.new(:deck, [Card.new(:s, 2),
                                        Card.new(:s, 3),
                                        Card.new(:s, 4),
                                        Card.new(:s, 5),
                                        Card.new(:s, 6)] )
      expect(straight_flush.hand_strength).to eq(8)
    end

    it "should prioritize stronger hands II" do
      full_house = Hand.new(:deck, [Card.new(:s, 2),
                                    Card.new(:h, 2),
                                    Card.new(:d, 2),
                                    Card.new(:s, 3),
                                    Card.new(:h, 3)] )
      expect(full_house.hand_strength).to eq(6)
    end

    it "should return 0 for hand without value" do
      weak_hand = Hand.new(:deck, [Card.new(:s, 2),
                                    Card.new(:h, 3),
                                    Card.new(:d, 6),
                                    Card.new(:s, 9),
                                    Card.new(:h, 11)] )
      expect(weak_hand.hand_strength).to eq(0)
    end

  end
end
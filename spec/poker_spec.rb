require 'poker'

describe "Poker" do
  let(:player1) { double("player1") }
  let(:player2) { double("player2") }
  subject(:poker) { Poker.new(player1, player2) }


end

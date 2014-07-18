require_relative 'hand'
require_relative 'player'

class Poker
  def initialize(*players)
    @players = players

    @players.each do |player|
      player.game = self
    end
  end

  def play
    until over?
      @current_players = @players.dup

      @deck = Deck.new.shuffle

      @pot = 0

      puts "starting new hand"

      deal_hands(@current_players)
      puts "Betting, phase 1"
      get_bets(@current_players)

      if @current_players.length == 1
        p "number of global players: #{@players}"
        distribute_pot(compare_hands(@current_players))
        next
      end

      change_cards(@current_players)
      puts "Betting, phase 2"
      get_bets(@current_players)

      if @current_players.length == 1
        distribute_pot(compare_hands(@current_players))
        next
      end

      distribute_pot(compare_hands(@current_players))
    end
  end

  def over?
    i = 0

    @players.each do |player|
      i += 1 if player.bankroll > 0
    end

    i == 1
  end

  def deal_hands(players)
    players.each do |player|
      player.hand = Hand.new(@deck)
    end
  end

  def get_bets(players)
    players.each do |player|
      p player.hand

      puts "Pot: #{@pot}"
      puts "Name: #{player.name}, Money: #{player.bankroll}"
      print "Do you want to bet or fold: "
      input = gets.chomp.downcase

      case input
      when "bet"
        print "How much would you like to bet: "
        bet = gets.chomp.to_i
        player.bankroll -= bet
        @pot += bet
      when "fold"
        puts "Ok, you're out of this round!"
        @current_players -= [player]
      end
    end
  end

  def change_cards(players)
    players.each do |player|
      player.hand.inspect

      print "Which cards do you want to discard, #{player.name}: "
      cards = gets.chomp.split(",").map(&:to_i)
      player.hand.exchange_cards(cards) unless cards.empty?
    end
  end

  def compare_hands(players)
    max_strength = 0
    best_players = []
    players.each do |player|
      if player.hand.hand_strength >= max_strength
        max_strength = player.hand.hand_strength
        best_players << player
      end
    end

    best_players
  end

  def distribute_pot(players)
    players.each do |player|
      player.bankroll += (@pot / players.length)
    end
  end

end

adam = Player.new("adam")
aaron = Player.new('aaron')
our_game = Poker.new(adam, aaron)
our_game.play

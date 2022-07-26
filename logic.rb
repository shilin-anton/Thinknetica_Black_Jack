
#Class for gaming process operating

require './card.rb'
require './player'
require './dealer'

class Logic
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new(cards_factory)
    puts "logic is done!"
    puts "player: ", @player.hand
    puts "dealer: ", @dealer.hand
    puts "deck: "
    print @dealer.deck.first.back_view, @dealer.deck.first.front_view
  end

  private

  def cards_factory
    temp_deck = []
    (2..10).each { |n| temp_deck << n.to_s }
    ['J', 'Q', 'K', 'A'].each { |n| temp_deck << n }
    suits = ["\u2660", "\u2666", "\u2665", "\u2663"]

    complete_deck = []

    temp_deck.each do |card|
      suits.each { |suit|  complete_deck << Card.new(card, suit) }
    end

    complete_deck
  end
end


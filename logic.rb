
#Class for gaming process operating

require './card.rb'
require './player'
require './dealer'

class Logic
  BID = 10
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new(cards_factory)
  end

  def start
    #списываем ставку, перемешиваем колоду, раздаём карты
    return nil if @dealer.make_bid.nil? || @player.make_bid.nil?
    @dealer.shuffle_cards
    @dealer.bank += 20
    @player.hand = [@dealer.deck.pop, @dealer.deck.pop]
    @dealer.hand = [@dealer.deck.pop, @dealer.deck.pop]
  end

  private

  def cards_factory
    temp_deck = []
    (2..10).each { |n| temp_deck << n }
    ['J', 'Q', 'K', 'A'].each { |n| temp_deck << n }
    suits = ["\u2660", "\u2666", "\u2665", "\u2663"]

    complete_deck = []

    temp_deck.each do |card|
      suits.each { |suit|  complete_deck << Card.new(card, suit) }
    end

    complete_deck
  end
end


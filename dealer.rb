
#Dealer class; holding deck and bank
require './base_player'

class Dealer < BasePlayer
  attr_accessor :deck, :bank

  def initialize(deck)
    super()
    @bank = 0
    @deck = deck
  end
  
  def shuffle_cards
    @deck.shuffle!
  end

  def collect_cards(cards)
    @deck + cards
  end
end
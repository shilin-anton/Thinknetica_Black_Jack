
#Dealer class; holding deck and bank
require './players/base_player'

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

  def make_move
    took_card = false
    if count_points(@hand) < 17
      @hand << @deck.pop
      took_card = true
    end
    return took_card
  end

end

#Dealer class
require './base_player'

class Dealer < BasePlayer
  attr_accessor :deck

  def initialize(deck)
    super()
    @deck = deck
    puts "dealer created!"
  end

  private
  
  def shuffle_cards
    @deck.shuffle!
  end
end
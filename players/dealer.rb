# frozen_string_literal: true

require './players/base_player'

# Dealer class; holding deck and bank
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

  def make_move
    @hand << @deck.pop if count_points(@hand) < 17
  end
end

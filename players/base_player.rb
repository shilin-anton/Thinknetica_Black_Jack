# frozen_string_literal: true

require './modules/points_counter'
require './modules/hand_drawer'

# Parent class for player and dealer
class BasePlayer
  include HandDrawer
  include PointsCounter
  attr_accessor :hand, :money

  def initialize
    @hand = []
    @money = 100
  end

  def make_bid(bid)
    if @money >= bid
      @money -= bid
    else
      false
    end
  end
end

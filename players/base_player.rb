
#Parent class for player and dealer
require './modules/points_counter.rb'
require './modules/hand_drawer.rb'

class BasePlayer
  include PointsCounter, HandDrawer
  attr_accessor :hand, :money

  def initialize
    @hand = []
    @money = 100
  end

  def make_bid(bid)
    if @money >= bid
      @money -= bid
    else
      return false
    end
  end

end
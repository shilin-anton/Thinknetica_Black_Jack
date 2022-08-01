
#Parent class for player and dealer
require './modules/points_counter.rb'
require './modules/hand_drawer.rb'

class BasePlayer
  include PointsCounter, HandDrawer
  attr_accessor :hand
  attr_reader :money

  def initialize
    @hand = []
    @money = 100
  end

  def make_bid
    if @money >= 10
      @money -= 10
    else
      return false
    end
  end

end
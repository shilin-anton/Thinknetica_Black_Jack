
#Parent class for player and dealer

class BasePlayer
  attr_accessor :hand, :score
  attr_reader :money

  def initialize
    @hand = []
    @score = 0
    @money = 100
  end

  def make_bid
    if @money >= 10
      @money -= 10
    else
      return nil
    end
  end

end
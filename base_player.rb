
#Parent class for player and dealer

class BasePlayer
  attr_accessor :hand, :score

  def initialize
    @hand = []
    @score = 0
  end
end
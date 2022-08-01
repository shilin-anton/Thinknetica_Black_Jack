
#Class for gaming card representative

class Card
  attr_reader :name, :suit

  def initialize(name, suit)
    @name = name
    @suit = suit
  end
end
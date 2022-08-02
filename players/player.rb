
#Player class
require './players/base_player'

class Player < BasePlayer

  def initialize
    super
    @money = 10
  end
end
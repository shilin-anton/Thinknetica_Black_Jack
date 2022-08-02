# frozen_string_literal: true

require './players/base_player'

# Player class
class Player < BasePlayer
  def initialize
    super
    @money = 10
  end
end


#Module counts points
require './cards/card.rb'

module PointsCounter
  attr_reader :points

  TEN_POINTS = ['J', 'Q', 'K']

  def count_points(cards)
    @points = 0
    has_ace = false

    cards.each do |card|
      if card.name == 'A'
        has_ace = true
        next
      end
      if TEN_POINTS.include?(card.name)
        @points += 10
      else
        @points += card.name.to_i
      end
    end

    count_ace if has_ace

    @points
  end

  private

  def count_ace
    if @points <= 10
      @points += 11
    else 
      @points += 1
    end
  end 
end
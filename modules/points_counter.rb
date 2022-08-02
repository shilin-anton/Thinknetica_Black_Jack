
#Module counts points
require './cards/card.rb'

module PointsCounter
  attr_reader :points

  TEN_POINTS = ['J', 'Q', 'K']

  def count_points(cards)
    @points = 0

    cards.each do |card|
      if card.name == 'A'
        count_ace
      end
      if TEN_POINTS.include?(card.name)
        @points += 10
      else
        @points += card.name.to_i
      end
    end

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
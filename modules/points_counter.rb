# frozen_string_literal: true

require './cards/card'

# Module counts points
module PointsCounter
  attr_reader :points

  TEN_POINTS = %w[J Q K].freeze

  def count_points(cards)
    @points = 0

    cards.each do |card|
      count_ace if card.name == 'A'
      @points += if TEN_POINTS.include?(card.name)
                   10
                 else
                   card.name.to_i
                 end
    end

    @points
  end

  private

  def count_ace
    @points += if @points <= 10
                 11
               else
                 1
               end
  end
end

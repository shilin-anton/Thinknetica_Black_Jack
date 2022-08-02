# frozen_string_literal: true

require './cards/card'

# Module for drawing cards on hand
module HandDrawer
  TOP_LEFT = "\u250C"
  TOP_RIGHT = "\u2510"
  BOTTOM_LEFT = "\u2514"
  BOTTOM_RIGHT = "\u2518"

  def front_view(hand_deck)
    hand_deck.each_with_index do |_card, i|
      print "#{TOP_LEFT}-----#{TOP_RIGHT} "
      print "\n" if i == hand_deck.size - 1
    end

    hand_deck.each_with_index do |card, i|
      print "|#{card.suit}   #{card.suit}| "
      print "\n" if i == hand_deck.size - 1
    end

    hand_deck.each_with_index do |card, i|
      if card.name == 10
        print "|  #{card.name} | "
      else
        print "|  #{card.name}  | "
      end
      print "\n" if i == hand_deck.size - 1
    end

    hand_deck.each_with_index do |card, i|
      print "|#{card.suit}   #{card.suit}| "
      print "\n" if i == hand_deck.size - 1
    end

    hand_deck.each_with_index do |_card, i|
      print "#{BOTTOM_LEFT}-----#{BOTTOM_RIGHT} "
      print "\n" if i == hand_deck.size - 1
    end
  end

  def back_view(cards_count)
    cards_count.times do |i|
      print "#{TOP_LEFT}-----#{TOP_RIGHT} "
      print "\n" if i + 1 == cards_count
    end

    cards_count.times do |i|
      print '|* * *| '
      print "\n" if i + 1 == cards_count
    end

    cards_count.times do |i|
      print '|* * *| '
      print "\n" if i + 1 == cards_count
    end

    cards_count.times do |i|
      print '|* * *| '
      print "\n" if i + 1 == cards_count
    end

    cards_count.times do |i|
      print "#{BOTTOM_LEFT}-----#{BOTTOM_RIGHT} "
      print "\n" if i + 1 == cards_count
    end
  end
end

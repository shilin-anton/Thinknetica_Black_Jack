
#Class for gaming card representative

class Card
  TOP_LEFT = "\u250C"
  TOP_RIGHT = "\u2510"
  BOTTOM_LEFT = "\u2514"
  BOTTOM_RIGHT = "\u2518"

  def initialize(name, suit)
    @name = name
    @suit = suit
  end

  def front_view
    print "#{TOP_LEFT}-----#{TOP_RIGHT}\n"
    print "|#{@suit}   #{@suit}|\n"
    print "|  #{@name}  |\n"
    print "|#{@suit}   #{@suit}|\n"
    print "#{BOTTOM_LEFT}-----#{BOTTOM_RIGHT}\n"
  end

  def back_view
    print "#{TOP_LEFT}-----#{TOP_RIGHT}\n"
    print "|?   ?|\n"
    print "|  ?  |\n"
    print "|?   ?|\n"
    print "#{BOTTOM_LEFT}-----#{BOTTOM_RIGHT}\n"
  end
end
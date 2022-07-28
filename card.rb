
#Class for gaming card representative

class Card
  TOP_LEFT = "\u250C"
  TOP_RIGHT = "\u2510"
  BOTTOM_LEFT = "\u2514"
  BOTTOM_RIGHT = "\u2518"

  TEN_POINTS = ['J', 'Q', 'K']

  attr_reader :points

  def initialize(name, suit)
    @name = name
    @suit = suit
    get_points
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
    print "|* * *|\n"
    print "|* * *|\n"
    print "|* * *|\n"
    print "#{BOTTOM_LEFT}-----#{BOTTOM_RIGHT}\n"
  end

  private

  def get_points
    if TEN_POINTS.include?(@name)
      @points = 10
    elsif @name == 'A'
      @points = [1, 11]
    else
      @points = @name.to_i
    end
  end
end
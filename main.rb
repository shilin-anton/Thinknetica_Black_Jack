
#Main class for interface operating
require './logic'

class Main

  def initialize
    puts 'Welcome to Black Jack from Thinknetica!'
    # puts "Type smth to start the game!"
    @logic = Logic.new
  end

end

start = Main.new
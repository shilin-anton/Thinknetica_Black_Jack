
#Main class for interface operating
require './logic'

class Main

  def initialize
    puts 'Welcome to Black Jack from Thinknetica!'
    @logic = Logic.new
    puts "Type smth to start the game! (type 'quit' at any step to exit)"
    
    start
  end

  def start
    loop do
      break if gets.chomp == "quit"
      check_restart if @logic.start.nil?
    end
  end

  def check_restart
    puts "One of the player don't have enough money for bid."
    puts "Type 'restart' to restart the game or smth to exit"
    restart if gets.chomp == "restart"
    exit
  end

  def restart
    puts "RESTARTING THE GAME!"
  end

end

main = Main.new

#Main class for interface operating
require './logic'

class Main

  def initialize
    system 'clear'
    puts 'Welcome to Black Jack from Thinknetica!'
    @logic = Logic.new
    puts "Type smth to start the game! (type 'quit' at any step to exit)"
    
    start
  end

  def start
    loop do
      break if gets.chomp == "quit"
      @logic.start
      next_move
    end
  end
  
  def next_move
    restart if @logic.is_over?
    puts "1 - Take one more card, 2 - Skip move, 3 - Open cards"
    move = gets.chomp.to_i

    case move
    when 1
      take_more
    when 2
      skip_move
    when 3
      open_cards
    else
      exit
    end
  end

  def take_more
    @logic.take_card
    next_move
  end

  def skip_move
    @logic.skip_move
    next_move
  end

  def open_cards
    @logic.open_cards
  end

  def restart
    puts "Do you wanna play again?"
    puts "1 - Yes, 2 - No"

    move = gets.chomp.to_i

    case move
    when 1
      puts "START?!"
      start
    else
      exit
    end
  end

end

main = Main.new
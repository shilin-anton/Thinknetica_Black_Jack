# frozen_string_literal: true

require './logic'
require './modules/exceptions'

# Main class for interface operating
class Main
  include MyExceptions

  def initialize
    system 'clear'
    puts 'Welcome to Black Jack from Thinknetica!'
    @logic = Logic.new
    puts "Type smth to start the game! (type 'quit' at any step to exit)"

    start
  end

  def start
    loop do
      break if gets.chomp == 'quit'

      @logic.start
      next_move
    end
  rescue NotEnoughMoney
    new_game
  end

  def restart
    puts 'New round started!'
    @logic.restart
    next_move
  end

  def next_move
    round_ended if @logic.is_over?

    puts '1 - Take one more card, 2 - Skip move, 3 - Open cards'
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
    next_move
  end

  def round_ended
    puts 'Round ended. 1 - to play one more game'
    move = gets.chomp.to_i

    case move
    when 1
      restart
    else
      exit
    end
  end

  def new_game
    puts "Do you wanna start new game?\n1 - Yes"
    move = gets.chomp.to_i

    case move
    when 1
      initialize
    else
      exit
    end
  end
end

main = Main.new


#Class for gaming process operating

require './cards/card.rb'
require './players/player.rb'
require './players/dealer.rb'

class Logic
  attr_accessor :is_over
  BID = 10
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new(cards_factory)
    @winner = nil
    @is_over = false
  end

  def start
    #списываем ставку, перемешиваем колоду, раздаём карты
    @dealer.make_bid
    @player.make_bid
    @dealer.shuffle_cards
    @dealer.bank += 20
    @player.hand = [@dealer.deck.pop, @dealer.deck.pop]
    @dealer.hand = [@dealer.deck.pop, @dealer.deck.pop]

    print_info
  end

  def restart
    
  end

  def take_card
    if @player.hand.size > 2
      print_info("You can have maximum 3 cards on hand!")
    else
      @player.hand << @dealer.deck.pop
      if @dealer.make_move
        open_cards 
      else
        print_info("*** Dealer skipped move ***")
      end
    end
  end

  def skip_move
    
  end

  def open_cards
    winner, score = define_winner
    if winner.nil?
      msg = "Round draw!"
    else
      msg = "The winner is #{winner} with score: #{score}"
    end
    print_info(msg, true)
  end

  def is_over?
    return (@player.hand.size == 3 && @dealer.hand.size == 3) || @is_over
  end

  private

  def define_winner
    dealer_score = @dealer.count_points(@dealer.hand)
    player_score = @player.count_points(@player.hand)

    if (dealer_score == player_score) || (dealer_score > 21 && player_score > 21)
      return nil, player_score
    elsif (dealer_score <= 21 && dealer_score > player_score) ||
          (dealer_score <= 21 && player_score > 21)
      return @dealer.class, dealer_score
    else
      return @player.class, player_score
    end    
  end

  def print_info(msg = '', is_over = false)
    system 'clear'
    if is_over
      @dealer.front_view(@dealer.hand)
      puts "DEALER's SCORE: #{@dealer.count_points(@dealer.hand)}"
      @is_over = true
    else
      @dealer.back_view(@dealer.hand.size)
    end
    # puts "DEALER: #{@dealer.count_points(@dealer.hand)}"
    # @dealer.hand.each {|card| puts "#{card.name}"}

    @player.front_view(@player.hand)
    puts "SCORE: #{@player.count_points(@player.hand)}"
    # @player.hand.each {|card| puts "#{card.name}"}
    puts msg unless msg.empty?
  end

  def cards_factory
    temp_deck = []
    (2..10).each { |n| temp_deck << n }
    ['J', 'Q', 'K', 'A'].each { |n| temp_deck << n }
    suits = ["\u2660", "\u2666", "\u2665", "\u2663"]

    complete_deck = []

    temp_deck.each do |card|
      suits.each { |suit|  complete_deck << Card.new(card, suit) }
    end

    complete_deck
  end
end


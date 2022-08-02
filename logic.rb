
#Class for gaming process operating

require './cards/card.rb'
require './players/player.rb'
require './players/dealer.rb'
require './modules/exceptions.rb'

class Logic
  include MyExceptions

  attr_accessor :end_game
  BID = 10
  
  def initialize
    @player = Player.new
    @dealer = Dealer.new(cards_factory)
    @end_game = false
  end

  def start
    #списываем ставку, перемешиваем колоду, раздаём карты
    raise NotEnoughMoney.new("Dealer") unless @dealer.make_bid(BID)
    raise NotEnoughMoney.new("Player") unless @player.make_bid(BID)
    puts "AFTER RAISE!"
    @dealer.shuffle_cards
    @dealer.bank += BID*2
    @player.hand = [@dealer.deck.pop, @dealer.deck.pop]
    @dealer.hand = [@dealer.deck.pop, @dealer.deck.pop]

    print_info("Dealer's balance: #{@dealer.money}; Player's balance: #{@player.money}; Bank: #{@dealer.bank}")
  end

  def restart
    @end_game = false
    @dealer.deck += @player.hand + @dealer.hand
    @player.hand.clear
    @dealer.hand.clear

    start
  end

  def take_card
    if @player.hand.size > 2
      print_info("You can have maximum 3 cards on hand!")
    else
      @player.hand << @dealer.deck.pop
      dealer_move
      open_cards if is_over?
    end
  end

  def skip_move
    dealer_move
    open_cards if is_over?
  end

  def open_cards
    @end_game = true
    winner, score = define_winner
    if winner.nil?
      msg = "*** Round draw ***\n"
    else
      msg = "The winner is *** #{winner} *** with score: #{score}.\n"
    end
    msg +=  "Dealer's balance: #{@dealer.money}; Player's balance: #{@player.money}"
    print_info(msg, true)
  end


  def is_over?
    (@player.hand.size == 3 && @dealer.hand.size == 3) || @end_game
  end

  private

  def dealer_move
    if @dealer.make_move
      print_info("*** Dealer took a card ***")
    else
      print_info("*** Dealer skipped his move ***")
    end
  end

  def define_winner
    dealer_score = @dealer.count_points(@dealer.hand)
    player_score = @player.count_points(@player.hand)
    winner, score = nil, nil

    if (dealer_score == player_score) || (dealer_score > 21 && player_score > 21)
      @dealer.money += @dealer.bank/2
      @player.money += @dealer.bank/2
      score = player_score
    else
      if (dealer_score <= 21 && dealer_score > player_score) ||
         (dealer_score <= 21 && player_score > 21)
        @dealer.money += @dealer.bank
        winner = @dealer.class
        score = dealer_score
      else
        @player.money += @dealer.bank
        winner = @player.class
        score = player_score
      end
      @dealer.bank = 0
    end
    return winner, score
  end

  def print_info(msg = '', end_round = false)
    system 'clear'
    if end_round
      @dealer.front_view(@dealer.hand)
      puts "DEALER's SCORE: #{@dealer.count_points(@dealer.hand)}"
    else
      @dealer.back_view(@dealer.hand.size)
    end

    @player.front_view(@player.hand)
    puts "PLAYER's SCORE: #{@player.count_points(@player.hand)}"
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


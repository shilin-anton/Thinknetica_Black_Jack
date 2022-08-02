# frozen_string_literal: true

# Module for custom exceptions
module MyExceptions
  # Class for not enough money error
  class NotEnoughMoney < StandardError
    def initialize(name)
      system 'clear'
      puts "#{name} don't have enough money for BID!"
      super
    end
  end
end

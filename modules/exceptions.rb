
module MyExceptions
  class NotEnoughMoney < StandardError
    def initialize(name)
      system 'clear'
      puts "#{name} don't have enough money for BID!"
      super
    end
  end
end
require_relative 'deck'

module BlackJack

  class Player
    
    attr_reader :name, :hand
    attr_accessor :current_value, :hand_value, :player
    
    def initialize (name)
      @name = name
      @hand = []
      @current_value = 0
    end
    #I feel like I should have a to_s method, not sure I'm doing it right
    def to_s
     "#{@name} has #{hand} with a value of #{hand_value}"
    end
    
    def take_card deck
      hand << deck.deal_a_card
      hand
    end
    
    def take_specific_card(deck, index_number=0)
      hand << deck.deal_specific_card(index_number)
      hand
    end
    #this might be a bit redundant but I feel like it
    #makes the code more intuitive
    def hit deck
      take_card(deck)
    end
    #Program interates through the hand calling the card_value
    #of each card
    def hand_value(current_value=0)
      @current_value = current_value
      self.hand.map do |card|
        @current_value += card.card_value
      end
      @current_value
    end

    def bust?
     hand_value > 21 
    end
    
    def blackjack?
      hand_value == 21
    end
    #gives us a method for folding a busted hand
    def fold_hand
      @hand.each {|card| hand.delete(card)}
      @hand = []
    end    
  end  
end

if __FILE__ == $0
deck = BlackJack::Deck.new
deck.shuffle_deck
puts deck.new_deck

player1 = BlackJack::Player.new("jeff")
player2 = BlackJack::Player.new("clare")
player1.take_card (deck)
player2.take_card(deck)
player1.take_card (deck)
player2.take_card(deck)
player1.hit(deck)
puts "\n#{player1.name} has #{player1.hand} with a value of #{player1.hand_value}"
puts "\n#{player2.name} has #{player2.hand} with a value of #{player2.hand_value}"
end
require_relative 'card'
module BlackJack
  class Deck
    
    attr_accessor :new_deck
    
    def initialize 
      new_suits = %w(hearts spades clubs diamonds )
      new_value = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
      @new_deck = Array.new
      #creates a new array by combining the information in the
      #above two
      new_value.each do |card|
        new_suits.each do |suited|
          @new_deck << BlackJack::Card.new(card, suited)
        end 
      end
      @new_deck
    end
    
    # def create_a_deck
    #   new_suits = %w(hearts spades clubs diamonds )
    #   new_value = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
    #   @new_deck = Array.new
    #   #creates a new array by combining the information in the
    #   #above two
    #   new_value.each do |card|
    #     new_suits.each do |suited|
    #       @new_deck << BlackJack::Card.new(card, suited)
    #     end 
    #   end
    #   @new_deck 
    # end
    def card_count
      @new_deck.size
    end
    
    def shuffle_deck
      @new_deck = @new_deck.shuffle
    end
    
    def deal_a_card
      @new_deck.pop
    end

    #this method was written soley for the purpose of testing
    def deal_specific_card index_number
      @new_deck[index_number]
    end

  end
end


if __FILE__ == $0
@deck = BlackJack::Deck.new
puts @deck.deal_specific_card(0)
puts @deck.deal_a_card
end
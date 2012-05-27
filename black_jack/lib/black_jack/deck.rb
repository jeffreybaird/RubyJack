require_relative 'card'
module BlackJack
  class Deck

    def initialize 
      new_suits = %w(hearts spades clubs diamonds )
      new_value = %w(Ace 2 3 4 5 6 7 8 9 10 Jack Queen King)
      @cards = Array.new
      #creates a new array by combining the information in the
      #above two
      new_value.each do |card|
        new_suits.each do |suited|
          @cards << BlackJack::Card.new(card, suited)
        end 
      end
      @cards
    end
    
    def card_count
      @cards.size
    end

    def shuffle_deck
      @cards = @cards.shuffle
    end
    
    def deal_a_card
      @cards.pop
    end

    #this method was written soley for the purpose of testing
    def deal_specific_card index_number
      @cards[index_number]
    end

  end
end


if __FILE__ == $0
@deck = BlackJack::Deck.new
puts @deck.deal_specific_card(0)
puts @deck.deal_a_card
end
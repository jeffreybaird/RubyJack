require_relative 'deck'
require_relative 'card'

module BlackJack
  
  class Hand
    attr_reader :deck, :hand
    
    def initialize deck
      @deck = deck
      @hand = []
    end
    
    def to_s
      @deck  
    end
    
    def take_card
      hand << @deck.deal_a_card(@deck)
    end

    def take_specific_card(index_number=0)
      self.hand << @deck.deal_specific_card(deck, index_number)
      self.hand
    end
    
    def show_cards hand
      hand.each do |card|
        if card.class == Hash
          hand.delete_if {|x| x.class == Hash}
          hand << card[:hidden]
        end
      end
    end
    def hand_value(current_value=0)
      @current_value = current_value
      self.hand.each do |card|
        card = card.show_value
        @current_value += card.card_value
      end
      @current_value
    end
      def show_up_cards hand
        up_cards = []
        hand.each do |card|
          if card.class != Hash
            up_cards << card      
          end
        end 
      puts "The dealer's up-cards are #{up_cards.map { |card| card.description }.join(' ')}"
      end
  end
end

if __FILE__ == $0
@deck = BlackJack::Deck.new
@hand = BlackJack::Hand.new(@deck.create_a_deck)
@hand.take_card

end
require_relative 'player'

module BlackJack

  class Dealer < Player
    # This class deals with the special player that follows the rules of 
    # a black jack dealer in vegas
    attr_reader :in_the_hole
    
    def initialize (name="Dealer")
      super(@hand)
      @name = name
    end
    
    #one of the main differences detween a dealer and a regular player
    #is that the dealer takes one of his cards face down (in a hash)
    def take_card_face_down deck
      @in_the_hole = Hash.new
      @in_the_hole[:hidden] = deck.deal_a_card
      self.hand << in_the_hole
      self.hand
    end
    #I am trying(unsuccessfully) to establish the special rules for a deal
    #the dealer should hit at any value of 17 or below
    def dealer_play 
     if self.hand_value < 17
       self.hit
     end
    end
    #the purpose of this method is to convert the hidden card (in a hash)
    #to a normal card
    def show_cards hand
      hand.each do |card|
        if card.class == Hash
          hand.delete_if {|x| x.class == Hash}
          hand << card[:hidden]
        end
      end
    end
    # this prints out the "up cards" of the dealer
    # so that the player knows the up card
    def show_up_cards hand
      up_cards = []
      hand.each do |card|
        if card.class != Hash
          up_cards << card      
        end
      end 
      "The dealer's up-card is #{up_cards.map { |card| card.description }.join(' ')}"
    end
    
    def dealer_hits deck
      while (@value = hand_value) < 17
        puts "Dealer Hits"
        hit(deck)
      end
    end
    
    def play_dealer_game hand, deck
      show_cards(hand)
      @value = hand_value
      if @value == 21
       puts "Dealer has Black Jack!"
      else
        dealer_hits deck     
          if bust? 
            to_s
            fold_hand
          else
            to_s
            puts "Dealer Stays"
          end
      end
    end
  end  
end

if __FILE__ == $0 
  @player = BlackJack::Player.new("jeff")
  @dealer = BlackJack::Dealer.new("dealer")
  @deck = BlackJack::Deck.new
  @dealer.take_specific_card(@deck, 8)
  @dealer.take_specific_card(@deck, 9)
  @dealer.play_dealer_game(@dealer.hand,@deck)
  puts @answer

end

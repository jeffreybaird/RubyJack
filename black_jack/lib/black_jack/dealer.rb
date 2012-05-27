require_relative 'player'

module BlackJack

class Dealer < Player
  # This class deals with the special player that follows the rules of 
  # a black jack dealer in vegas
  attr_reader :in_the_hole
  
  def initialize (name="dealer")
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
  puts "The dealer's up-cards are #{up_cards.map { |card| card.description }.join(' ')}"
  end
end

if __FILE__ == $0
  # deck = BlackJack::Deck.new
  # deck.create_a_deck
  # deck.shuffle_deck
    
  # @game = BlackJack::Game.new("game") 
  @player = BlackJack::Player.new("jeff")
  @dealer = BlackJack::Dealer.new("dealer")
  @deck = BlackJack::Deck.new
  @new_deck = @deck.create_a_deck
  @dealer.take_card_face_down(@deck)
  @dealer.take_card(@deck)
  @dealer.show_up_cards(@dealer.hand)
  
  # dealer = BlackJack::Dealer.new()
  # dealer.take_card(deck)
  # dealer.take_card_face_down(deck)
  # dealer.show_up_cards(dealer.hand)
  # dealer.show_cards(dealer.hand)
  # puts "\n#{dealer.name} has #{dealer.hand} with a value of #{dealer.hand_value}"
end
end

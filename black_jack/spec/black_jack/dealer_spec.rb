require 'black_jack/game'
require 'black_jack/player'
require 'black_jack/deck'
module BlackJack

describe Deck do
  before do
  @game = BlackJack::Game.new("game1") 
  @player = BlackJack::Player.new("jeff")
  @dealer = BlackJack::Dealer.new("dealer")
  @deck = BlackJack::Deck.new
end

  it "shows cards" do
    @dealer.take_card_face_down(@deck)
    @dealer.take_card(@deck)
    @dealer.show_cards(@dealer.hand).should == [Card.new("King", "clubs"), Card.new("King", "diamonds")]
  end

  it "takes a card facedown" do
    @dealer.take_card_face_down(@deck)
    @dealer.hand.should == [{:hidden=>Card.new("King", "diamonds")}]
  end

  it "automatically takes a hit" do
    @dealer.take_specific_card(@deck, 8)
    @dealer.take_specific_card(@deck, 15)
    @dealer.play_dealer_game(@dealer.hand, @deck)
    @dealer.hand.size.should == 3
  end
  it "automatically stays" do
    @dealer.take_card_face_down(@deck)
    @dealer.take_card(@deck)
    @dealer.play_dealer_game(@dealer.hand, @deck)
    @dealer.hand.size.should == 2
  end

  it "should declare black jack" do
    @dealer.take_card_face_down(@deck)
    @dealer.take_specific_card(@deck, 0)
    @dealer.play_dealer_game(@dealer.hand, @deck).should == "Dealer has Black Jack!"
  end

  it "shows the up_cards" do
  @dealer.take_card_face_down(@deck)
  @dealer.take_card(@deck)
  @up_cards = @dealer.show_up_cards(@dealer.hand) 
  @up_cards.should == "The dealer's up-cards are King of clubs"
  end

  
end
end
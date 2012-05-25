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
  @new_deck = @deck.create_a_deck
  end

  it "shows cards" do
    @dealer.take_card_face_down(@deck)
    @dealer.take_card(@deck)
    @dealer.show_cards(@dealer.hand).should == ["King of clubs", "King of diamonds"]
  end

  it "takes a card facedown" do
    @dealer.take_card_face_down(@deck)
    @dealer.hand.should == [{:hidden=>"King of diamonds"}]
  end

  it "automatically takes a hit"

  it "automatically stays"

  it "shows the up_cards" do
    @dealer.take_card_face_down(@deck)
    @dealer.take_card(@deck)
    @up_cards = @dealer.show_up_cards(@dealer.hand)
    @up_cards.should == "The dealer's up-cards are ['King of clubs']"
  end

  
end
end
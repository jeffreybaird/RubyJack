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
  
  it "Has 52 cards" do
    @deck.new_deck.size.should == 52
  end
  
  it "shuffles the deck" do
    @deck.shuffle_deck
    @new_deck[0].should_not == "Ace of hearts"
  end
  
  it "deals a card" do
    @deck.deal_a_card.should == "King of diamonds"
  end
  
  it "deals a specific card" do
    @deck.deal_specific_card(0).should == "Ace of hearts"
  end
  
end
end
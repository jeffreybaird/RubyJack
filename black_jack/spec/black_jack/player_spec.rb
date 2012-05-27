require 'black_jack/game'
require 'black_jack/player'
require 'black_jack/deck'
module BlackJack

describe Game do
  before do
  @game = BlackJack::Game.new("game1") 
  @player = BlackJack::Player.new("jeff")
  @dealer = BlackJack::Dealer.new("dealer")
  @deck = BlackJack::Deck.new
  @deck.create_a_deck
  end
  
  it "has a to_s method" do
    @player.to_s.should == "jeff's hand is worth 0"
  end
  
  it "takes a card" do
    @player.take_card(@deck)
    @player.hand.should == [Card.new("King","diamonds")]
  end
  
  it "takes a hit" do
    @player.hit(@deck)
    @player.hand.should == [Card.new("King","diamonds")]
  end
  
  it "determines the point value of a hand" do
    @player.hit(@deck)
    @player.hand_value.should == 10
  end
  
  it "busts a player" do
    @player.take_card(@deck)
    @player.take_card(@deck)
    @player.take_card(@deck)
    @player.bust?.should be_true
  end
  
  it "doesn't bust a player" do
    @player.take_card(@deck)
    @player.bust?.should be_false
  end
  
  it "folds a hand" do
    @player.take_card(@deck)
    @player.fold_hand
    @player.hand_value.should == 0
  end
  
  context "Has Black Jack" do
    before do
      @game = BlackJack::Game.new("game1") 
      @player = BlackJack::Player.new("jeff")
      @dealer = BlackJack::Dealer.new("dealer")
      @deck = BlackJack::Deck.new
      @deck.create_a_deck
      @deck.deal_specific_card(0)
      @deck.deal_a_card
    end
    it "declares black jack" do
      @player.bust?.should be_true
    end
  end
end
end


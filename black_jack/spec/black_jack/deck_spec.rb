require 'black_jack/game'
require 'black_jack/player'
require 'black_jack/deck'
module BlackJack

describe Deck do
  before do
  @deck = BlackJack::Deck.new
  end
  
  it "Has 52 cards" do
    @deck.card_count.should == 52
  end

  it "shuffles the deck" do
    @deck.shuffle_deck
    @deck.deal_specific_card(0).should_not == BlackJack::Card.new("Ace", "hearts")
  end
  
  it "deals a card" do
    @deck.deal_a_card.should == Card.new("King", "diamonds")
  end
  
  it "deals a specific card" do
    @deck.deal_specific_card(0).should == Card.new("Ace", "hearts")
  end
  
end
end
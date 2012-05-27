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
  
  it "has a name" do
    @game.game_name.should_not be_nil
  end
  
  it "adds a player to the game"
    # @game.add_player(@player)
    #     @game.each{|x| puts x}.should == "jeff's hand is worth 0"
  
  it "prints the players out"
    # @game.add_player(@dealer).should == [dealers hand is worth 0]
    #    @game.print_players.should == "dealer has []"
  
  
  it "deals out a card" do
    @game.take_card(@deck).should == [Card.new("King","diamonds")]
  end
  
  it "can 'hit'" do
    @game.hit(@deck).should == [Card.new("King","diamonds")]
  end
end
end
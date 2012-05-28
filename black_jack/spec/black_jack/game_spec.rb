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
      @game.add_player(@player)
    end
    
    it "has a name" do
      @game.game_name.should_not be_nil
    end
    
    it "adds a player to the game" do
      @game.players[0].to_s.should == "jeff's hand is worth 0"
    end

    it "prints the players out" do
      @player.take_card(@deck)
      @game.print_player(0).should == "jeff's hand is worth 10"
    end
    it "deals out a card" do
      @game.take_card(@deck).should == [Card.new("King","diamonds")]
    end
    
    it "can 'hit'" do
      @game.hit(@deck).should == [Card.new("King","diamonds")]
    end
  end
end
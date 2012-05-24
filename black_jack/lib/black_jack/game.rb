require_relative 'player'
require_relative 'dealer'

module BlackJack
  
#this is a fairly self-explanitory section

class Game
  attr_reader :players, :game_name
  def initialize game_name, num_players=2
    @game_name = game_name
    @num_players = num_players
    @players = []
  end
  
  #adds a player to the game, doesn't really work the way I 
  #want it to :(
  
  def add_player a_player
    @players.push(a_player)
  end
  
  #a method to easily print out the player
  
  def print_players(players=@players)
    players.each do |player|
      puts "#{player.name} has #{player.hand}"
    end
  end
  
  #we don't use the two methods below (they are also in player)
  #I feel like they should be here

  def take_card deck=@deck, player=@player
    @hand = []
    @hand << deck.deal_a_card
    @hand
  end

  def hit deck
    self.take_card (deck)
  end
   
end

end

if __FILE__ == $0
game = BlackJack::Game.new("game1")  
  
deck = BlackJack::Deck.new
deck.create_a_deck
deck.shuffle_deck
puts deck.new_deck

player1 = BlackJack::Player.new("jeff")
player2 = BlackJack::Player.new("clare")
game.add_player(player1)
game.add_player(player2)
player1.take_card (deck)
player2.take_card(deck)
player1.take_card (deck)
player2.take_card(deck)
player1.hit(deck)
player2.hit(deck)
game.play_game
game.print_players
game.bust?(player1)
game.bust?(player2)
end
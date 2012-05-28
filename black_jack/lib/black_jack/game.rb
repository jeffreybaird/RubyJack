require_relative 'player'
require_relative 'dealer'

module BlackJack

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
      
      def print_player index_number
        @players[index_number].to_s 
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

    #I want this to be in the "Game Class" main purpose here is to get the game started
    def start
      puts "What do you want to name your game?"
      game_name = gets.chomp
      game_game = game_name.capitalize
      @game = BlackJack::Game.new(game_name)
    end

    #Another method that should be in the Game class
    def name_a_player
      puts "What is your name?"
      @player = BlackJack::Player.new(gets.capitalize.chomp)
    end

    #I think this can be cleaned up and moved to the Game class
    #this deals the game
    def deal
      @deck = BlackJack::Deck.new
      @dealer = BlackJack::Dealer.new()
      @deck.shuffle_deck
      @player.take_card(@deck)
      @player.take_card(@deck)
      @dealer.take_card(@deck)
      @dealer.take_card_face_down(@deck)
      puts "Your cards are #{@player.hand}"
      @dealer.show_up_cards(@dealer.hand)
    end

    #I want this to check for a bust/blackjack and end the game
    #doesn't currently work the way I want it to
    def check_bust
      if @player.bust?
        determine_a_winner(@player, @dealer)
        abort("Thanks for playing!")
      else
        play
      end
    end

    #gives the player a hit should be in game class
    def player_hits player=@player, deck=@deck, dealer=@dealer, game=@game
      player.hit(deck)
      puts "#{player.name} has #{player.hand} with a value of #{player.hand_value}"
      check_bust
    end

    #runs if stay
    def player_stays player=@player, dealer=@dealer
     dealer.show_cards(dealer.hand)
     puts "#{player.name} has #{player.hand} with a value of #{player.hand_value}"
     puts "#{dealer.name} has #{dealer.hand} with a value of #{dealer.hand_value}"
     determine_a_winner(player, dealer)
    end

    #allows the player to quit
    def player_quits
     puts "are you sure you want to quit? (y/n)"
     quit = gets.downcase.chomp
     case quit
     when 'y'
       abort("play again soon!")
     when 'n'
       play
     else
       puts "please enter 'y' or 'n'"
     end
    end

    #again should be in game class
    #figures out who wins
    def determine_a_winner player, dealer
      @game.print_players
      if player.hand_value > dealer.hand_value
        puts "#{player.name} wins!"
        abort("Thanks for playing!")
      elsif player.hand_value == 21
        puts "#{player.name} wins!"
        abort("Thanks for playing!")
      else
        puts "#{dealer.name} wins!"
        abort("Thanks for playing!")
      end
    end

    #again want this to be in the game class
    def play
      player = @player
      deck   = @deck
      dealer = @dealer
      puts "Do you want to 'hit' or 'stay'?"
        loop do
        hit_stay = gets.downcase.chomp
          case hit_stay
          when 'hit'
            player_hits(player, deck)
          when 'stay'
            player_stays
            break
          when 'quit'
            player_quits
          else
            puts "please type 'hit', 'stay' or 'quit'"
          end
        end
    end
  end
end

if __FILE__ == $0
game = BlackJack::Game.new("game1")   
deck = BlackJack::Deck.new
player1 = BlackJack::Player.new("jeff")
player2 = BlackJack::Player.new("clare")
game.add_player(player1)
game.add_player(player2)
game.print_players
end
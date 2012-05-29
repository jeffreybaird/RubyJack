require_relative 'player'
require_relative 'dealer'

module BlackJack

  class Game
    attr_reader :players, :game_name
    def initialize game_name
      @game_name = game_name
      @players = []
    end
    
    #adds a player to the game, doesn't really work the way I 
    #want it to :(
    
    def add_player a_player
      @players.push(a_player)
    end
    
    def to_s
      @players.each {|x| puts "#{x.to_s}" }
    end

    def start
      @game = BlackJack::Game.new("game")
    end

    def name_a_player
      puts "What is your name?"
      @player = BlackJack::Player.new(gets.capitalize.chomp)
    end

    def deal player
      name_a_player
      @deck = BlackJack::Deck.new
      @dealer = BlackJack::Dealer.new()
      @deck.shuffle_deck
      initial_deal @deck, @player, @dealer
    end
    
    def initial_deal deck, player, dealer
      @player.take_card(deck)
      @player.take_card(deck)
      @dealer.take_card(deck)
      @dealer.take_card_face_down(deck)
      shows_the_table
    end
    
    def shows_the_table
      "Your cards are #{@player.hand}, #{@dealer.show_up_cards(@dealer.hand)}"
    end

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
      puts player
      check_bust
    end

    #runs if stay
    def player_stays player=@player, dealer=@dealer
     dealer.show_cards(dealer.hand)
     puts player
     puts dealer
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
      @game.to_s
      dealer.play_dealer_game(dealer.hand, @deck)
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
@player = BlackJack::Player.new("jeff")
game.deal(@player)

player2 = BlackJack::Player.new("clare")
game.add_player(player1)
game.add_player(player2)
game.to_s
end
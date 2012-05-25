require_relative 'deck'
require_relative 'card'

module BlackJack

class Player
  
  attr_reader :name, :hand
  attr_accessor :current_value, :hand_value
  
  def initialize (name)
    @name = name
    @hand = []
    @current_value = 0
  end
  #I feel like I should have a to_s method, not sure I'm doing it right
  def to_s
   "#{@name}'s hand is worth #{self.hand_value}"
  end
  
  def take_card deck
    self.hand << deck.deal_a_card
    self.hand
  end
  
  def take_specific_card(deck=@deck, index_number=0)
    self.hand << deck.deal_specific_card(deck, index_number)
    self.hand
  end
  #this might be a bit redundant but I feel like it
  #makes the code more intuitive
  def hit deck
    self.take_card(deck)
  end
  #Program interates through the hand calling the card_value
  #of each card
  def hand_value(current_value=0)
    @current_value = current_value
    self.hand.each do |card|
      @current_value += card.card_value
    end
    @current_value
  end
  #When the hand has a value of over 21 it busts and declares true 
  #when it equals 21 it declares blackjack and returns true
  def bust?
   if hand_value > 21 
     fold_hand
     puts "#{@name} is Bust!"
     true
   elsif hand_value == 21
     puts "BlackJack!"
     true
   else
     puts "#{@name}'s hand is worth #{self.hand_value}"
     false
   end
  end
  #gives us a method for folding a busted hand
  def fold_hand
    @hand.each {|card| hand.delete(card)}
    @hand = []
<<<<<<< HEAD
  end 
  def play_an_ace
    puts "You've been dealt an Ace!"
    puts "Do you want to play this as a 1 or an 11? Type: (1/11)"
    answer = gets.chomp.to_i
      if answer == 1
        1
      elsif answer == 11
        11
      else
        puts "Please enter either a 1 or 11"
      end
      play_game
  end
   
  #I hate this method and feel like there is a much easier
  #way of doing it.
  def card_value card
    if card =~ /Queen/
      10
    elsif card =~ /King/
      10
    elsif card =~ /Jack/
      10
    elsif card =~ /Ace/
      puts "You've been dealt an Ace!"
      puts "Do you want to play this as a 1 or an 11? Type: (1/11)"
      answer = gets.chomp.to_i
        if answer == 1
          @value = 1
        elsif answer == 11
          @value = 11
        else
          puts "Please enter either a 1 or 11"
        end
        @value
    elsif card =~ /2/
      2
    elsif card =~ /3/
      3
    elsif card =~ /4/
      4    
    elsif card =~ /5/
      5
    elsif card =~ /6/
      6
    elsif card =~ /7/
      7
    elsif card =~ /8/
      8
    elsif card =~ /9/
      9
    elsif card =~ /10/
      10
    else
      0
    end
  end
=======
  end  
>>>>>>> 8b0c6e2544ea03d7da19934fa4f5a080762c3e38
  
end  
end

if __FILE__ == $0
deck = BlackJack::Deck.new
deck.create_a_deck
deck.shuffle_deck
puts deck.new_deck

player1 = BlackJack::Player.new("jeff")
player2 = BlackJack::Player.new("clare")
player1.take_card (deck)
player2.take_card(deck)
player1.take_card (deck)
player2.take_card(deck)
player1.hit(deck)
puts "\n#{player1.name} has #{player1.hand} with a value of #{player1.hand_value}"
puts "\n#{player2.name} has #{player2.hand} with a value of #{player2.hand_value}"
end
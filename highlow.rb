require 'colorize'
require_relative 'casino'
require 'pry'

class Player

  def update_balance(num)
    @bank_roll += num
  end
end



class Highlow
  attr_accessor :deck
  def initialize
    @deck = Deck.new
  end

end


class Card
 attr_accessor :rank, :suit, :color
 def initialize(rank, suit, color)
   @rank = rank
   @suit = suit
   @color = color
 end
end

class Deck
 attr_accessor :cards

 def initialize
   @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
   @suits = %w(Spades Diamonds Clubs Hearts)
   @cards = []
   generate_deck
 end

 def generate_deck
   @suits.each do |suit|
     @ranks.size.times do |i|
       # Ternary Operator
       color = (i % 2 == 0) ? 'Black' : 'Red'
       @cards << Card.new(@ranks[i], suit, color)
     end
   end
 end
end

def start
  @new_game = Highlow.new
  generate_cards
end

def generate_cards
  @card_1 = @new_game.deck.cards.sample
  @card_2 = @new_game.deck.cards.sample
  place_bet
end

def place_bet
  puts "Welcome to HighLow"
  puts "Your card is: #{@card_1.rank} #{@card_1.suit}"
  puts "\nAre you betting High or Low?"
  @bet = gets.strip.downcase
  puts "You're betting #{@bet}"
  puts "\nYour 2nd card is: #{@card_2.rank} #{@card_2.suit}"
  bet
end


def bet
  #add some logic if Q or A
  if @card_2.rank < @card_1.rank
      puts "Its LOW"
        if @bet == 'low'
          puts "You win $50".colorize(:green)
          # player.update_balance(50)
          play_again
        else
          puts "You lose $50".colorize(:red)
          # player.update_balance(-50)
          play_again
        end
  else
    puts "Its HIGH"
      if @bet == 'high'
        puts "You win $50".colorize(:green)
        # player.update_balance(50)
        play_again
      else
        puts "You lose $50".colorize(:red)
        # player.update_balance(-50)
        play_again
      end
  end
end

def play_again
  puts "Would you like to: "
  puts "1. Play again"
  puts "2. Play Slots"
  puts "3. Back to main Casino"
  puts "4. Exit"

  again = gets.chomp.to_i

  case again
    when 1
      generate_cards
    when 2
      #link to slots
      puts "go to slots"
    when 3
      Casino.new
    when 4
      exit
    else
      puts "Invalid entry, try again"
      play_again
  end
end

start

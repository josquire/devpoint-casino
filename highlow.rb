#Card deck is constructed
#first card is shown
#user guess higher or lower
#if correct game continues - right all times player wins. add to bankroll go to menu
#if wrong - game is terminated - take from bank_roll
#play again? or exit to main menu


class Highlow
  #attr_accessor
  def initialize
    puts 'Welcome to High Low'



  end

end


class Card
 # Getter and Setter methods for rank, suit and color
 attr_accessor :rank, :suit, :color
 # Gets called when you call the new method to create an instance
 # card = Card.new('10', 'K', 'Black')
 def initialize(rank, suit, color)
   @rank = rank
   @suit = suit
   @color = color
 end
end



class Deck
 # Getter and Setter methods for rank, suit and color
 attr_accessor :cards

 #Gets called when you call the new method to create an instance
 #deck = Deck.new
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



# Instantiate a new deck
d = Deck.new
# Get all the cards in the deck
puts d.cards

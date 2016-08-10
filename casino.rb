#our casino

require'pry'
require'colorize'
require_relative'highlow'
require_relative'slots'
#require_relative 'roulette'
#require_relative 'blackjack'
#binding.pry
module Person
  class Player
    attr_accessor :player, :bank_roll
    # attr_accessor :name, :bank_roll

    def initialize
      puts "Whats your name?"
      @name = gets.strip
      puts "How much do you want to start with?"
      @bank_roll = gets.strip.to_f
      #set up instance variables
      #by getting user input
      #like name, age, wallet amount
      #should wallet be its own class?
    end

    def self.greeting
      puts "Welcome #{@name}, good luck with your: #{@bank_roll} dollars!"
    end

    def self.check_balance
      puts "Your balance is #{@bank_roll}"
    end

    def balance
      puts "your balance is: "
    end

    def update_balance(op, num)
      @bank_roll = @bank_roll.send(op, num)
      puts @bank_roll
    end

    def update_balance(op, num)
      @bank_roll = @bank_roll.send(op, num)
      puts @bank_roll
    end
  end
end

# player_1 = Player.new(name, bank_roll)

class Casino
  # make sure you use attr_accessor
  def initialize
    puts "Welcome to the Casino!"
    # should allow the user to keep playing games
    # while loop??
    # should allow the user to keep making menu choices
    # even if it's an invalid choice
    initialize_player
    choose_game
    # binding.pry
  end

  def choose_game
    user_choice = Casino.menu
    menu_choice(user_choice)
  end

  def initialize_player
    $player = Person::Player.new
    Person::Player.greeting
  end

  def self.menu
    puts "CASINO MENU"
    puts "1. High / Low"
    puts "2. Slots"
    puts "3. Black Jack"
    puts "4. Check Balance"
    puts "5. Roulette"
    puts "6. Exit"
    return gets.to_i
  end

  def menu_choice(user_choice)
    case user_choice
    when 1
      puts 'Playing High Low'
      Highlow.generate_cards
      # choose_game
    when 2
      puts 'Playing Slots'
      Slot::Slots.playing_slots
      # choose_game
    when 3
      puts 'black_jack'
      Blackjack.playing_blackjack
      puts ' '
    when 5
      puts 'Roulette'
      Roulette.start
      puts ' '
    when 4
      puts "Your balance is: #{$player.bank_roll}"
    when 6
      puts 'Thanks for playing come back soon!'
      exit
    else
      puts 'Invalid menu choice'
    end
    choose_game
  end

  def goodbye
    puts "goodbye please comeback to the casino again!"
    exit
  end
end

#end of casino class

@casino = Casino.new
# @casino.playing_slots

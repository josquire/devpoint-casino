require "pry"
require "colorize"
require_relative "highlow"
require_relative "slots"
# require 'colorize'

class Player
  attr_accessor :player
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

  def greeting
    puts "Welcome #{@name}, good luck with your: #{@bank_roll} dollars!"
  end

  def check_balance
    puts "Your balance is #{@bank_roll}"
    Casino.menu
  end

  def update_balance(op, num)
    @bank_roll = @bank_roll.send(op, num)
    puts @bank_roll
  end

  def update_balance(op, num)
    @bank_roll = @bank_roll.send(op, num)
    puts @bank_roll
  end

  def wallet
    # after amount is entered to bet wallet needs to have a balance
    # when the game is played and player wins or looses wallet increases and decreases
    # after game has plus or minus wallet player can play another game with the wallet he had from last game
    # wallet travels game to game
    # player travels game
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
    @player = Player.new
    @player.greeting
  end

  def self.menu
    puts "CASINO MENU"
    puts "1. High / Low"
    puts "2. Slots"
    puts "3. Black Jack"
    puts "4. Check Balance"
    puts "5. Exit"
    return gets.to_i
  end

  def menu_choice(user_choice)
    case user_choice
    when 1
      puts 'Playing High Low'
      Highlow.start
      choose_game
    when 2
      puts 'Playing Slots'
      playing_slots
      puts ' '
      # Create a new slots instance - slots = Slot.new
      # slot.play
      # hint: think about how to get player instance into the game
    when 3
      @player.check_balance
    when 4
      puts 'black_jack'
      black_jack
      puts ' '

    when 5
      puts 'Thanks for playing come back soon!'
      exit
    else
      puts 'Invalid menu choice'
      menu_choice(5)
    end
  end

  def goodbye
    puts "goodbye please comeback to the casino again!"
    exit
  end
end

# end #end of casino class

@casino = Casino.new
# @casino.playing_slots

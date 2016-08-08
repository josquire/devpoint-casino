require 'pry'
require 'colorize'

class Player
  #attr_accessor
  attr_accessor :name, :bank_roll

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
  end

end


class Casino
  # make sure you use attr_accessor
  attr_accessor :player

  def initialize
    puts "Welcome to the Casino!"
    @player = Player.new
    @player.greeting
    # should allow the user to keep playing games
    # while loop??
    # should allow the user to keep making menu choices
    # even if it's an invalid choice
    user_choice = menu
    menu_choice(user_choice)
    # binding.pry
  end

  def menu
    puts "CASINO MENU"
    puts "1. High / Low"
    puts "2. Slots"
    puts "3. Check Balance"
    puts "4. Exit"
    gets.to_i
  end

  def menu_choice(user_choice)
    case user_choice
      when 1
        puts 'Playing High Low'
        # Create a new high / low instance - hl = HighLow.new
        # hl.play
      when 2
        puts 'Playing Slots'
        # Create a new slots instance - slots = Slot.new
        # slot.play
        # hint: think about how to get player instance into the game
      when 3
        @player.check_balance
      when 4
        puts 'Thanks for playing come back soon!'
        exit
      else
        puts 'Invalid menu choice'
        menu_choice
      end
  end

end

Casino.new

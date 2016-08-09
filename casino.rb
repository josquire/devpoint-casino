require "pry"
require "colorize"
require_relative "highlow"
# require 'colorize'

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
    user_choice = Casino.menu
    menu_choice(user_choice)
    # binding.pry
  end

  def initialize_player
    @player = Player.new
    @player.greeting
  end

  def self.menu
    puts "CASINO MENU"
    puts "1. High / Low"
    puts "2. Slots"
    puts "3. BLack Jack"
    puts "4. Check Balance"
    puts "5. Exit"
    gets.to_i
  end

  def repeat_slots
    print 'enter $50 to play slots press "a" to continue "b" to quit: '
    player = gets.strip
    if player  == 'a'
      playing_slots
    elsif player == 'b'
      puts "Thank you for playing Slots!"
      puts "If you would like to play another game type 'y' or type 'n' to exit the casino"
      print ">>> :"

      #TODO FIX y_n: inputing y calls wrong choice!

      y_n = gets.to_s
        case y_n
        when 'y'
          Casino.new
        when 'n'
          goodbye
        end

        # if y_n == "y"
        #   Casino.new
        # else
        #   y_n == "n"
        #   goodbye
        # end
    end
  end

  def playing_slots

    slot_options = ["grapes", "strawberries", "lemons", "avocado"]
    col_1 = slot_options.sample
    col_2 = slot_options.sample
    col_3 = slot_options.sample
    puts "#{col_1} #{col_2} #{col_3} "
    if @player.bank_roll <= 0
      puts 'ooooowwwww!!! your out of money'
      goodbye
    end
    if col_1 == col_2 && col_1 == col_3
      puts 'you win $10,000'.colorize(:blue)
      # @bank_roll += 10000
      @player.update_balance('+', 10000)
      repeat_slots
    else
      puts 'you lose $50'.colorize(:red)
      @player.update_balance('-', 50)
      repeat_slots 
      # binding.pry
      # @bank_roll -= 50
    end
    # binding.pry
    repeat_slots
  end

#   def repeat_black_jack
#     print  'enter to play black jack press "a" to continue "b" to quit'
#     player = gets.strip
#     if player == 'a'
#       black_jack
#     if player == 'b'
#         goodbye
#       end
#   end
# module Blackjack
#   VERSION = "0.1.0"
# end
 
#   def black_jack
#   end
#   repeat_black_jack
# end

  def menu_choice(user_choice)
    case user_choice
    when 1
      puts 'Playing High Low'
      # Create a new high / low instance - hl = HighLow.new
      # hl.play
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
      menu_choice
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

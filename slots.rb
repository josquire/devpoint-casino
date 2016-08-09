require 'colorize'
require_relative 'casino'
require 'pry'

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
